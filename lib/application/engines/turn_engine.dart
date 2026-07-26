import 'dart:math';
import 'package:uuid/uuid.dart';
import '../../core/constants/game_constants.dart';
import '../../data/content/content_repository.dart';
import '../../domain/entities/game_models.dart';
import '../../domain/entities/resources.dart';
import 'ai_engine.dart';
import 'economy_engine.dart';
import 'event_engine.dart';
import 'map_engine.dart';
import 'tech_engine.dart';
import 'war_engine.dart';

class TurnEngine {
  TurnEngine({Random? random}) : _random = random ?? Random() {
    map = MapEngine(_random);
    economy = EconomyEngine();
    events = EventEngine(_random);
    tech = TechEngine();
    war = WarEngine(_random);
    ai = AiEngine(_random, economy, tech, war, map);
  }

  final Random _random;
  final _uuid = const Uuid();

  late final MapEngine map;
  late final EconomyEngine economy;
  late final EventEngine events;
  late final TechEngine tech;
  late final WarEngine war;
  late final AiEngine ai;

  GameState createNewGame({
    required String civilizationName,
    required GameContent content,
  }) {
    var tiles = map.generateWorld();
    final spawn = map.findSpawn(tiles, preferCoast: true) ?? (12, 18);

    final capital = City(
      id: _uuid.v4(),
      name: '$civilizationName Camp',
      x: spawn.$1,
      y: spawn.$2,
      population: GameConstants.startingPopulation.toDouble(),
      buildingIds: ['campfire'],
      visualTier: 'village',
    );

    tiles = map.claimAround(
      tiles: tiles,
      cx: spawn.$1,
      cy: spawn.$2,
      ownerId: GameConstants.playerCountryId,
      radius: 2,
    );
    tiles = [
      for (final t in tiles)
        if (t.x == spawn.$1 && t.y == spawn.$2)
          t.copyWith(hasCity: true, ownerId: GameConstants.playerCountryId)
        else
          t,
    ];

    final player = Country(
      id: GameConstants.playerCountryId,
      name: civilizationName,
      colorHex: '#2E5AAC',
      governmentId: 'tribal_council',
      personality: LeaderPersonality.expansionist,
      resources: const Resources(
        food: 120,
        wood: 80,
        stone: 40,
        money: 50,
        science: 10,
      ),
      cities: [capital],
      army: [const ArmyUnit(unitDefId: 'hunters', count: 2)],
      eraId: 'tribe',
      happiness: 72,
      stability: 65,
      militaryStrength: 20,
      isPlayer: true,
      goal: 'survive_and_rise',
    );

    final aiDefs = [
      ('Valkar Empire', '#8B3A3A', LeaderPersonality.aggressive, '#6B3A3A'),
      ('Solenne Republic', '#3A6B8B', LeaderPersonality.peaceful, '#2A4A6B'),
      ('Kael Consortium', '#6B8B3A', LeaderPersonality.economic, '#4A6B2A'),
      ('Nyra Theocracy', '#8B6B3A', LeaderPersonality.zealot, '#6B4A2A'),
      ('Orion Directive', '#6B3A8B', LeaderPersonality.scientific, '#4A2A6B'),
    ];

    final aiCountries = <Country>[];
    for (final def in aiDefs) {
      final pos = map.findSpawn(tiles, preferCoast: false);
      if (pos == null) continue;
      final city = City(
        id: _uuid.v4(),
        name: '${def.$1.split(' ').first} Hold',
        x: pos.$1,
        y: pos.$2,
        population: 40 + _random.nextInt(30).toDouble(),
        visualTier: 'village',
      );
      tiles = map.claimAround(
        tiles: tiles,
        cx: pos.$1,
        cy: pos.$2,
        ownerId: def.$1,
        radius: 2,
      );
      tiles = [
        for (final t in tiles)
          if (t.x == pos.$1 && t.y == pos.$2)
            t.copyWith(hasCity: true, ownerId: def.$1)
          else
            t,
      ];

      final relations = <String, int>{
        GameConstants.playerCountryId: -10 + _random.nextInt(30),
      };
      aiCountries.add(
        Country(
          id: def.$1,
          name: def.$1,
          colorHex: def.$2,
          governmentId: 'tribal_council',
          personality: def.$3,
          resources: Resources(
            food: 80 + _random.nextInt(40).toDouble(),
            wood: 60,
            stone: 30,
            money: 40,
            science: 5,
          ),
          cities: [city],
          army: [const ArmyUnit(unitDefId: 'hunters', count: 1)],
          eraId: 'tribe',
          happiness: 60 + _random.nextInt(20).toDouble(),
          stability: 50 + _random.nextInt(20).toDouble(),
          militaryStrength: 15 + _random.nextInt(20).toDouble(),
          relations: relations,
          goal: switch (def.$3) {
            LeaderPersonality.aggressive => 'conquer',
            LeaderPersonality.scientific => 'research',
            LeaderPersonality.economic => 'wealth',
            LeaderPersonality.peaceful => 'stability',
            LeaderPersonality.zealot => 'influence',
            LeaderPersonality.expansionist => 'expand',
          },
        ),
      );
    }

    return GameState(
      campaignId: _uuid.v4(),
      civilizationName: civilizationName,
      turn: 1,
      year: -10000,
      month: 1,
      player: player,
      aiCountries: aiCountries,
      tiles: tiles,
      unlockedGovernmentIds: ['tribal_council', 'monarchy', 'military_dictatorship'],
      log: [
        const GameLogEntry(
          turn: 1,
          message: 'A new tribe gathers around the fire. History begins.',
          tone: 'good',
        ),
      ],
    );
  }

