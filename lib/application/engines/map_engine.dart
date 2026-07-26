import 'dart:math';
import '../../core/constants/game_constants.dart';
import '../../domain/entities/game_models.dart';

class MapEngine {
  MapEngine(this._random);

  final Random _random;

  List<MapTile> generateWorld() {
    final tiles = <MapTile>[];
    final width = GameConstants.mapWidth;
    final height = GameConstants.mapHeight;

    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        final nx = (x / width) * 2 - 1;
        final ny = (y / height) * 2 - 1;
        final continent = 0.55 - (nx * nx * 0.55 + ny * ny * 0.75);
        final noise = (_random.nextDouble() - 0.5) * 0.35;
        final elev = continent + noise;

        TileType type;
        if (elev < -0.05) {
          type = TileType.ocean;
        } else if (elev < 0.05) {
          type = TileType.coast;
        } else if (elev > 0.55) {
          type = TileType.mountains;
        } else if (elev > 0.38) {
          type = TileType.hills;
        } else if (_random.nextDouble() < 0.12 && elev > 0.1) {
          type = TileType.desert;
        } else if (_random.nextDouble() < 0.28) {
          type = TileType.forest;
        } else {
          type = TileType.plains;
        }

        String? resource;
        if (type != TileType.ocean && _random.nextDouble() < 0.08) {
          const pool = ['food', 'wood', 'stone', 'iron', 'coal', 'oil', 'gold'];
          resource = pool[_random.nextInt(pool.length)];
        }

        tiles.add(MapTile(x: x, y: y, type: type, resource: resource));
      }
    }

    return tiles;
  }

  int indexOf(int x, int y) => y * GameConstants.mapWidth + x;

  MapTile? tileAt(List<MapTile> tiles, int x, int y) {
    if (x < 0 ||
        y < 0 ||
        x >= GameConstants.mapWidth ||
        y >= GameConstants.mapHeight) {
      return null;
    }
    return tiles[indexOf(x, y)];
  }

  List<MapTile> claimAround({
    required List<MapTile> tiles,
    required int cx,
    required int cy,
    required String ownerId,
    required int radius,
  }) {
    final next = [...tiles];
    for (var y = cy - radius; y <= cy + radius; y++) {
      for (var x = cx - radius; x <= cx + radius; x++) {
        final t = tileAt(next, x, y);
        if (t == null) continue;
        if (t.type == TileType.ocean) continue;
        final dist = (x - cx).abs() + (y - cy).abs();
        if (dist <= radius) {
          next[indexOf(x, y)] = t.copyWith(ownerId: ownerId);
        }
      }
    }
    return next;
  }

  (int, int)? findSpawn(List<MapTile> tiles, {required bool preferCoast}) {
    final candidates = <(int, int)>[];
    for (final t in tiles) {
      if (t.type == TileType.plains || t.type == TileType.forest) {
        if (preferCoast) {
          final nearCoast = _neighbors(tiles, t.x, t.y)
              .any((n) => n.type == TileType.coast || n.type == TileType.ocean);
          if (nearCoast) candidates.add((t.x, t.y));
        } else {
          candidates.add((t.x, t.y));
        }
      }
    }
    if (candidates.isEmpty) {
      for (final t in tiles) {
        if (t.type != TileType.ocean && t.type != TileType.mountains) {
          candidates.add((t.x, t.y));
        }
      }
    }
    if (candidates.isEmpty) return null;
    return candidates[_random.nextInt(candidates.length)];
  }

  List<MapTile> _neighbors(List<MapTile> tiles, int x, int y) {
    final result = <MapTile>[];
    for (final d in const [(1, 0), (-1, 0), (0, 1), (0, -1)]) {
      final t = tileAt(tiles, x + d.$1, y + d.$2);
      if (t != null) result.add(t);
    }
    return result;
  }

  List<MapTile> expandBorder({
    required List<MapTile> tiles,
    required String ownerId,
  }) {
    final owned = tiles.where((t) => t.ownerId == ownerId).toList();
    if (owned.isEmpty) return tiles;
    final frontier = <MapTile>[];
    for (final o in owned) {
      for (final n in _neighbors(tiles, o.x, o.y)) {
        if (n.ownerId.isEmpty &&
            n.type != TileType.ocean &&
            n.type != TileType.mountains) {
          frontier.add(n);
        }
      }
    }
    if (frontier.isEmpty) return tiles;
    final pick = frontier[_random.nextInt(frontier.length)];
    final next = [...tiles];
    next[indexOf(pick.x, pick.y)] = pick.copyWith(ownerId: ownerId);
    return next;
  }
}
