import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/content/content_defs.dart';

class GameContent {
  GameContent({
    required this.eras,
    required this.governments,
    required this.technologies,
    required this.events,
    required this.buildings,
    required this.units,
  });

  final List<EraDef> eras;
  final List<GovernmentDef> governments;
  final List<TechnologyDef> technologies;
  final List<GameEventDef> events;
  final List<BuildingDef> buildings;
  final List<UnitDef> units;

  EraDef eraById(String id) => eras.firstWhere((e) => e.id == id);
  GovernmentDef governmentById(String id) =>
      governments.firstWhere((g) => g.id == id);
  TechnologyDef? techById(String id) {
    for (final t in technologies) {
      if (t.id == id) return t;
    }
    return null;
  }

  BuildingDef? buildingById(String id) {
    for (final b in buildings) {
      if (b.id == id) return b;
    }
    return null;
  }

  UnitDef? unitById(String id) {
    for (final u in units) {
      if (u.id == id) return u;
    }
    return null;
  }

  GameEventDef? eventById(String id) {
    for (final e in events) {
      if (e.id == id) return e;
    }
    return null;
  }
}

class ContentRepository {
  Future<GameContent> load() async {
    Future<Map<String, dynamic>> loadJson(String path) async {
      final raw = await rootBundle.loadString(path);
      return jsonDecode(raw) as Map<String, dynamic>;
    }

    final erasJson = await loadJson('assets/content/eras.json');
    final govJson = await loadJson('assets/content/governments.json');
    final techJson = await loadJson('assets/content/technologies.json');
    final eventJson = await loadJson('assets/content/events.json');
    final buildingJson = await loadJson('assets/content/buildings.json');
    final unitJson = await loadJson('assets/content/units.json');

    return GameContent(
      eras: (erasJson['eras'] as List<dynamic>)
          .map((e) => EraDef.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.order.compareTo(b.order)),
      governments: (govJson['governments'] as List<dynamic>)
          .map((e) => GovernmentDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      technologies: (techJson['technologies'] as List<dynamic>)
          .map((e) => TechnologyDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (eventJson['events'] as List<dynamic>)
          .map((e) => GameEventDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      buildings: (buildingJson['buildings'] as List<dynamic>)
          .map((e) => BuildingDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      units: (unitJson['units'] as List<dynamic>)
          .map((e) => UnitDef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
