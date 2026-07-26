import 'dart:math';
import 'package:uuid/uuid.dart';
import '../../data/content/content_repository.dart';
import '../../domain/entities/game_models.dart';

class WarEngine {
  WarEngine(this._random);

  final Random _random;
  final _uuid = const Uuid();

  double armyPower(Country country, GameContent content) {
    var power = country.militaryStrength;
    for (final unit in country.army) {
      final def = content.unitById(unit.unitDefId);
      if (def == null) continue;
      power += def.strength * unit.count * (unit.morale / 100);
    }
    final era = content.eraById(country.eraId);
    power *= era.bonuses['militaryPower'] ?? 1;
    power *= 0.7 + (country.resources.food.clamp(0, 200) / 400);
    power *= 0.85 + (country.happiness / 400);
    return power;
  }

  (GameState, String) resolveAction({
    required GameState state,
    required GameContent content,
    required String targetId,
    required WarAction action,
  }) {
    Country? target;
    for (final c in state.aiCountries) {
      if (c.id == targetId) target = c;
    }
    if (target == null || !target.isAlive) {
      return (state, 'Target civilization not found.');
    }

    final playerPower = armyPower(state.player, content);
    final enemyPower = armyPower(target, content);
    final weather = 0.85 + _random.nextDouble() * 0.3;
    final generalSkill = 0.9 + _random.nextDouble() * 0.25;
    final supply = (state.player.resources.food +
            state.player.resources.oil +
            state.player.resources.money / 10)
        .clamp(10, 500) /
        250;

    var attackMod = 1.0;
    var defendMod = 1.0;
    var lossMod = 1.0;
    String flavor;

    switch (action) {
      case WarAction.attack:
        attackMod = 1.2;
        flavor = 'launched a ground offensive';
      case WarAction.defend:
        defendMod = 1.35;
        flavor = 'dug into defensive positions';
      case WarAction.retreat:
        attackMod = 0.4;
        lossMod = 0.5;
        flavor = 'ordered a strategic retreat';
      case WarAction.bomb:
        attackMod = 1.1;
        lossMod = 0.8;
        flavor = 'authorized bombardment';
      case WarAction.drones:
        attackMod = 1.15;
        lossMod = 0.6;
        flavor = 'deployed drones';
      case WarAction.spy:
        attackMod = 0.3;
        flavor = 'sent spy missions';
      case WarAction.missile:
        attackMod = 1.4;
        lossMod = 0.7;
        flavor = 'ordered missile strikes';
      case WarAction.navalInvasion:
        attackMod = 1.25;
        lossMod = 1.2;
        flavor = 'began a naval invasion';
    }

    if (action == WarAction.spy) {
      final intel = _random.nextBool();
      final msg = intel
          ? 'Spies report ${target.name} military ≈ ${enemyPower.toStringAsFixed(0)}'
          : 'Spy mission failed in ${target.name}.';
      final relation = Map<String, int>.from(state.player.relations);
      relation[targetId] = (relation[targetId] ?? 0) - 5;
      return (
        state.copyWith(
          player: state.player.copyWith(relations: relation),
          log: [
            ...state.log,
            GameLogEntry(turn: state.turn, message: msg, tone: 'war'),
          ],
        ),
        msg,
      );
    }

    final playerScore =
        playerPower * attackMod * weather * generalSkill * supply;
    final enemyScore = enemyPower * defendMod * (0.9 + _random.nextDouble() * 0.2);
    final ratio = playerScore / (enemyScore + 1);
    final victory = ratio > 1.05;

    var player = state.player;
    var aiList = [...state.aiCountries];
    var wars = [...state.wars];
    final logs = [...state.log];

    final playerLoss = (8 * lossMod / ratio.clamp(0.4, 2.5)).clamp(2, 40);
    final enemyLoss = (10 * ratio * lossMod).clamp(2, 50);

    player = player.copyWith(
      militaryStrength:
          (player.militaryStrength - playerLoss).clamp(0, 9999),
      resources: player.resources.copyWith(
        money: player.resources.money - 15,
        food: player.resources.food - 10,
      ),
      happiness: (player.happiness - (victory ? 1 : 4)).clamp(0, 100),
    );

    final updatedTarget = target.copyWith(
      militaryStrength:
          (target.militaryStrength - enemyLoss).clamp(0, 9999),
      happiness: (target.happiness - (victory ? 6 : 2)).clamp(0, 100),
      isAlive: target.militaryStrength - enemyLoss > 5 ||
          target.cities.isNotEmpty,
    );

    final idx = aiList.indexWhere((c) => c.id == targetId);
    if (idx >= 0) aiList[idx] = updatedTarget;

    final existing = wars.indexWhere(
      (w) =>
          w.active &&
          ((w.attackerId == player.id && w.defenderId == targetId) ||
              (w.defenderId == player.id && w.attackerId == targetId)),
    );
    final line =
        '${player.name} $flavor against ${target.name} — ${victory ? 'advantage' : 'setback'} (P${playerScore.toStringAsFixed(0)} vs E${enemyScore.toStringAsFixed(0)}).';
    if (existing >= 0) {
      final w = wars[existing];
      wars[existing] = w.copyWith(log: [...w.log, line]);
    } else {
      wars.add(
        WarRecord(
          id: _uuid.v4(),
          attackerId: player.id,
          defenderId: targetId,
          startTurn: state.turn,
          log: [line],
        ),
      );
    }

    logs.add(GameLogEntry(turn: state.turn, message: line, tone: 'war'));

    if (victory && _random.nextDouble() < 0.35) {
      // capture light prestige / territory effect represented as prestige
      player = player.copyWith(prestige: player.prestige + 8);
      logs.add(
        GameLogEntry(
          turn: state.turn,
          message: 'Territory pressure increases on ${target.name}.',
          tone: 'good',
        ),
      );
    }

    return (
      state.copyWith(player: player, aiCountries: aiList, wars: wars, log: logs),
      line,
    );
  }
}
