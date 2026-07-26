import 'package:freezed_annotation/freezed_annotation.dart';
import 'resources.dart';

part 'game_models.freezed.dart';
part 'game_models.g.dart';

class ResourcesConverter
    implements JsonConverter<Resources, Map<String, dynamic>> {
  const ResourcesConverter();

  @override
  Resources fromJson(Map<String, dynamic> json) => Resources.fromJson(json);

  @override
  Map<String, dynamic> toJson(Resources object) => object.toJson();
}

enum TileType { ocean, coast, plains, forest, hills, mountains, desert }

enum WarAction {
  attack,
  defend,
  retreat,
  bomb,
  drones,
  spy,
  missile,
  navalInvasion,
}

enum LeaderPersonality {
  aggressive,
  peaceful,
  expansionist,
  scientific,
  economic,
  zealot,
}

@freezed
class MapTile with _$MapTile {
  const factory MapTile({
    required int x,
    required int y,
    required TileType type,
    @Default('') String ownerId,
    @Default(false) bool hasCity,
    @Default(false) bool hasRoad,
    @Default(false) bool hasPort,
    String? resource,
  }) = _MapTile;

  factory MapTile.fromJson(Map<String, dynamic> json) =>
      _$MapTileFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    required String id,
    required String name,
    required int x,
    required int y,
    @Default(50) double population,
    @Default([]) List<String> buildingIds,
    @Default('village') String visualTier,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class ArmyUnit with _$ArmyUnit {
  const factory ArmyUnit({
    required String unitDefId,
    @Default(1) int count,
    @Default(100) double morale,
  }) = _ArmyUnit;

  factory ArmyUnit.fromJson(Map<String, dynamic> json) =>
      _$ArmyUnitFromJson(json);
}

@freezed
class EconomyState with _$EconomyState {
  const factory EconomyState({
    @Default(0) double gdp,
    @Default(0) double inflation,
    @Default(5) double unemployment,
    @Default(10) double taxRate,
    @Default(0) double imports,
    @Default(0) double exports,
    @Default(0) double nationalDebt,
  }) = _EconomyState;

  factory EconomyState.fromJson(Map<String, dynamic> json) =>
      _$EconomyStateFromJson(json);
}

@freezed
class PendingEffect with _$PendingEffect {
  const factory PendingEffect({
    required String id,
    required int resolveTurn,
    required Map<String, dynamic> effects,
    String? sourceEventId,
    String? unlockGovernment,
    String? label,
  }) = _PendingEffect;

  factory PendingEffect.fromJson(Map<String, dynamic> json) =>
      _$PendingEffectFromJson(json);
}

@freezed
class ActiveEvent with _$ActiveEvent {
  const factory ActiveEvent({
    required String instanceId,
    required String eventDefId,
    required String title,
    required String description,
    required List<Map<String, dynamic>> choices,
  }) = _ActiveEvent;

  factory ActiveEvent.fromJson(Map<String, dynamic> json) =>
      _$ActiveEventFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    required String id,
    required String name,
    required String colorHex,
    required String governmentId,
    required LeaderPersonality personality,
    @ResourcesConverter() @Default(Resources()) Resources resources,
    @Default(EconomyState()) EconomyState economy,
    @Default([]) List<City> cities,
    @Default([]) List<ArmyUnit> army,
    @Default([]) List<String> researchedTechIds,
    @Default('') String researchingTechId,
    @Default(0) double researchProgress,
    @Default('tribe') String eraId,
    @Default(100) double happiness,
    @Default(70) double stability,
    @Default(50) double militaryStrength,
    @Default(0) double prestige,
    @Default(true) bool isAlive,
    @Default(false) bool isPlayer,
    @Default({}) Map<String, int> relations,
    @Default('expand') String goal,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class WarRecord with _$WarRecord {
  const factory WarRecord({
    required String id,
    required String attackerId,
    required String defenderId,
    required int startTurn,
    @Default(true) bool active,
    @Default([]) List<String> log,
  }) = _WarRecord;

  factory WarRecord.fromJson(Map<String, dynamic> json) =>
      _$WarRecordFromJson(json);
}

@freezed
class DiplomacyPact with _$DiplomacyPact {
  const factory DiplomacyPact({
    required String id,
    required String type,
    required String aId,
    required String bId,
    required int startTurn,
  }) = _DiplomacyPact;

  factory DiplomacyPact.fromJson(Map<String, dynamic> json) =>
      _$DiplomacyPactFromJson(json);
}

@freezed
class GameLogEntry with _$GameLogEntry {
  const factory GameLogEntry({
    required int turn,
    required String message,
    @Default('info') String tone,
  }) = _GameLogEntry;

  factory GameLogEntry.fromJson(Map<String, dynamic> json) =>
      _$GameLogEntryFromJson(json);
}

@freezed
class GameState with _$GameState {
  const factory GameState({
    required String campaignId,
    required String civilizationName,
    @Default(0) int turn,
    @Default(-10000) int year,
    @Default(1) int month,
    required Country player,
    @Default([]) List<Country> aiCountries,
    @Default([]) List<MapTile> tiles,
    @Default([]) List<ActiveEvent> activeEvents,
    @Default([]) List<PendingEffect> pendingEffects,
    @Default([]) List<WarRecord> wars,
    @Default([]) List<DiplomacyPact> pacts,
    @Default([]) List<GameLogEntry> log,
    @Default([]) List<String> unlockedGovernmentIds,
    @Default([]) List<String> enactedLawIds,
    @Default(false) bool gameOver,
    String? victoryType,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
}
