import 'dart:math';
import 'package:uuid/uuid.dart';
import '../../data/content/content_repository.dart';
import '../../domain/entities/game_models.dart';
import 'economy_engine.dart';
import 'map_engine.dart';
import 'tech_engine.dart';
import 'war_engine.dart';

class AiEngine {
  AiEngine(this._random, this._economy, this._tech, this._war, this._map);

  final Random _random;
  final EconomyEngine _economy;
  final TechEngine _tech;
  final WarEngine _war;
  final MapEngine _map;
  final _uuid = const Uuid();

  GameState processAiTurn(GameState state, GameContent content) {
    var tiles = state.tiles;
    var aiCountries = <Country>[];
    var wars = [...state.wars];
    var pacts = [...state.pacts];
    var logs = [...state.log];
    var player = state.player;

    for (var country in state.aiCountries) {
      if (!country.isAlive) {
        aiCountries.add(country);
        continue;
      }

      country = _economy.tick(country, content);
      country = _tech.tickResearch(country, content);

      final nextEra = _tech.checkEraAdvancement(country, content);
      if (nextEra != null) {
        country = _tech.advanceEra(country, nextEra, content);
        logs.add(
          GameLogEntry(
            turn: state.turn,
            message: '${country.name} enters the ${content.eraById(nextEra).name}.',
            tone: 'ai',
          ),
        );
      }

      // Research pick
      if (country.researchingTechId.isEmpty) {
        final options = content.technologies.where((t) {
          if (country.researchedTechIds.contains(t.id)) return false;
          return t.prerequisites.every(country.researchedTechIds.contains);
        }).toList();
        if (options.isNotEmpty) {
          final pick = options[_random.nextInt(options.length)];
          country = _tech.startResearch(country, pick.id, content);
        }
      }

      // Expand borders
      if (_random.nextDouble() < 0.55) {
        tiles = _map.expandBorder(tiles: tiles, ownerId: country.id);
      }

      // Diplomacy / war toward player and peers
      final relations = Map<String, int>.from(country.relations);
      final playerRel = relations[player.id] ?? 0;

      if (country.personality == LeaderPersonality.aggressive ||
          country.personality == LeaderPersonality.expansionist) {
        if (playerRel < 20 && _random.nextDouble() < 0.12) {
          relations[player.id] = playerRel - 15;
          final atWar = wars.any(
            (w) =>
                w.active &&
                ((w.attackerId == country.id && w.defenderId == player.id) ||
                    (w.defenderId == country.id && w.attackerId == player.id)),
          );
          if (!atWar) {
            wars.add(
              WarRecord(
                id: _uuid.v4(),
                attackerId: country.id,
                defenderId: player.id,
                startTurn: state.turn,
                log: ['${country.name} declares war on ${player.name}!'],
              ),
            );
            logs.add(
              GameLogEntry(
                turn: state.turn,
                message: '${country.name} declares war!',
                tone: 'danger',
              ),
            );
            final playerRelations = Map<String, int>.from(player.relations);
            playerRelations[country.id] = (playerRelations[country.id] ?? 0) - 30;
            player = player.copyWith(relations: playerRelations);
          }
        }
      }

      if (country.personality == LeaderPersonality.peaceful &&
          playerRel > -10 &&
          _random.nextDouble() < 0.08) {
        final hasPact = pacts.any(
          (p) =>
              p.type == 'alliance' &&
              ((p.aId == country.id && p.bId == player.id) ||
                  (p.bId == country.id && p.aId == player.id)),
        );
        if (!hasPact) {
          pacts.add(
            DiplomacyPact(
              id: _uuid.v4(),
              type: 'trade',
              aId: country.id,
              bId: player.id,
              startTurn: state.turn,
            ),
          );
          relations[player.id] = playerRel + 8;
          logs.add(
            GameLogEntry(
              turn: state.turn,
              message: '${country.name} proposes trade relations.',
              tone: 'diplomacy',
            ),
          );
        }
      }

      // Revolution chance
      if (country.stability < 25 && _random.nextDouble() < 0.1) {
        final govs = content.governments
            .where((g) => g.id != country.governmentId)
            .toList();
        if (govs.isNotEmpty) {
          final g = govs[_random.nextInt(govs.length)];
          country = country.copyWith(
            governmentId: g.id,
            stability: 45,
            happiness: (country.happiness - 10).clamp(0, 100),
          );
          logs.add(
            GameLogEntry(
              turn: state.turn,
              message: 'Revolution in ${country.name}! Now ruled by ${g.name}.',
              tone: 'ai',
            ),
          );
        }
      }

      // Collapse
      final pop = country.cities.fold<double>(0, (s, c) => s + c.population);
      if (pop < 5 || (country.militaryStrength < 1 && country.stability < 10)) {
        country = country.copyWith(isAlive: false);
        logs.add(
          GameLogEntry(
            turn: state.turn,
            message: '${country.name} has collapsed.',
            tone: 'danger',
          ),
        );
      }

      // Active wars: AI skirmish
      for (final war in wars.where((w) => w.active)) {
        if (war.attackerId == country.id || war.defenderId == country.id) {
          final enemyId =
              war.attackerId == country.id ? war.defenderId : war.attackerId;
          if (enemyId == player.id && _random.nextDouble() < 0.4) {
            final result = _war.resolveAction(
              state: state.copyWith(player: player, aiCountries: [
                ...aiCountries,
                country,
                ...state.aiCountries.where(
                  (c) =>
                      c.id != country.id &&
                      !aiCountries.any((a) => a.id == c.id),
                ),
              ]),
              content: content,
              targetId: country.id,
              action: WarAction.defend,
            );
            // Simplify: apply attrition on AI only
            country = country.copyWith(
              militaryStrength:
                  (country.militaryStrength - 3 - _random.nextDouble() * 6)
                      .clamp(0, 9999),
            );
            logs.add(
              GameLogEntry(
                turn: state.turn,
                message: '${country.name} presses the war front.',
                tone: 'war',
              ),
            );
            // silence unused
            result;
          }
        }
      }

      country = country.copyWith(relations: relations);
      aiCountries.add(country);
    }

    // AI vs AI light interactions
    if (aiCountries.length >= 2 && _random.nextDouble() < 0.15) {
      final a = aiCountries[_random.nextInt(aiCountries.length)];
      var b = aiCountries[_random.nextInt(aiCountries.length)];
      if (a.id != b.id && a.isAlive && b.isAlive) {
        if (_random.nextBool()) {
          pacts.add(
            DiplomacyPact(
              id: _uuid.v4(),
              type: 'alliance',
              aId: a.id,
              bId: b.id,
              startTurn: state.turn,
            ),
          );
          logs.add(
            GameLogEntry(
              turn: state.turn,
              message: '${a.name} and ${b.name} form an alliance.',
              tone: 'diplomacy',
            ),
          );
        } else {
          wars.add(
            WarRecord(
              id: _uuid.v4(),
              attackerId: a.id,
              defenderId: b.id,
              startTurn: state.turn,
              log: ['${a.name} attacks ${b.name}.'],
            ),
          );
          logs.add(
            GameLogEntry(
              turn: state.turn,
              message: 'War erupts between ${a.name} and ${b.name}.',
              tone: 'war',
            ),
          );
        }
      }
    }

    return state.copyWith(
      player: player,
      aiCountries: aiCountries,
      tiles: tiles,
      wars: wars,
      pacts: pacts,
      log: logs.length > 200 ? logs.sublist(logs.length - 200) : logs,
    );
  }
}
