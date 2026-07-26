import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/engines/turn_engine.dart';
import '../../data/content/content_repository.dart';
import '../../data/local/save_repository.dart';
import '../../domain/entities/game_models.dart';

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository();
});

final saveRepositoryProvider = Provider<SaveRepository>((ref) {
  return SaveRepository();
});

final turnEngineProvider = Provider<TurnEngine>((ref) {
  return TurnEngine();
});

final contentProvider = FutureProvider<GameContent>((ref) async {
  return ref.watch(contentRepositoryProvider).load();
});

class GameController extends StateNotifier<AsyncValue<GameState?>> {
  GameController(this._ref) : super(const AsyncValue.data(null));

  final Ref _ref;
  bool _initialized = false;

  Future<void> bootstrap() async {
    if (_initialized) return;
    _initialized = true;
    final save = _ref.read(saveRepositoryProvider);
    await save.init();
    final existing = save.load();
    state = AsyncValue.data(existing);
  }

  Future<void> newGame(String name) async {
    state = const AsyncValue.loading();
    try {
      final content = await _ref.read(contentProvider.future);
      final engine = _ref.read(turnEngineProvider);
      final game = engine.createNewGame(
        civilizationName: name.trim().isEmpty ? 'Aurora' : name.trim(),
        content: content,
      );
      state = AsyncValue.data(game);
      await _ref.read(saveRepositoryProvider).save(game);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> continueGame() async {
    final save = _ref.read(saveRepositoryProvider).load();
    state = AsyncValue.data(save);
  }

  Future<void> _persist(GameState game) async {
    state = AsyncValue.data(game);
    await _ref.read(saveRepositoryProvider).save(game);
  }

  Future<void> endTurn() async {
    final current = state.valueOrNull;
    if (current == null) return;
    final content = await _ref.read(contentProvider.future);
    final next = _ref.read(turnEngineProvider).advanceTurn(current, content);
    await _persist(next);
  }

  Future<void> resolveEvent(String instanceId, String choiceId) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final content = await _ref.read(contentProvider.future);
    final next = _ref.read(turnEngineProvider).events.resolveChoice(
          state: current,
          content: content,
          instanceId: instanceId,
          choiceId: choiceId,
        );
    await _persist(next);
  }

  Future<void> research(String techId) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final content = await _ref.read(contentProvider.future);
    final player = _ref
        .read(turnEngineProvider)
        .tech
        .startResearch(current.player, techId, content);
    await _persist(current.copyWith(player: player));
  }

  Future<void> setGovernment(String governmentId) async {
    final current = state.valueOrNull;
    if (current == null) return;
    if (!current.unlockedGovernmentIds.contains(governmentId)) return;
    await _persist(
      current.copyWith(
        player: current.player.copyWith(governmentId: governmentId),
        log: [
          ...current.log,
          GameLogEntry(
            turn: current.turn,
            message: 'Government reformed.',
            tone: 'politics',
          ),
        ],
      ),
    );
  }

  Future<void> setTaxRate(double rate) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final player =
        _ref.read(turnEngineProvider).economy.setTaxRate(current.player, rate);
    await _persist(current.copyWith(player: player));
  }

  Future<void> expandBorders() async {
    final current = state.valueOrNull;
    if (current == null) return;
    if (current.player.resources.money < 20) return;
    final tiles = _ref.read(turnEngineProvider).map.expandBorder(
          tiles: current.tiles,
          ownerId: current.player.id,
        );
    final player = current.player.copyWith(
      resources: current.player.resources.copyWith(
        money: current.player.resources.money - 20,
      ),
    );
    await _persist(current.copyWith(tiles: tiles, player: player));
  }

  Future<void> buildInCapital(String buildingId) async {
    final current = state.valueOrNull;
    if (current == null || current.player.cities.isEmpty) return;
    final content = await _ref.read(contentProvider.future);
    final building = content.buildingById(buildingId);
    if (building == null) return;
    final capital = current.player.cities.first;
    if (capital.buildingIds.contains(buildingId)) return;

    var resources = current.player.resources;
    for (final entry in building.cost.entries) {
      final key = entry.key;
      final cost = entry.value;
      switch (key) {
        case 'food':
          if (resources.food < cost) return;
          resources = resources.copyWith(food: resources.food - cost);
        case 'wood':
          if (resources.wood < cost) return;
          resources = resources.copyWith(wood: resources.wood - cost);
        case 'stone':
          if (resources.stone < cost) return;
          resources = resources.copyWith(stone: resources.stone - cost);
        case 'iron':
          if (resources.iron < cost) return;
          resources = resources.copyWith(iron: resources.iron - cost);
        case 'coal':
          if (resources.coal < cost) return;
          resources = resources.copyWith(coal: resources.coal - cost);
        case 'oil':
          if (resources.oil < cost) return;
          resources = resources.copyWith(oil: resources.oil - cost);
        case 'gold':
          if (resources.gold < cost) return;
          resources = resources.copyWith(gold: resources.gold - cost);
        case 'money':
          if (resources.money < cost) return;
          resources = resources.copyWith(money: resources.money - cost);
        case 'science':
          if (resources.science < cost) return;
          resources = resources.copyWith(science: resources.science - cost);
      }
    }

    final updatedCapital = capital.copyWith(
      buildingIds: [...capital.buildingIds, buildingId],
    );
    final cities = [updatedCapital, ...current.player.cities.skip(1)];
    await _persist(
      current.copyWith(
        player: current.player.copyWith(resources: resources, cities: cities),
      ),
    );
  }

  Future<void> warAction(String targetId, WarAction action) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final content = await _ref.read(contentProvider.future);
    final result = _ref.read(turnEngineProvider).war.resolveAction(
          state: current,
          content: content,
          targetId: targetId,
          action: action,
        );
    await _persist(result.$1);
  }

  Future<void> toggleLaw(String lawId) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final laws = [...current.enactedLawIds];
    if (laws.contains(lawId)) {
      laws.remove(lawId);
    } else {
      laws.add(lawId);
    }
    await _persist(current.copyWith(enactedLawIds: laws));
  }

  Future<void> foundCity(String name) async {
    final current = state.valueOrNull;
    if (current == null) return;
    if (current.player.resources.money < 100 ||
        current.player.resources.wood < 60) {
      return;
    }
    final owned = current.tiles
        .where((t) =>
            t.ownerId == current.player.id &&
            !t.hasCity &&
            t.type != TileType.ocean)
        .toList();
    if (owned.isEmpty) return;
    owned.sort((a, b) => (a.x + a.y).compareTo(b.x + b.y));
    final spot = owned[owned.length ~/ 2];
    final city = City(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      x: spot.x,
      y: spot.y,
      population: 30,
      visualTier: current.player.cities.first.visualTier,
    );
    final tiles = [
      for (final t in current.tiles)
        if (t.x == spot.x && t.y == spot.y) t.copyWith(hasCity: true) else t,
    ];
    final player = current.player.copyWith(
      cities: [...current.player.cities, city],
      resources: current.player.resources.copyWith(
        money: current.player.resources.money - 100,
        wood: current.player.resources.wood - 60,
      ),
    );
    await _persist(current.copyWith(player: player, tiles: tiles));
  }
}

final gameControllerProvider =
    StateNotifierProvider<GameController, AsyncValue<GameState?>>((ref) {
  return GameController(ref);
});
