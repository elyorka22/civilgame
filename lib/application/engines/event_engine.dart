import 'dart:math';
import 'package:uuid/uuid.dart';
import '../../core/constants/game_constants.dart';
import '../../data/content/content_repository.dart';
import '../../domain/content/content_defs.dart';
import '../../domain/entities/game_models.dart';

class EventEngine {
  EventEngine(this._random);

  final Random _random;
  final _uuid = const Uuid();

  GameState maybeSpawnEvent(GameState state, GameContent content) {
    if (state.activeEvents.length >= GameConstants.maxActiveEventsQueue) {
      return state;
    }
    if (_random.nextDouble() > GameConstants.eventChancePerTurn) {
      return state;
    }

    final eraOrder = content.eraById(state.player.eraId).order;
    final eligible = content.events.where((e) {
      final minOrder = content.eraById(e.minEraId).order;
      return minOrder <= eraOrder;
    }).toList();
    if (eligible.isEmpty) return state;

    var totalWeight = 0;
    for (final e in eligible) {
      totalWeight += e.weight;
    }
    var roll = _random.nextInt(totalWeight);
    GameEventDef picked = eligible.first;
    for (final e in eligible) {
      if (roll < e.weight) {
        picked = e;
        break;
      }
      roll -= e.weight;
    }

    final active = ActiveEvent(
      instanceId: _uuid.v4(),
      eventDefId: picked.id,
      title: picked.title,
      description: picked.description,
      choices: picked.choices
          .map((c) => {
                'id': c.id,
                'label': c.label,
              })
          .toList(),
    );

    return state.copyWith(
      activeEvents: [...state.activeEvents, active],
      log: [
        ...state.log,
        GameLogEntry(
          turn: state.turn,
          message: 'Event: ${picked.title}',
          tone: 'event',
        ),
      ],
    );
  }

  GameState resolveChoice({
    required GameState state,
    required GameContent content,
    required String instanceId,
    required String choiceId,
  }) {
    ActiveEvent? active;
    for (final e in state.activeEvents) {
      if (e.instanceId == instanceId) active = e;
    }
    if (active == null) return state;

    final def = content.eventById(active.eventDefId);
    if (def == null) return state;

    EventChoiceDef? choice;
    for (final c in def.choices) {
      if (c.id == choiceId) choice = c;
    }
    if (choice == null) return state;

    var player = _applyImmediate(state.player, choice.immediate);
    final pending = [...state.pendingEffects];
    for (final d in choice.delayed) {
      pending.add(
        PendingEffect(
          id: _uuid.v4(),
          resolveTurn: state.turn + d.turns,
          effects: d.effects,
          sourceEventId: def.id,
          unlockGovernment: d.unlockGovernment,
          label: '${def.title}: delayed consequence',
        ),
      );
    }

    final unlocked = [...state.unlockedGovernmentIds];
    final events = state.activeEvents
        .where((e) => e.instanceId != instanceId)
        .toList();

    return state.copyWith(
      player: player,
      activeEvents: events,
      pendingEffects: pending,
      unlockedGovernmentIds: unlocked,
      log: [
        ...state.log,
        GameLogEntry(
          turn: state.turn,
          message: 'Chose "${choice.label}" for ${def.title}',
          tone: 'event',
        ),
      ],
    );
  }

  GameState applyDueEffects(GameState state) {
    final due = <PendingEffect>[];
    final remaining = <PendingEffect>[];
    for (final p in state.pendingEffects) {
      if (p.resolveTurn <= state.turn) {
        due.add(p);
      } else {
        remaining.add(p);
      }
    }
    if (due.isEmpty) return state;

    var player = state.player;
    var unlocked = [...state.unlockedGovernmentIds];
    final logs = [...state.log];

    for (final effect in due) {
      player = _applyImmediate(player, effect.effects);
      if (effect.unlockGovernment != null &&
          !unlocked.contains(effect.unlockGovernment)) {
        unlocked.add(effect.unlockGovernment!);
        logs.add(
          GameLogEntry(
            turn: state.turn,
            message: 'Government unlocked: ${effect.unlockGovernment}',
            tone: 'good',
          ),
        );
      }
      logs.add(
        GameLogEntry(
          turn: state.turn,
          message: effect.label ?? 'A delayed consequence unfolds.',
          tone: 'event',
        ),
      );
    }

    return state.copyWith(
      player: player,
      pendingEffects: remaining,
      unlockedGovernmentIds: unlocked,
      log: logs,
    );
  }

  Country _applyImmediate(Country country, Map<String, dynamic> effects) {
    var resources = country.resources.applyMap(effects);
    var happiness = country.happiness + _num(effects, 'happiness');
    var stability = country.stability + _num(effects, 'stability');
    var military = country.militaryStrength + _num(effects, 'military');
    var prestige = country.prestige + _num(effects, 'prestige');
    var inflation = country.economy.inflation + _num(effects, 'inflation');
    var unemployment =
        country.economy.unemployment + _num(effects, 'unemployment');
    var debt = country.economy.nationalDebt + _num(effects, 'debt');

    var cities = country.cities;
    final popDelta = _num(effects, 'population');
    if (popDelta != 0 && cities.isNotEmpty) {
      final first = cities.first;
      cities = [
        first.copyWith(
          population: (first.population + popDelta).clamp(1, 999999),
        ),
        ...cities.skip(1),
      ];
    }

    return country.copyWith(
      resources: resources.clampMin(),
      happiness: happiness.clamp(0, 100),
      stability: stability.clamp(0, 100),
      militaryStrength: military.clamp(0, 9999),
      prestige: prestige.clamp(0, 9999),
      cities: cities,
      economy: country.economy.copyWith(
        inflation: inflation.clamp(0, 100),
        unemployment: unemployment.clamp(0, 100),
        nationalDebt: debt.clamp(0, 999999),
      ),
    );
  }

  double _num(Map<String, dynamic> map, String key) =>
      (map[key] as num?)?.toDouble() ?? 0;
}