  GameState advanceTurn(GameState state, GameContent content) {
    if (state.gameOver) return state;
    if (state.activeEvents.isNotEmpty) return state;

    var next = state;
    var player = economy.tick(next.player, content);
    player = tech.tickResearch(player, content);

    final eraId = tech.checkEraAdvancement(player, content);
    final logs = [...next.log];
    if (eraId != null && eraId != player.eraId) {
      player = tech.advanceEra(player, eraId, content);
      logs.add(
        GameLogEntry(
          turn: next.turn,
          message: 'Your people enter the ${content.eraById(eraId).name}!',
          tone: 'good',
        ),
      );
    }

    // Passive border pressure
    var tiles = next.tiles;
    if (_random.nextDouble() < 0.4) {
      tiles = map.expandBorder(
        tiles: tiles,
        ownerId: GameConstants.playerCountryId,
      );
    }

    var month = next.month + 1;
    var year = next.year;
    if (month > 12) {
      month = 1;
      year += 1;
    }

    next = next.copyWith(
      player: player,
      tiles: tiles,
      turn: next.turn + 1,
      month: month,
      year: year,
      log: logs,
    );

    next = events.applyDueEffects(next);
    next = ai.processAiTurn(next, content);
    next = events.maybeSpawnEvent(next, content);
    next = _checkVictory(next);

    if (next.log.length > 250) {
      next = next.copyWith(log: next.log.sublist(next.log.length - 250));
    }
    return next;
  }

  GameState _checkVictory(GameState state) {
    final aliveAi = state.aiCountries.where((c) => c.isAlive).length;
    if (aliveAi == 0 && state.turn > 24) {
      return state.copyWith(gameOver: true, victoryType: 'conquest');
    }
    if (state.player.eraId == 'future' && state.player.prestige >= 200) {
      return state.copyWith(gameOver: true, victoryType: 'ascension');
    }
    final pop = state.player.cities.fold<double>(0, (s, c) => s + c.population);
    if (pop < 5) {
      return state.copyWith(gameOver: true, victoryType: 'defeat');
    }
    return state;
  }
}
