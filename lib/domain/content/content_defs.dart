class EraDef {
  const EraDef({
    required this.id,
    required this.name,
    required this.order,
    required this.description,
    required this.yearStart,
    required this.requiredTechIds,
    required this.cityVisual,
    required this.bonuses,
  });

  final String id;
  final String name;
  final int order;
  final String description;
  final int yearStart;
  final List<String> requiredTechIds;
  final String cityVisual;
  final Map<String, double> bonuses;

  factory EraDef.fromJson(Map<String, dynamic> json) {
    final bonusesRaw = json['bonuses'] as Map<String, dynamic>? ?? {};
    return EraDef(
      id: json['id'] as String,
      name: json['name'] as String,
      order: json['order'] as int,
      description: json['description'] as String,
      yearStart: json['yearStart'] as int,
      requiredTechIds: (json['requiredTechIds'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      cityVisual: json['cityVisual'] as String? ?? 'village',
      bonuses: bonusesRaw.map((k, v) => MapEntry(k, (v as num).toDouble())),
    );
  }
}

class GovernmentDef {
  const GovernmentDef({
    required this.id,
    required this.name,
    required this.description,
    required this.unlockedEraId,
    required this.bonuses,
    required this.penalties,
    required this.eventsTag,
  });

  final String id;
  final String name;
  final String description;
  final String unlockedEraId;
  final Map<String, double> bonuses;
  final Map<String, double> penalties;
  final String eventsTag;

  factory GovernmentDef.fromJson(Map<String, dynamic> json) {
    Map<String, double> parse(dynamic raw) {
      if (raw is! Map) return {};
      return raw.map((k, v) => MapEntry(k.toString(), (v as num).toDouble()));
    }

    return GovernmentDef(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      unlockedEraId: json['unlockedEraId'] as String,
      bonuses: parse(json['bonuses']),
      penalties: parse(json['penalties']),
      eventsTag: json['eventsTag'] as String? ?? '',
    );
  }
}

class TechnologyDef {
  const TechnologyDef({
    required this.id,
    required this.name,
    required this.eraId,
    required this.cost,
    required this.prerequisites,
    required this.effects,
    required this.description,
  });

  final String id;
  final String name;
  final String eraId;
  final double cost;
  final List<String> prerequisites;
  final Map<String, double> effects;
  final String description;

  factory TechnologyDef.fromJson(Map<String, dynamic> json) {
    final effectsRaw = json['effects'] as Map<String, dynamic>? ?? {};
    return TechnologyDef(
      id: json['id'] as String,
      name: json['name'] as String,
      eraId: json['eraId'] as String,
      cost: (json['cost'] as num).toDouble(),
      prerequisites: (json['prerequisites'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      effects: effectsRaw.map((k, v) => MapEntry(k, (v as num).toDouble())),
      description: json['description'] as String? ?? '',
    );
  }
}

class EventChoiceDef {
  const EventChoiceDef({
    required this.id,
    required this.label,
    required this.immediate,
    required this.delayed,
  });

  final String id;
  final String label;
  final Map<String, dynamic> immediate;
  final List<DelayedEffectDef> delayed;

  factory EventChoiceDef.fromJson(Map<String, dynamic> json) {
    return EventChoiceDef(
      id: json['id'] as String,
      label: json['label'] as String,
      immediate: Map<String, dynamic>.from(json['immediate'] as Map? ?? {}),
      delayed: (json['delayed'] as List<dynamic>? ?? [])
          .map((e) => DelayedEffectDef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DelayedEffectDef {
  const DelayedEffectDef({
    required this.turns,
    required this.effects,
    this.unlockGovernment,
  });

  final int turns;
  final Map<String, dynamic> effects;
  final String? unlockGovernment;

  factory DelayedEffectDef.fromJson(Map<String, dynamic> json) {
    return DelayedEffectDef(
      turns: json['turns'] as int,
      effects: Map<String, dynamic>.from(json['effects'] as Map? ?? {}),
      unlockGovernment: json['unlockGovernment'] as String?,
    );
  }
}

class GameEventDef {
  const GameEventDef({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.minEraId,
    required this.weight,
    required this.choices,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String minEraId;
  final int weight;
  final List<EventChoiceDef> choices;

  factory GameEventDef.fromJson(Map<String, dynamic> json) {
    return GameEventDef(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String? ?? 'general',
      minEraId: json['minEraId'] as String? ?? 'tribe',
      weight: json['weight'] as int? ?? 5,
      choices: (json['choices'] as List<dynamic>? ?? [])
          .map((e) => EventChoiceDef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BuildingDef {
  const BuildingDef({
    required this.id,
    required this.name,
    required this.eraId,
    required this.cost,
    required this.effects,
    required this.description,
  });

  final String id;
  final String name;
  final String eraId;
  final Map<String, double> cost;
  final Map<String, double> effects;
  final String description;

  factory BuildingDef.fromJson(Map<String, dynamic> json) {
    Map<String, double> parse(dynamic raw) {
      if (raw is! Map) return {};
      return raw.map((k, v) => MapEntry(k.toString(), (v as num).toDouble()));
    }

    return BuildingDef(
      id: json['id'] as String,
      name: json['name'] as String,
      eraId: json['eraId'] as String,
      cost: parse(json['cost']),
      effects: parse(json['effects']),
      description: json['description'] as String? ?? '',
    );
  }
}

class UnitDef {
  const UnitDef({
    required this.id,
    required this.name,
    required this.eraId,
    required this.cost,
    required this.strength,
    required this.upkeep,
    required this.roles,
  });

  final String id;
  final String name;
  final String eraId;
  final Map<String, double> cost;
  final double strength;
  final Map<String, double> upkeep;
  final List<String> roles;

  factory UnitDef.fromJson(Map<String, dynamic> json) {
    Map<String, double> parse(dynamic raw) {
      if (raw is! Map) return {};
      return raw.map((k, v) => MapEntry(k.toString(), (v as num).toDouble()));
    }

    return UnitDef(
      id: json['id'] as String,
      name: json['name'] as String,
      eraId: json['eraId'] as String,
      cost: parse(json['cost']),
      strength: (json['strength'] as num).toDouble(),
      upkeep: parse(json['upkeep']),
      roles: (json['roles'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
    );
  }
}
