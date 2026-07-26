import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/constants/game_constants.dart';
import '../../domain/entities/game_models.dart';

class SaveRepository {
  Box<String>? _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<String>(GameConstants.saveBoxName);
  }

  Future<void> save(GameState state) async {
    final box = _box;
    if (box == null) return;
    await box.put(GameConstants.saveKey, jsonEncode(state.toJson()));
  }

  GameState? load() {
    final box = _box;
    if (box == null) return null;
    final raw = box.get(GameConstants.saveKey);
    if (raw == null || raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return GameState.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async {
    final box = _box;
    if (box == null) return;
    await box.delete(GameConstants.saveKey);
  }

  bool get hasSave {
    final box = _box;
    if (box == null) return false;
    final raw = box.get(GameConstants.saveKey);
    return raw != null && raw.isNotEmpty;
  }
}
