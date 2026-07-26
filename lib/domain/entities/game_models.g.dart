// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapTileImpl _$$MapTileImplFromJson(Map<String, dynamic> json) =>
    _$MapTileImpl(
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      type: $enumDecode(_$TileTypeEnumMap, json['type']),
      ownerId: json['ownerId'] as String? ?? '',
      hasCity: json['hasCity'] as bool? ?? false,
      hasRoad: json['hasRoad'] as bool? ?? false,
      hasPort: json['hasPort'] as bool? ?? false,
      resource: json['resource'] as String?,
    );

Map<String, dynamic> _$$MapTileImplToJson(_$MapTileImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'type': _$TileTypeEnumMap[instance.type]!,
      'ownerId': instance.ownerId,
      'hasCity': instance.hasCity,
      'hasRoad': instance.hasRoad,
      'hasPort': instance.hasPort,
      'resource': instance.resource,
    };

const _$TileTypeEnumMap = {
  TileType.ocean: 'ocean',
  TileType.coast: 'coast',
  TileType.plains: 'plains',
  TileType.forest: 'forest',
  TileType.hills: 'hills',
  TileType.mountains: 'mountains',
  TileType.desert: 'desert',
};

_$CityImpl _$$CityImplFromJson(Map<String, dynamic> json) => _$CityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      population: (json['population'] as num?)?.toDouble() ?? 50,
      buildingIds: (json['buildingIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      visualTier: json['visualTier'] as String? ?? 'village',
    );

Map<String, dynamic> _$$CityImplToJson(_$CityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'x': instance.x,
      'y': instance.y,
      'population': instance.population,
      'buildingIds': instance.buildingIds,
      'visualTier': instance.visualTier,
    };

_$ArmyUnitImpl _$$ArmyUnitImplFromJson(Map<String, dynamic> json) =>
    _$ArmyUnitImpl(
      unitDefId: json['unitDefId'] as String,
      count: (json['count'] as num?)?.toInt() ?? 1,
      morale: (json['morale'] as num?)?.toDouble() ?? 100,
    );

Map<String, dynamic> _$$ArmyUnitImplToJson(_$ArmyUnitImpl instance) =>
    <String, dynamic>{
      'unitDefId': instance.unitDefId,
      'count': instance.count,
      'morale': instance.morale,
    };

_$EconomyStateImpl _$$EconomyStateImplFromJson(Map<String, dynamic> json) =>
    _$EconomyStateImpl(
      gdp: (json['gdp'] as num?)?.toDouble() ?? 0,
      inflation: (json['inflation'] as num?)?.toDouble() ?? 0,
      unemployment: (json['unemployment'] as num?)?.toDouble() ?? 5,
      taxRate: (json['taxRate'] as num?)?.toDouble() ?? 10,
      imports: (json['imports'] as num?)?.toDouble() ?? 0,
      exports: (json['exports'] as num?)?.toDouble() ?? 0,
      nationalDebt: (json['nationalDebt'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$EconomyStateImplToJson(_$EconomyStateImpl instance) =>
    <String, dynamic>{
      'gdp': instance.gdp,
      'inflation': instance.inflation,
      'unemployment': instance.unemployment,
      'taxRate': instance.taxRate,
      'imports': instance.imports,
      'exports': instance.exports,
      'nationalDebt': instance.nationalDebt,
    };

_$PendingEffectImpl _$$PendingEffectImplFromJson(Map<String, dynamic> json) =>
    _$PendingEffectImpl(
      id: json['id'] as String,
      resolveTurn: (json['resolveTurn'] as num).toInt(),
      effects: json['effects'] as Map<String, dynamic>,
      sourceEventId: json['sourceEventId'] as String?,
      unlockGovernment: json['unlockGovernment'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$PendingEffectImplToJson(_$PendingEffectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resolveTurn': instance.resolveTurn,
      'effects': instance.effects,
      'sourceEventId': instance.sourceEventId,
      'unlockGovernment': instance.unlockGovernment,
      'label': instance.label,
    };

_$ActiveEventImpl _$$ActiveEventImplFromJson(Map<String, dynamic> json) =>
    _$ActiveEventImpl(
      instanceId: json['instanceId'] as String,
      eventDefId: json['eventDefId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$ActiveEventImplToJson(_$ActiveEventImpl instance) =>
    <String, dynamic>{
      'instanceId': instance.instanceId,
      'eventDefId': instance.eventDefId,
      'title': instance.title,
      'description': instance.description,
      'choices': instance.choices,
    };

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      colorHex: json['colorHex'] as String,
      governmentId: json['governmentId'] as String,
      personality: $enumDecode(_$LeaderPersonalityEnumMap, json['personality']),
      resources: json['resources'] == null
          ? const Resources()
          : const ResourcesConverter()
              .fromJson(json['resources'] as Map<String, dynamic>),
      economy: json['economy'] == null
          ? const EconomyState()
          : EconomyState.fromJson(json['economy'] as Map<String, dynamic>),
      cities: (json['cities'] as List<dynamic>?)
              ?.map((e) => City.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      army: (json['army'] as List<dynamic>?)
              ?.map((e) => ArmyUnit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      researchedTechIds: (json['researchedTechIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      researchingTechId: json['researchingTechId'] as String? ?? '',
      researchProgress: (json['researchProgress'] as num?)?.toDouble() ?? 0,
      eraId: json['eraId'] as String? ?? 'tribe',
      happiness: (json['happiness'] as num?)?.toDouble() ?? 100,
      stability: (json['stability'] as num?)?.toDouble() ?? 70,
      militaryStrength: (json['militaryStrength'] as num?)?.toDouble() ?? 50,
      prestige: (json['prestige'] as num?)?.toDouble() ?? 0,
      isAlive: json['isAlive'] as bool? ?? true,
      isPlayer: json['isPlayer'] as bool? ?? false,
      relations: (json['relations'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      goal: json['goal'] as String? ?? 'expand',
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorHex': instance.colorHex,
      'governmentId': instance.governmentId,
      'personality': _$LeaderPersonalityEnumMap[instance.personality]!,
      'resources': const ResourcesConverter().toJson(instance.resources),
      'economy': instance.economy,
      'cities': instance.cities,
      'army': instance.army,
      'researchedTechIds': instance.researchedTechIds,
      'researchingTechId': instance.researchingTechId,
      'researchProgress': instance.researchProgress,
      'eraId': instance.eraId,
      'happiness': instance.happiness,
      'stability': instance.stability,
      'militaryStrength': instance.militaryStrength,
      'prestige': instance.prestige,
      'isAlive': instance.isAlive,
      'isPlayer': instance.isPlayer,
      'relations': instance.relations,
      'goal': instance.goal,
    };

const _$LeaderPersonalityEnumMap = {
  LeaderPersonality.aggressive: 'aggressive',
  LeaderPersonality.peaceful: 'peaceful',
  LeaderPersonality.expansionist: 'expansionist',
  LeaderPersonality.scientific: 'scientific',
  LeaderPersonality.economic: 'economic',
  LeaderPersonality.zealot: 'zealot',
};

_$WarRecordImpl _$$WarRecordImplFromJson(Map<String, dynamic> json) =>
    _$WarRecordImpl(
      id: json['id'] as String,
      attackerId: json['attackerId'] as String,
      defenderId: json['defenderId'] as String,
      startTurn: (json['startTurn'] as num).toInt(),
      active: json['active'] as bool? ?? true,
      log: (json['log'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$WarRecordImplToJson(_$WarRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attackerId': instance.attackerId,
      'defenderId': instance.defenderId,
      'startTurn': instance.startTurn,
      'active': instance.active,
      'log': instance.log,
    };

_$DiplomacyPactImpl _$$DiplomacyPactImplFromJson(Map<String, dynamic> json) =>
    _$DiplomacyPactImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      aId: json['aId'] as String,
      bId: json['bId'] as String,
      startTurn: (json['startTurn'] as num).toInt(),
    );

Map<String, dynamic> _$$DiplomacyPactImplToJson(_$DiplomacyPactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'aId': instance.aId,
      'bId': instance.bId,
      'startTurn': instance.startTurn,
    };

_$GameLogEntryImpl _$$GameLogEntryImplFromJson(Map<String, dynamic> json) =>
    _$GameLogEntryImpl(
      turn: (json['turn'] as num).toInt(),
      message: json['message'] as String,
      tone: json['tone'] as String? ?? 'info',
    );

Map<String, dynamic> _$$GameLogEntryImplToJson(_$GameLogEntryImpl instance) =>
    <String, dynamic>{
      'turn': instance.turn,
      'message': instance.message,
      'tone': instance.tone,
    };

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      campaignId: json['campaignId'] as String,
      civilizationName: json['civilizationName'] as String,
      turn: (json['turn'] as num?)?.toInt() ?? 0,
      year: (json['year'] as num?)?.toInt() ?? -10000,
      month: (json['month'] as num?)?.toInt() ?? 1,
      player: Country.fromJson(json['player'] as Map<String, dynamic>),
      aiCountries: (json['aiCountries'] as List<dynamic>?)
              ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tiles: (json['tiles'] as List<dynamic>?)
              ?.map((e) => MapTile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      activeEvents: (json['activeEvents'] as List<dynamic>?)
              ?.map((e) => ActiveEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pendingEffects: (json['pendingEffects'] as List<dynamic>?)
              ?.map((e) => PendingEffect.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      wars: (json['wars'] as List<dynamic>?)
              ?.map((e) => WarRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pacts: (json['pacts'] as List<dynamic>?)
              ?.map((e) => DiplomacyPact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      log: (json['log'] as List<dynamic>?)
              ?.map((e) => GameLogEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unlockedGovernmentIds: (json['unlockedGovernmentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      enactedLawIds: (json['enactedLawIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      gameOver: json['gameOver'] as bool? ?? false,
      victoryType: json['victoryType'] as String?,
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'campaignId': instance.campaignId,
      'civilizationName': instance.civilizationName,
      'turn': instance.turn,
      'year': instance.year,
      'month': instance.month,
      'player': instance.player,
      'aiCountries': instance.aiCountries,
      'tiles': instance.tiles,
      'activeEvents': instance.activeEvents,
      'pendingEffects': instance.pendingEffects,
      'wars': instance.wars,
      'pacts': instance.pacts,
      'log': instance.log,
      'unlockedGovernmentIds': instance.unlockedGovernmentIds,
      'enactedLawIds': instance.enactedLawIds,
      'gameOver': instance.gameOver,
      'victoryType': instance.victoryType,
    };
