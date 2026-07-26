// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MapTile _$MapTileFromJson(Map<String, dynamic> json) {
  return _MapTile.fromJson(json);
}

/// @nodoc
mixin _$MapTile {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  TileType get type => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  bool get hasCity => throw _privateConstructorUsedError;
  bool get hasRoad => throw _privateConstructorUsedError;
  bool get hasPort => throw _privateConstructorUsedError;
  String? get resource => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapTileCopyWith<MapTile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapTileCopyWith<$Res> {
  factory $MapTileCopyWith(MapTile value, $Res Function(MapTile) then) =
      _$MapTileCopyWithImpl<$Res, MapTile>;
  @useResult
  $Res call(
      {int x,
      int y,
      TileType type,
      String ownerId,
      bool hasCity,
      bool hasRoad,
      bool hasPort,
      String? resource});
}

/// @nodoc
class _$MapTileCopyWithImpl<$Res, $Val extends MapTile>
    implements $MapTileCopyWith<$Res> {
  _$MapTileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? type = null,
    Object? ownerId = null,
    Object? hasCity = null,
    Object? hasRoad = null,
    Object? hasPort = null,
    Object? resource = freezed,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TileType,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      hasCity: null == hasCity
          ? _value.hasCity
          : hasCity // ignore: cast_nullable_to_non_nullable
              as bool,
      hasRoad: null == hasRoad
          ? _value.hasRoad
          : hasRoad // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPort: null == hasPort
          ? _value.hasPort
          : hasPort // ignore: cast_nullable_to_non_nullable
              as bool,
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapTileImplCopyWith<$Res> implements $MapTileCopyWith<$Res> {
  factory _$$MapTileImplCopyWith(
          _$MapTileImpl value, $Res Function(_$MapTileImpl) then) =
      __$$MapTileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int x,
      int y,
      TileType type,
      String ownerId,
      bool hasCity,
      bool hasRoad,
      bool hasPort,
      String? resource});
}

/// @nodoc
class __$$MapTileImplCopyWithImpl<$Res>
    extends _$MapTileCopyWithImpl<$Res, _$MapTileImpl>
    implements _$$MapTileImplCopyWith<$Res> {
  __$$MapTileImplCopyWithImpl(
      _$MapTileImpl _value, $Res Function(_$MapTileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? type = null,
    Object? ownerId = null,
    Object? hasCity = null,
    Object? hasRoad = null,
    Object? hasPort = null,
    Object? resource = freezed,
  }) {
    return _then(_$MapTileImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TileType,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      hasCity: null == hasCity
          ? _value.hasCity
          : hasCity // ignore: cast_nullable_to_non_nullable
              as bool,
      hasRoad: null == hasRoad
          ? _value.hasRoad
          : hasRoad // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPort: null == hasPort
          ? _value.hasPort
          : hasPort // ignore: cast_nullable_to_non_nullable
              as bool,
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapTileImpl implements _MapTile {
  const _$MapTileImpl(
      {required this.x,
      required this.y,
      required this.type,
      this.ownerId = '',
      this.hasCity = false,
      this.hasRoad = false,
      this.hasPort = false,
      this.resource});

  factory _$MapTileImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapTileImplFromJson(json);

  @override
  final int x;
  @override
  final int y;
  @override
  final TileType type;
  @override
  @JsonKey()
  final String ownerId;
  @override
  @JsonKey()
  final bool hasCity;
  @override
  @JsonKey()
  final bool hasRoad;
  @override
  @JsonKey()
  final bool hasPort;
  @override
  final String? resource;

  @override
  String toString() {
    return 'MapTile(x: $x, y: $y, type: $type, ownerId: $ownerId, hasCity: $hasCity, hasRoad: $hasRoad, hasPort: $hasPort, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapTileImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.hasCity, hasCity) || other.hasCity == hasCity) &&
            (identical(other.hasRoad, hasRoad) || other.hasRoad == hasRoad) &&
            (identical(other.hasPort, hasPort) || other.hasPort == hasPort) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, x, y, type, ownerId, hasCity, hasRoad, hasPort, resource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapTileImplCopyWith<_$MapTileImpl> get copyWith =>
      __$$MapTileImplCopyWithImpl<_$MapTileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapTileImplToJson(
      this,
    );
  }
}

abstract class _MapTile implements MapTile {
  const factory _MapTile(
      {required final int x,
      required final int y,
      required final TileType type,
      final String ownerId,
      final bool hasCity,
      final bool hasRoad,
      final bool hasPort,
      final String? resource}) = _$MapTileImpl;

  factory _MapTile.fromJson(Map<String, dynamic> json) = _$MapTileImpl.fromJson;

  @override
  int get x;
  @override
  int get y;
  @override
  TileType get type;
  @override
  String get ownerId;
  @override
  bool get hasCity;
  @override
  bool get hasRoad;
  @override
  bool get hasPort;
  @override
  String? get resource;
  @override
  @JsonKey(ignore: true)
  _$$MapTileImplCopyWith<_$MapTileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
mixin _$City {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  double get population => throw _privateConstructorUsedError;
  List<String> get buildingIds => throw _privateConstructorUsedError;
  String get visualTier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res, City>;
  @useResult
  $Res call(
      {String id,
      String name,
      int x,
      int y,
      double population,
      List<String> buildingIds,
      String visualTier});
}

/// @nodoc
class _$CityCopyWithImpl<$Res, $Val extends City>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? x = null,
    Object? y = null,
    Object? population = null,
    Object? buildingIds = null,
    Object? visualTier = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as double,
      buildingIds: null == buildingIds
          ? _value.buildingIds
          : buildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visualTier: null == visualTier
          ? _value.visualTier
          : visualTier // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityImplCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$$CityImplCopyWith(
          _$CityImpl value, $Res Function(_$CityImpl) then) =
      __$$CityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int x,
      int y,
      double population,
      List<String> buildingIds,
      String visualTier});
}

/// @nodoc
class __$$CityImplCopyWithImpl<$Res>
    extends _$CityCopyWithImpl<$Res, _$CityImpl>
    implements _$$CityImplCopyWith<$Res> {
  __$$CityImplCopyWithImpl(_$CityImpl _value, $Res Function(_$CityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? x = null,
    Object? y = null,
    Object? population = null,
    Object? buildingIds = null,
    Object? visualTier = null,
  }) {
    return _then(_$CityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as double,
      buildingIds: null == buildingIds
          ? _value._buildingIds
          : buildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visualTier: null == visualTier
          ? _value.visualTier
          : visualTier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityImpl implements _City {
  const _$CityImpl(
      {required this.id,
      required this.name,
      required this.x,
      required this.y,
      this.population = 50,
      final List<String> buildingIds = const [],
      this.visualTier = 'village'})
      : _buildingIds = buildingIds;

  factory _$CityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int x;
  @override
  final int y;
  @override
  @JsonKey()
  final double population;
  final List<String> _buildingIds;
  @override
  @JsonKey()
  List<String> get buildingIds {
    if (_buildingIds is EqualUnmodifiableListView) return _buildingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buildingIds);
  }

  @override
  @JsonKey()
  final String visualTier;

  @override
  String toString() {
    return 'City(id: $id, name: $name, x: $x, y: $y, population: $population, buildingIds: $buildingIds, visualTier: $visualTier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.population, population) ||
                other.population == population) &&
            const DeepCollectionEquality()
                .equals(other._buildingIds, _buildingIds) &&
            (identical(other.visualTier, visualTier) ||
                other.visualTier == visualTier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, x, y, population,
      const DeepCollectionEquality().hash(_buildingIds), visualTier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CityImplCopyWith<_$CityImpl> get copyWith =>
      __$$CityImplCopyWithImpl<_$CityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityImplToJson(
      this,
    );
  }
}

abstract class _City implements City {
  const factory _City(
      {required final String id,
      required final String name,
      required final int x,
      required final int y,
      final double population,
      final List<String> buildingIds,
      final String visualTier}) = _$CityImpl;

  factory _City.fromJson(Map<String, dynamic> json) = _$CityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get x;
  @override
  int get y;
  @override
  double get population;
  @override
  List<String> get buildingIds;
  @override
  String get visualTier;
  @override
  @JsonKey(ignore: true)
  _$$CityImplCopyWith<_$CityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArmyUnit _$ArmyUnitFromJson(Map<String, dynamic> json) {
  return _ArmyUnit.fromJson(json);
}

/// @nodoc
mixin _$ArmyUnit {
  String get unitDefId => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get morale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArmyUnitCopyWith<ArmyUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArmyUnitCopyWith<$Res> {
  factory $ArmyUnitCopyWith(ArmyUnit value, $Res Function(ArmyUnit) then) =
      _$ArmyUnitCopyWithImpl<$Res, ArmyUnit>;
  @useResult
  $Res call({String unitDefId, int count, double morale});
}

/// @nodoc
class _$ArmyUnitCopyWithImpl<$Res, $Val extends ArmyUnit>
    implements $ArmyUnitCopyWith<$Res> {
  _$ArmyUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitDefId = null,
    Object? count = null,
    Object? morale = null,
  }) {
    return _then(_value.copyWith(
      unitDefId: null == unitDefId
          ? _value.unitDefId
          : unitDefId // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      morale: null == morale
          ? _value.morale
          : morale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArmyUnitImplCopyWith<$Res>
    implements $ArmyUnitCopyWith<$Res> {
  factory _$$ArmyUnitImplCopyWith(
          _$ArmyUnitImpl value, $Res Function(_$ArmyUnitImpl) then) =
      __$$ArmyUnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String unitDefId, int count, double morale});
}

/// @nodoc
class __$$ArmyUnitImplCopyWithImpl<$Res>
    extends _$ArmyUnitCopyWithImpl<$Res, _$ArmyUnitImpl>
    implements _$$ArmyUnitImplCopyWith<$Res> {
  __$$ArmyUnitImplCopyWithImpl(
      _$ArmyUnitImpl _value, $Res Function(_$ArmyUnitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitDefId = null,
    Object? count = null,
    Object? morale = null,
  }) {
    return _then(_$ArmyUnitImpl(
      unitDefId: null == unitDefId
          ? _value.unitDefId
          : unitDefId // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      morale: null == morale
          ? _value.morale
          : morale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArmyUnitImpl implements _ArmyUnit {
  const _$ArmyUnitImpl(
      {required this.unitDefId, this.count = 1, this.morale = 100});

  factory _$ArmyUnitImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArmyUnitImplFromJson(json);

  @override
  final String unitDefId;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final double morale;

  @override
  String toString() {
    return 'ArmyUnit(unitDefId: $unitDefId, count: $count, morale: $morale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArmyUnitImpl &&
            (identical(other.unitDefId, unitDefId) ||
                other.unitDefId == unitDefId) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.morale, morale) || other.morale == morale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unitDefId, count, morale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArmyUnitImplCopyWith<_$ArmyUnitImpl> get copyWith =>
      __$$ArmyUnitImplCopyWithImpl<_$ArmyUnitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArmyUnitImplToJson(
      this,
    );
  }
}

abstract class _ArmyUnit implements ArmyUnit {
  const factory _ArmyUnit(
      {required final String unitDefId,
      final int count,
      final double morale}) = _$ArmyUnitImpl;

  factory _ArmyUnit.fromJson(Map<String, dynamic> json) =
      _$ArmyUnitImpl.fromJson;

  @override
  String get unitDefId;
  @override
  int get count;
  @override
  double get morale;
  @override
  @JsonKey(ignore: true)
  _$$ArmyUnitImplCopyWith<_$ArmyUnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EconomyState _$EconomyStateFromJson(Map<String, dynamic> json) {
  return _EconomyState.fromJson(json);
}

/// @nodoc
mixin _$EconomyState {
  double get gdp => throw _privateConstructorUsedError;
  double get inflation => throw _privateConstructorUsedError;
  double get unemployment => throw _privateConstructorUsedError;
  double get taxRate => throw _privateConstructorUsedError;
  double get imports => throw _privateConstructorUsedError;
  double get exports => throw _privateConstructorUsedError;
  double get nationalDebt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EconomyStateCopyWith<EconomyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EconomyStateCopyWith<$Res> {
  factory $EconomyStateCopyWith(
          EconomyState value, $Res Function(EconomyState) then) =
      _$EconomyStateCopyWithImpl<$Res, EconomyState>;
  @useResult
  $Res call(
      {double gdp,
      double inflation,
      double unemployment,
      double taxRate,
      double imports,
      double exports,
      double nationalDebt});
}

/// @nodoc
class _$EconomyStateCopyWithImpl<$Res, $Val extends EconomyState>
    implements $EconomyStateCopyWith<$Res> {
  _$EconomyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gdp = null,
    Object? inflation = null,
    Object? unemployment = null,
    Object? taxRate = null,
    Object? imports = null,
    Object? exports = null,
    Object? nationalDebt = null,
  }) {
    return _then(_value.copyWith(
      gdp: null == gdp
          ? _value.gdp
          : gdp // ignore: cast_nullable_to_non_nullable
              as double,
      inflation: null == inflation
          ? _value.inflation
          : inflation // ignore: cast_nullable_to_non_nullable
              as double,
      unemployment: null == unemployment
          ? _value.unemployment
          : unemployment // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
      imports: null == imports
          ? _value.imports
          : imports // ignore: cast_nullable_to_non_nullable
              as double,
      exports: null == exports
          ? _value.exports
          : exports // ignore: cast_nullable_to_non_nullable
              as double,
      nationalDebt: null == nationalDebt
          ? _value.nationalDebt
          : nationalDebt // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EconomyStateImplCopyWith<$Res>
    implements $EconomyStateCopyWith<$Res> {
  factory _$$EconomyStateImplCopyWith(
          _$EconomyStateImpl value, $Res Function(_$EconomyStateImpl) then) =
      __$$EconomyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double gdp,
      double inflation,
      double unemployment,
      double taxRate,
      double imports,
      double exports,
      double nationalDebt});
}

/// @nodoc
class __$$EconomyStateImplCopyWithImpl<$Res>
    extends _$EconomyStateCopyWithImpl<$Res, _$EconomyStateImpl>
    implements _$$EconomyStateImplCopyWith<$Res> {
  __$$EconomyStateImplCopyWithImpl(
      _$EconomyStateImpl _value, $Res Function(_$EconomyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gdp = null,
    Object? inflation = null,
    Object? unemployment = null,
    Object? taxRate = null,
    Object? imports = null,
    Object? exports = null,
    Object? nationalDebt = null,
  }) {
    return _then(_$EconomyStateImpl(
      gdp: null == gdp
          ? _value.gdp
          : gdp // ignore: cast_nullable_to_non_nullable
              as double,
      inflation: null == inflation
          ? _value.inflation
          : inflation // ignore: cast_nullable_to_non_nullable
              as double,
      unemployment: null == unemployment
          ? _value.unemployment
          : unemployment // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
      imports: null == imports
          ? _value.imports
          : imports // ignore: cast_nullable_to_non_nullable
              as double,
      exports: null == exports
          ? _value.exports
          : exports // ignore: cast_nullable_to_non_nullable
              as double,
      nationalDebt: null == nationalDebt
          ? _value.nationalDebt
          : nationalDebt // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EconomyStateImpl implements _EconomyState {
  const _$EconomyStateImpl(
      {this.gdp = 0,
      this.inflation = 0,
      this.unemployment = 5,
      this.taxRate = 10,
      this.imports = 0,
      this.exports = 0,
      this.nationalDebt = 0});

  factory _$EconomyStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EconomyStateImplFromJson(json);

  @override
  @JsonKey()
  final double gdp;
  @override
  @JsonKey()
  final double inflation;
  @override
  @JsonKey()
  final double unemployment;
  @override
  @JsonKey()
  final double taxRate;
  @override
  @JsonKey()
  final double imports;
  @override
  @JsonKey()
  final double exports;
  @override
  @JsonKey()
  final double nationalDebt;

  @override
  String toString() {
    return 'EconomyState(gdp: $gdp, inflation: $inflation, unemployment: $unemployment, taxRate: $taxRate, imports: $imports, exports: $exports, nationalDebt: $nationalDebt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EconomyStateImpl &&
            (identical(other.gdp, gdp) || other.gdp == gdp) &&
            (identical(other.inflation, inflation) ||
                other.inflation == inflation) &&
            (identical(other.unemployment, unemployment) ||
                other.unemployment == unemployment) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            (identical(other.imports, imports) || other.imports == imports) &&
            (identical(other.exports, exports) || other.exports == exports) &&
            (identical(other.nationalDebt, nationalDebt) ||
                other.nationalDebt == nationalDebt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gdp, inflation, unemployment,
      taxRate, imports, exports, nationalDebt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EconomyStateImplCopyWith<_$EconomyStateImpl> get copyWith =>
      __$$EconomyStateImplCopyWithImpl<_$EconomyStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EconomyStateImplToJson(
      this,
    );
  }
}

abstract class _EconomyState implements EconomyState {
  const factory _EconomyState(
      {final double gdp,
      final double inflation,
      final double unemployment,
      final double taxRate,
      final double imports,
      final double exports,
      final double nationalDebt}) = _$EconomyStateImpl;

  factory _EconomyState.fromJson(Map<String, dynamic> json) =
      _$EconomyStateImpl.fromJson;

  @override
  double get gdp;
  @override
  double get inflation;
  @override
  double get unemployment;
  @override
  double get taxRate;
  @override
  double get imports;
  @override
  double get exports;
  @override
  double get nationalDebt;
  @override
  @JsonKey(ignore: true)
  _$$EconomyStateImplCopyWith<_$EconomyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PendingEffect _$PendingEffectFromJson(Map<String, dynamic> json) {
  return _PendingEffect.fromJson(json);
}

/// @nodoc
mixin _$PendingEffect {
  String get id => throw _privateConstructorUsedError;
  int get resolveTurn => throw _privateConstructorUsedError;
  Map<String, dynamic> get effects => throw _privateConstructorUsedError;
  String? get sourceEventId => throw _privateConstructorUsedError;
  String? get unlockGovernment => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingEffectCopyWith<PendingEffect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingEffectCopyWith<$Res> {
  factory $PendingEffectCopyWith(
          PendingEffect value, $Res Function(PendingEffect) then) =
      _$PendingEffectCopyWithImpl<$Res, PendingEffect>;
  @useResult
  $Res call(
      {String id,
      int resolveTurn,
      Map<String, dynamic> effects,
      String? sourceEventId,
      String? unlockGovernment,
      String? label});
}

/// @nodoc
class _$PendingEffectCopyWithImpl<$Res, $Val extends PendingEffect>
    implements $PendingEffectCopyWith<$Res> {
  _$PendingEffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? resolveTurn = null,
    Object? effects = null,
    Object? sourceEventId = freezed,
    Object? unlockGovernment = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resolveTurn: null == resolveTurn
          ? _value.resolveTurn
          : resolveTurn // ignore: cast_nullable_to_non_nullable
              as int,
      effects: null == effects
          ? _value.effects
          : effects // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sourceEventId: freezed == sourceEventId
          ? _value.sourceEventId
          : sourceEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      unlockGovernment: freezed == unlockGovernment
          ? _value.unlockGovernment
          : unlockGovernment // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingEffectImplCopyWith<$Res>
    implements $PendingEffectCopyWith<$Res> {
  factory _$$PendingEffectImplCopyWith(
          _$PendingEffectImpl value, $Res Function(_$PendingEffectImpl) then) =
      __$$PendingEffectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int resolveTurn,
      Map<String, dynamic> effects,
      String? sourceEventId,
      String? unlockGovernment,
      String? label});
}

/// @nodoc
class __$$PendingEffectImplCopyWithImpl<$Res>
    extends _$PendingEffectCopyWithImpl<$Res, _$PendingEffectImpl>
    implements _$$PendingEffectImplCopyWith<$Res> {
  __$$PendingEffectImplCopyWithImpl(
      _$PendingEffectImpl _value, $Res Function(_$PendingEffectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? resolveTurn = null,
    Object? effects = null,
    Object? sourceEventId = freezed,
    Object? unlockGovernment = freezed,
    Object? label = freezed,
  }) {
    return _then(_$PendingEffectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resolveTurn: null == resolveTurn
          ? _value.resolveTurn
          : resolveTurn // ignore: cast_nullable_to_non_nullable
              as int,
      effects: null == effects
          ? _value._effects
          : effects // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sourceEventId: freezed == sourceEventId
          ? _value.sourceEventId
          : sourceEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      unlockGovernment: freezed == unlockGovernment
          ? _value.unlockGovernment
          : unlockGovernment // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingEffectImpl implements _PendingEffect {
  const _$PendingEffectImpl(
      {required this.id,
      required this.resolveTurn,
      required final Map<String, dynamic> effects,
      this.sourceEventId,
      this.unlockGovernment,
      this.label})
      : _effects = effects;

  factory _$PendingEffectImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingEffectImplFromJson(json);

  @override
  final String id;
  @override
  final int resolveTurn;
  final Map<String, dynamic> _effects;
  @override
  Map<String, dynamic> get effects {
    if (_effects is EqualUnmodifiableMapView) return _effects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_effects);
  }

  @override
  final String? sourceEventId;
  @override
  final String? unlockGovernment;
  @override
  final String? label;

  @override
  String toString() {
    return 'PendingEffect(id: $id, resolveTurn: $resolveTurn, effects: $effects, sourceEventId: $sourceEventId, unlockGovernment: $unlockGovernment, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingEffectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.resolveTurn, resolveTurn) ||
                other.resolveTurn == resolveTurn) &&
            const DeepCollectionEquality().equals(other._effects, _effects) &&
            (identical(other.sourceEventId, sourceEventId) ||
                other.sourceEventId == sourceEventId) &&
            (identical(other.unlockGovernment, unlockGovernment) ||
                other.unlockGovernment == unlockGovernment) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      resolveTurn,
      const DeepCollectionEquality().hash(_effects),
      sourceEventId,
      unlockGovernment,
      label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingEffectImplCopyWith<_$PendingEffectImpl> get copyWith =>
      __$$PendingEffectImplCopyWithImpl<_$PendingEffectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingEffectImplToJson(
      this,
    );
  }
}

abstract class _PendingEffect implements PendingEffect {
  const factory _PendingEffect(
      {required final String id,
      required final int resolveTurn,
      required final Map<String, dynamic> effects,
      final String? sourceEventId,
      final String? unlockGovernment,
      final String? label}) = _$PendingEffectImpl;

  factory _PendingEffect.fromJson(Map<String, dynamic> json) =
      _$PendingEffectImpl.fromJson;

  @override
  String get id;
  @override
  int get resolveTurn;
  @override
  Map<String, dynamic> get effects;
  @override
  String? get sourceEventId;
  @override
  String? get unlockGovernment;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$PendingEffectImplCopyWith<_$PendingEffectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActiveEvent _$ActiveEventFromJson(Map<String, dynamic> json) {
  return _ActiveEvent.fromJson(json);
}

/// @nodoc
mixin _$ActiveEvent {
  String get instanceId => throw _privateConstructorUsedError;
  String get eventDefId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveEventCopyWith<ActiveEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveEventCopyWith<$Res> {
  factory $ActiveEventCopyWith(
          ActiveEvent value, $Res Function(ActiveEvent) then) =
      _$ActiveEventCopyWithImpl<$Res, ActiveEvent>;
  @useResult
  $Res call(
      {String instanceId,
      String eventDefId,
      String title,
      String description,
      List<Map<String, dynamic>> choices});
}

/// @nodoc
class _$ActiveEventCopyWithImpl<$Res, $Val extends ActiveEvent>
    implements $ActiveEventCopyWith<$Res> {
  _$ActiveEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instanceId = null,
    Object? eventDefId = null,
    Object? title = null,
    Object? description = null,
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      instanceId: null == instanceId
          ? _value.instanceId
          : instanceId // ignore: cast_nullable_to_non_nullable
              as String,
      eventDefId: null == eventDefId
          ? _value.eventDefId
          : eventDefId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveEventImplCopyWith<$Res>
    implements $ActiveEventCopyWith<$Res> {
  factory _$$ActiveEventImplCopyWith(
          _$ActiveEventImpl value, $Res Function(_$ActiveEventImpl) then) =
      __$$ActiveEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String instanceId,
      String eventDefId,
      String title,
      String description,
      List<Map<String, dynamic>> choices});
}

/// @nodoc
class __$$ActiveEventImplCopyWithImpl<$Res>
    extends _$ActiveEventCopyWithImpl<$Res, _$ActiveEventImpl>
    implements _$$ActiveEventImplCopyWith<$Res> {
  __$$ActiveEventImplCopyWithImpl(
      _$ActiveEventImpl _value, $Res Function(_$ActiveEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instanceId = null,
    Object? eventDefId = null,
    Object? title = null,
    Object? description = null,
    Object? choices = null,
  }) {
    return _then(_$ActiveEventImpl(
      instanceId: null == instanceId
          ? _value.instanceId
          : instanceId // ignore: cast_nullable_to_non_nullable
              as String,
      eventDefId: null == eventDefId
          ? _value.eventDefId
          : eventDefId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveEventImpl implements _ActiveEvent {
  const _$ActiveEventImpl(
      {required this.instanceId,
      required this.eventDefId,
      required this.title,
      required this.description,
      required final List<Map<String, dynamic>> choices})
      : _choices = choices;

  factory _$ActiveEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveEventImplFromJson(json);

  @override
  final String instanceId;
  @override
  final String eventDefId;
  @override
  final String title;
  @override
  final String description;
  final List<Map<String, dynamic>> _choices;
  @override
  List<Map<String, dynamic>> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'ActiveEvent(instanceId: $instanceId, eventDefId: $eventDefId, title: $title, description: $description, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveEventImpl &&
            (identical(other.instanceId, instanceId) ||
                other.instanceId == instanceId) &&
            (identical(other.eventDefId, eventDefId) ||
                other.eventDefId == eventDefId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, instanceId, eventDefId, title,
      description, const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveEventImplCopyWith<_$ActiveEventImpl> get copyWith =>
      __$$ActiveEventImplCopyWithImpl<_$ActiveEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveEventImplToJson(
      this,
    );
  }
}

abstract class _ActiveEvent implements ActiveEvent {
  const factory _ActiveEvent(
      {required final String instanceId,
      required final String eventDefId,
      required final String title,
      required final String description,
      required final List<Map<String, dynamic>> choices}) = _$ActiveEventImpl;

  factory _ActiveEvent.fromJson(Map<String, dynamic> json) =
      _$ActiveEventImpl.fromJson;

  @override
  String get instanceId;
  @override
  String get eventDefId;
  @override
  String get title;
  @override
  String get description;
  @override
  List<Map<String, dynamic>> get choices;
  @override
  @JsonKey(ignore: true)
  _$$ActiveEventImplCopyWith<_$ActiveEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get colorHex => throw _privateConstructorUsedError;
  String get governmentId => throw _privateConstructorUsedError;
  LeaderPersonality get personality => throw _privateConstructorUsedError;
  @ResourcesConverter()
  Resources get resources => throw _privateConstructorUsedError;
  EconomyState get economy => throw _privateConstructorUsedError;
  List<City> get cities => throw _privateConstructorUsedError;
  List<ArmyUnit> get army => throw _privateConstructorUsedError;
  List<String> get researchedTechIds => throw _privateConstructorUsedError;
  String get researchingTechId => throw _privateConstructorUsedError;
  double get researchProgress => throw _privateConstructorUsedError;
  String get eraId => throw _privateConstructorUsedError;
  double get happiness => throw _privateConstructorUsedError;
  double get stability => throw _privateConstructorUsedError;
  double get militaryStrength => throw _privateConstructorUsedError;
  double get prestige => throw _privateConstructorUsedError;
  bool get isAlive => throw _privateConstructorUsedError;
  bool get isPlayer => throw _privateConstructorUsedError;
  Map<String, int> get relations => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {String id,
      String name,
      String colorHex,
      String governmentId,
      LeaderPersonality personality,
      @ResourcesConverter() Resources resources,
      EconomyState economy,
      List<City> cities,
      List<ArmyUnit> army,
      List<String> researchedTechIds,
      String researchingTechId,
      double researchProgress,
      String eraId,
      double happiness,
      double stability,
      double militaryStrength,
      double prestige,
      bool isAlive,
      bool isPlayer,
      Map<String, int> relations,
      String goal});

  $EconomyStateCopyWith<$Res> get economy;
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorHex = null,
    Object? governmentId = null,
    Object? personality = null,
    Object? resources = null,
    Object? economy = null,
    Object? cities = null,
    Object? army = null,
    Object? researchedTechIds = null,
    Object? researchingTechId = null,
    Object? researchProgress = null,
    Object? eraId = null,
    Object? happiness = null,
    Object? stability = null,
    Object? militaryStrength = null,
    Object? prestige = null,
    Object? isAlive = null,
    Object? isPlayer = null,
    Object? relations = null,
    Object? goal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
      governmentId: null == governmentId
          ? _value.governmentId
          : governmentId // ignore: cast_nullable_to_non_nullable
              as String,
      personality: null == personality
          ? _value.personality
          : personality // ignore: cast_nullable_to_non_nullable
              as LeaderPersonality,
      resources: null == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as Resources,
      economy: null == economy
          ? _value.economy
          : economy // ignore: cast_nullable_to_non_nullable
              as EconomyState,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      army: null == army
          ? _value.army
          : army // ignore: cast_nullable_to_non_nullable
              as List<ArmyUnit>,
      researchedTechIds: null == researchedTechIds
          ? _value.researchedTechIds
          : researchedTechIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      researchingTechId: null == researchingTechId
          ? _value.researchingTechId
          : researchingTechId // ignore: cast_nullable_to_non_nullable
              as String,
      researchProgress: null == researchProgress
          ? _value.researchProgress
          : researchProgress // ignore: cast_nullable_to_non_nullable
              as double,
      eraId: null == eraId
          ? _value.eraId
          : eraId // ignore: cast_nullable_to_non_nullable
              as String,
      happiness: null == happiness
          ? _value.happiness
          : happiness // ignore: cast_nullable_to_non_nullable
              as double,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as double,
      militaryStrength: null == militaryStrength
          ? _value.militaryStrength
          : militaryStrength // ignore: cast_nullable_to_non_nullable
              as double,
      prestige: null == prestige
          ? _value.prestige
          : prestige // ignore: cast_nullable_to_non_nullable
              as double,
      isAlive: null == isAlive
          ? _value.isAlive
          : isAlive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlayer: null == isPlayer
          ? _value.isPlayer
          : isPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      relations: null == relations
          ? _value.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EconomyStateCopyWith<$Res> get economy {
    return $EconomyStateCopyWith<$Res>(_value.economy, (value) {
      return _then(_value.copyWith(economy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String colorHex,
      String governmentId,
      LeaderPersonality personality,
      @ResourcesConverter() Resources resources,
      EconomyState economy,
      List<City> cities,
      List<ArmyUnit> army,
      List<String> researchedTechIds,
      String researchingTechId,
      double researchProgress,
      String eraId,
      double happiness,
      double stability,
      double militaryStrength,
      double prestige,
      bool isAlive,
      bool isPlayer,
      Map<String, int> relations,
      String goal});

  @override
  $EconomyStateCopyWith<$Res> get economy;
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorHex = null,
    Object? governmentId = null,
    Object? personality = null,
    Object? resources = null,
    Object? economy = null,
    Object? cities = null,
    Object? army = null,
    Object? researchedTechIds = null,
    Object? researchingTechId = null,
    Object? researchProgress = null,
    Object? eraId = null,
    Object? happiness = null,
    Object? stability = null,
    Object? militaryStrength = null,
    Object? prestige = null,
    Object? isAlive = null,
    Object? isPlayer = null,
    Object? relations = null,
    Object? goal = null,
  }) {
    return _then(_$CountryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
      governmentId: null == governmentId
          ? _value.governmentId
          : governmentId // ignore: cast_nullable_to_non_nullable
              as String,
      personality: null == personality
          ? _value.personality
          : personality // ignore: cast_nullable_to_non_nullable
              as LeaderPersonality,
      resources: null == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as Resources,
      economy: null == economy
          ? _value.economy
          : economy // ignore: cast_nullable_to_non_nullable
              as EconomyState,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      army: null == army
          ? _value._army
          : army // ignore: cast_nullable_to_non_nullable
              as List<ArmyUnit>,
      researchedTechIds: null == researchedTechIds
          ? _value._researchedTechIds
          : researchedTechIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      researchingTechId: null == researchingTechId
          ? _value.researchingTechId
          : researchingTechId // ignore: cast_nullable_to_non_nullable
              as String,
      researchProgress: null == researchProgress
          ? _value.researchProgress
          : researchProgress // ignore: cast_nullable_to_non_nullable
              as double,
      eraId: null == eraId
          ? _value.eraId
          : eraId // ignore: cast_nullable_to_non_nullable
              as String,
      happiness: null == happiness
          ? _value.happiness
          : happiness // ignore: cast_nullable_to_non_nullable
              as double,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as double,
      militaryStrength: null == militaryStrength
          ? _value.militaryStrength
          : militaryStrength // ignore: cast_nullable_to_non_nullable
              as double,
      prestige: null == prestige
          ? _value.prestige
          : prestige // ignore: cast_nullable_to_non_nullable
              as double,
      isAlive: null == isAlive
          ? _value.isAlive
          : isAlive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlayer: null == isPlayer
          ? _value.isPlayer
          : isPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      relations: null == relations
          ? _value._relations
          : relations // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl implements _Country {
  const _$CountryImpl(
      {required this.id,
      required this.name,
      required this.colorHex,
      required this.governmentId,
      required this.personality,
      @ResourcesConverter() this.resources = const Resources(),
      this.economy = const EconomyState(),
      final List<City> cities = const [],
      final List<ArmyUnit> army = const [],
      final List<String> researchedTechIds = const [],
      this.researchingTechId = '',
      this.researchProgress = 0,
      this.eraId = 'tribe',
      this.happiness = 100,
      this.stability = 70,
      this.militaryStrength = 50,
      this.prestige = 0,
      this.isAlive = true,
      this.isPlayer = false,
      final Map<String, int> relations = const {},
      this.goal = 'expand'})
      : _cities = cities,
        _army = army,
        _researchedTechIds = researchedTechIds,
        _relations = relations;

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String colorHex;
  @override
  final String governmentId;
  @override
  final LeaderPersonality personality;
  @override
  @JsonKey()
  @ResourcesConverter()
  final Resources resources;
  @override
  @JsonKey()
  final EconomyState economy;
  final List<City> _cities;
  @override
  @JsonKey()
  List<City> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  final List<ArmyUnit> _army;
  @override
  @JsonKey()
  List<ArmyUnit> get army {
    if (_army is EqualUnmodifiableListView) return _army;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_army);
  }

  final List<String> _researchedTechIds;
  @override
  @JsonKey()
  List<String> get researchedTechIds {
    if (_researchedTechIds is EqualUnmodifiableListView)
      return _researchedTechIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_researchedTechIds);
  }

  @override
  @JsonKey()
  final String researchingTechId;
  @override
  @JsonKey()
  final double researchProgress;
  @override
  @JsonKey()
  final String eraId;
  @override
  @JsonKey()
  final double happiness;
  @override
  @JsonKey()
  final double stability;
  @override
  @JsonKey()
  final double militaryStrength;
  @override
  @JsonKey()
  final double prestige;
  @override
  @JsonKey()
  final bool isAlive;
  @override
  @JsonKey()
  final bool isPlayer;
  final Map<String, int> _relations;
  @override
  @JsonKey()
  Map<String, int> get relations {
    if (_relations is EqualUnmodifiableMapView) return _relations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_relations);
  }

  @override
  @JsonKey()
  final String goal;

  @override
  String toString() {
    return 'Country(id: $id, name: $name, colorHex: $colorHex, governmentId: $governmentId, personality: $personality, resources: $resources, economy: $economy, cities: $cities, army: $army, researchedTechIds: $researchedTechIds, researchingTechId: $researchingTechId, researchProgress: $researchProgress, eraId: $eraId, happiness: $happiness, stability: $stability, militaryStrength: $militaryStrength, prestige: $prestige, isAlive: $isAlive, isPlayer: $isPlayer, relations: $relations, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.governmentId, governmentId) ||
                other.governmentId == governmentId) &&
            (identical(other.personality, personality) ||
                other.personality == personality) &&
            (identical(other.resources, resources) ||
                other.resources == resources) &&
            (identical(other.economy, economy) || other.economy == economy) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality().equals(other._army, _army) &&
            const DeepCollectionEquality()
                .equals(other._researchedTechIds, _researchedTechIds) &&
            (identical(other.researchingTechId, researchingTechId) ||
                other.researchingTechId == researchingTechId) &&
            (identical(other.researchProgress, researchProgress) ||
                other.researchProgress == researchProgress) &&
            (identical(other.eraId, eraId) || other.eraId == eraId) &&
            (identical(other.happiness, happiness) ||
                other.happiness == happiness) &&
            (identical(other.stability, stability) ||
                other.stability == stability) &&
            (identical(other.militaryStrength, militaryStrength) ||
                other.militaryStrength == militaryStrength) &&
            (identical(other.prestige, prestige) ||
                other.prestige == prestige) &&
            (identical(other.isAlive, isAlive) || other.isAlive == isAlive) &&
            (identical(other.isPlayer, isPlayer) ||
                other.isPlayer == isPlayer) &&
            const DeepCollectionEquality()
                .equals(other._relations, _relations) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        colorHex,
        governmentId,
        personality,
        resources,
        economy,
        const DeepCollectionEquality().hash(_cities),
        const DeepCollectionEquality().hash(_army),
        const DeepCollectionEquality().hash(_researchedTechIds),
        researchingTechId,
        researchProgress,
        eraId,
        happiness,
        stability,
        militaryStrength,
        prestige,
        isAlive,
        isPlayer,
        const DeepCollectionEquality().hash(_relations),
        goal
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {required final String id,
      required final String name,
      required final String colorHex,
      required final String governmentId,
      required final LeaderPersonality personality,
      @ResourcesConverter() final Resources resources,
      final EconomyState economy,
      final List<City> cities,
      final List<ArmyUnit> army,
      final List<String> researchedTechIds,
      final String researchingTechId,
      final double researchProgress,
      final String eraId,
      final double happiness,
      final double stability,
      final double militaryStrength,
      final double prestige,
      final bool isAlive,
      final bool isPlayer,
      final Map<String, int> relations,
      final String goal}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get colorHex;
  @override
  String get governmentId;
  @override
  LeaderPersonality get personality;
  @override
  @ResourcesConverter()
  Resources get resources;
  @override
  EconomyState get economy;
  @override
  List<City> get cities;
  @override
  List<ArmyUnit> get army;
  @override
  List<String> get researchedTechIds;
  @override
  String get researchingTechId;
  @override
  double get researchProgress;
  @override
  String get eraId;
  @override
  double get happiness;
  @override
  double get stability;
  @override
  double get militaryStrength;
  @override
  double get prestige;
  @override
  bool get isAlive;
  @override
  bool get isPlayer;
  @override
  Map<String, int> get relations;
  @override
  String get goal;
  @override
  @JsonKey(ignore: true)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WarRecord _$WarRecordFromJson(Map<String, dynamic> json) {
  return _WarRecord.fromJson(json);
}

/// @nodoc
mixin _$WarRecord {
  String get id => throw _privateConstructorUsedError;
  String get attackerId => throw _privateConstructorUsedError;
  String get defenderId => throw _privateConstructorUsedError;
  int get startTurn => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  List<String> get log => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WarRecordCopyWith<WarRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarRecordCopyWith<$Res> {
  factory $WarRecordCopyWith(WarRecord value, $Res Function(WarRecord) then) =
      _$WarRecordCopyWithImpl<$Res, WarRecord>;
  @useResult
  $Res call(
      {String id,
      String attackerId,
      String defenderId,
      int startTurn,
      bool active,
      List<String> log});
}

/// @nodoc
class _$WarRecordCopyWithImpl<$Res, $Val extends WarRecord>
    implements $WarRecordCopyWith<$Res> {
  _$WarRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attackerId = null,
    Object? defenderId = null,
    Object? startTurn = null,
    Object? active = null,
    Object? log = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      attackerId: null == attackerId
          ? _value.attackerId
          : attackerId // ignore: cast_nullable_to_non_nullable
              as String,
      defenderId: null == defenderId
          ? _value.defenderId
          : defenderId // ignore: cast_nullable_to_non_nullable
              as String,
      startTurn: null == startTurn
          ? _value.startTurn
          : startTurn // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WarRecordImplCopyWith<$Res>
    implements $WarRecordCopyWith<$Res> {
  factory _$$WarRecordImplCopyWith(
          _$WarRecordImpl value, $Res Function(_$WarRecordImpl) then) =
      __$$WarRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String attackerId,
      String defenderId,
      int startTurn,
      bool active,
      List<String> log});
}

/// @nodoc
class __$$WarRecordImplCopyWithImpl<$Res>
    extends _$WarRecordCopyWithImpl<$Res, _$WarRecordImpl>
    implements _$$WarRecordImplCopyWith<$Res> {
  __$$WarRecordImplCopyWithImpl(
      _$WarRecordImpl _value, $Res Function(_$WarRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attackerId = null,
    Object? defenderId = null,
    Object? startTurn = null,
    Object? active = null,
    Object? log = null,
  }) {
    return _then(_$WarRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      attackerId: null == attackerId
          ? _value.attackerId
          : attackerId // ignore: cast_nullable_to_non_nullable
              as String,
      defenderId: null == defenderId
          ? _value.defenderId
          : defenderId // ignore: cast_nullable_to_non_nullable
              as String,
      startTurn: null == startTurn
          ? _value.startTurn
          : startTurn // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      log: null == log
          ? _value._log
          : log // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WarRecordImpl implements _WarRecord {
  const _$WarRecordImpl(
      {required this.id,
      required this.attackerId,
      required this.defenderId,
      required this.startTurn,
      this.active = true,
      final List<String> log = const []})
      : _log = log;

  factory _$WarRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WarRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String attackerId;
  @override
  final String defenderId;
  @override
  final int startTurn;
  @override
  @JsonKey()
  final bool active;
  final List<String> _log;
  @override
  @JsonKey()
  List<String> get log {
    if (_log is EqualUnmodifiableListView) return _log;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_log);
  }

  @override
  String toString() {
    return 'WarRecord(id: $id, attackerId: $attackerId, defenderId: $defenderId, startTurn: $startTurn, active: $active, log: $log)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attackerId, attackerId) ||
                other.attackerId == attackerId) &&
            (identical(other.defenderId, defenderId) ||
                other.defenderId == defenderId) &&
            (identical(other.startTurn, startTurn) ||
                other.startTurn == startTurn) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._log, _log));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attackerId, defenderId,
      startTurn, active, const DeepCollectionEquality().hash(_log));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarRecordImplCopyWith<_$WarRecordImpl> get copyWith =>
      __$$WarRecordImplCopyWithImpl<_$WarRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WarRecordImplToJson(
      this,
    );
  }
}

abstract class _WarRecord implements WarRecord {
  const factory _WarRecord(
      {required final String id,
      required final String attackerId,
      required final String defenderId,
      required final int startTurn,
      final bool active,
      final List<String> log}) = _$WarRecordImpl;

  factory _WarRecord.fromJson(Map<String, dynamic> json) =
      _$WarRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get attackerId;
  @override
  String get defenderId;
  @override
  int get startTurn;
  @override
  bool get active;
  @override
  List<String> get log;
  @override
  @JsonKey(ignore: true)
  _$$WarRecordImplCopyWith<_$WarRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiplomacyPact _$DiplomacyPactFromJson(Map<String, dynamic> json) {
  return _DiplomacyPact.fromJson(json);
}

/// @nodoc
mixin _$DiplomacyPact {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get aId => throw _privateConstructorUsedError;
  String get bId => throw _privateConstructorUsedError;
  int get startTurn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiplomacyPactCopyWith<DiplomacyPact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiplomacyPactCopyWith<$Res> {
  factory $DiplomacyPactCopyWith(
          DiplomacyPact value, $Res Function(DiplomacyPact) then) =
      _$DiplomacyPactCopyWithImpl<$Res, DiplomacyPact>;
  @useResult
  $Res call({String id, String type, String aId, String bId, int startTurn});
}

/// @nodoc
class _$DiplomacyPactCopyWithImpl<$Res, $Val extends DiplomacyPact>
    implements $DiplomacyPactCopyWith<$Res> {
  _$DiplomacyPactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? aId = null,
    Object? bId = null,
    Object? startTurn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      aId: null == aId
          ? _value.aId
          : aId // ignore: cast_nullable_to_non_nullable
              as String,
      bId: null == bId
          ? _value.bId
          : bId // ignore: cast_nullable_to_non_nullable
              as String,
      startTurn: null == startTurn
          ? _value.startTurn
          : startTurn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiplomacyPactImplCopyWith<$Res>
    implements $DiplomacyPactCopyWith<$Res> {
  factory _$$DiplomacyPactImplCopyWith(
          _$DiplomacyPactImpl value, $Res Function(_$DiplomacyPactImpl) then) =
      __$$DiplomacyPactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String aId, String bId, int startTurn});
}

/// @nodoc
class __$$DiplomacyPactImplCopyWithImpl<$Res>
    extends _$DiplomacyPactCopyWithImpl<$Res, _$DiplomacyPactImpl>
    implements _$$DiplomacyPactImplCopyWith<$Res> {
  __$$DiplomacyPactImplCopyWithImpl(
      _$DiplomacyPactImpl _value, $Res Function(_$DiplomacyPactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? aId = null,
    Object? bId = null,
    Object? startTurn = null,
  }) {
    return _then(_$DiplomacyPactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      aId: null == aId
          ? _value.aId
          : aId // ignore: cast_nullable_to_non_nullable
              as String,
      bId: null == bId
          ? _value.bId
          : bId // ignore: cast_nullable_to_non_nullable
              as String,
      startTurn: null == startTurn
          ? _value.startTurn
          : startTurn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiplomacyPactImpl implements _DiplomacyPact {
  const _$DiplomacyPactImpl(
      {required this.id,
      required this.type,
      required this.aId,
      required this.bId,
      required this.startTurn});

  factory _$DiplomacyPactImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiplomacyPactImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String aId;
  @override
  final String bId;
  @override
  final int startTurn;

  @override
  String toString() {
    return 'DiplomacyPact(id: $id, type: $type, aId: $aId, bId: $bId, startTurn: $startTurn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiplomacyPactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.aId, aId) || other.aId == aId) &&
            (identical(other.bId, bId) || other.bId == bId) &&
            (identical(other.startTurn, startTurn) ||
                other.startTurn == startTurn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, aId, bId, startTurn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiplomacyPactImplCopyWith<_$DiplomacyPactImpl> get copyWith =>
      __$$DiplomacyPactImplCopyWithImpl<_$DiplomacyPactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiplomacyPactImplToJson(
      this,
    );
  }
}

abstract class _DiplomacyPact implements DiplomacyPact {
  const factory _DiplomacyPact(
      {required final String id,
      required final String type,
      required final String aId,
      required final String bId,
      required final int startTurn}) = _$DiplomacyPactImpl;

  factory _DiplomacyPact.fromJson(Map<String, dynamic> json) =
      _$DiplomacyPactImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get aId;
  @override
  String get bId;
  @override
  int get startTurn;
  @override
  @JsonKey(ignore: true)
  _$$DiplomacyPactImplCopyWith<_$DiplomacyPactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameLogEntry _$GameLogEntryFromJson(Map<String, dynamic> json) {
  return _GameLogEntry.fromJson(json);
}

/// @nodoc
mixin _$GameLogEntry {
  int get turn => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameLogEntryCopyWith<GameLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameLogEntryCopyWith<$Res> {
  factory $GameLogEntryCopyWith(
          GameLogEntry value, $Res Function(GameLogEntry) then) =
      _$GameLogEntryCopyWithImpl<$Res, GameLogEntry>;
  @useResult
  $Res call({int turn, String message, String tone});
}

/// @nodoc
class _$GameLogEntryCopyWithImpl<$Res, $Val extends GameLogEntry>
    implements $GameLogEntryCopyWith<$Res> {
  _$GameLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turn = null,
    Object? message = null,
    Object? tone = null,
  }) {
    return _then(_value.copyWith(
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameLogEntryImplCopyWith<$Res>
    implements $GameLogEntryCopyWith<$Res> {
  factory _$$GameLogEntryImplCopyWith(
          _$GameLogEntryImpl value, $Res Function(_$GameLogEntryImpl) then) =
      __$$GameLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int turn, String message, String tone});
}

/// @nodoc
class __$$GameLogEntryImplCopyWithImpl<$Res>
    extends _$GameLogEntryCopyWithImpl<$Res, _$GameLogEntryImpl>
    implements _$$GameLogEntryImplCopyWith<$Res> {
  __$$GameLogEntryImplCopyWithImpl(
      _$GameLogEntryImpl _value, $Res Function(_$GameLogEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turn = null,
    Object? message = null,
    Object? tone = null,
  }) {
    return _then(_$GameLogEntryImpl(
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameLogEntryImpl implements _GameLogEntry {
  const _$GameLogEntryImpl(
      {required this.turn, required this.message, this.tone = 'info'});

  factory _$GameLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameLogEntryImplFromJson(json);

  @override
  final int turn;
  @override
  final String message;
  @override
  @JsonKey()
  final String tone;

  @override
  String toString() {
    return 'GameLogEntry(turn: $turn, message: $message, tone: $tone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameLogEntryImpl &&
            (identical(other.turn, turn) || other.turn == turn) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tone, tone) || other.tone == tone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, turn, message, tone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameLogEntryImplCopyWith<_$GameLogEntryImpl> get copyWith =>
      __$$GameLogEntryImplCopyWithImpl<_$GameLogEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameLogEntryImplToJson(
      this,
    );
  }
}

abstract class _GameLogEntry implements GameLogEntry {
  const factory _GameLogEntry(
      {required final int turn,
      required final String message,
      final String tone}) = _$GameLogEntryImpl;

  factory _GameLogEntry.fromJson(Map<String, dynamic> json) =
      _$GameLogEntryImpl.fromJson;

  @override
  int get turn;
  @override
  String get message;
  @override
  String get tone;
  @override
  @JsonKey(ignore: true)
  _$$GameLogEntryImplCopyWith<_$GameLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  String get campaignId => throw _privateConstructorUsedError;
  String get civilizationName => throw _privateConstructorUsedError;
  int get turn => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  Country get player => throw _privateConstructorUsedError;
  List<Country> get aiCountries => throw _privateConstructorUsedError;
  List<MapTile> get tiles => throw _privateConstructorUsedError;
  List<ActiveEvent> get activeEvents => throw _privateConstructorUsedError;
  List<PendingEffect> get pendingEffects => throw _privateConstructorUsedError;
  List<WarRecord> get wars => throw _privateConstructorUsedError;
  List<DiplomacyPact> get pacts => throw _privateConstructorUsedError;
  List<GameLogEntry> get log => throw _privateConstructorUsedError;
  List<String> get unlockedGovernmentIds => throw _privateConstructorUsedError;
  List<String> get enactedLawIds => throw _privateConstructorUsedError;
  bool get gameOver => throw _privateConstructorUsedError;
  String? get victoryType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {String campaignId,
      String civilizationName,
      int turn,
      int year,
      int month,
      Country player,
      List<Country> aiCountries,
      List<MapTile> tiles,
      List<ActiveEvent> activeEvents,
      List<PendingEffect> pendingEffects,
      List<WarRecord> wars,
      List<DiplomacyPact> pacts,
      List<GameLogEntry> log,
      List<String> unlockedGovernmentIds,
      List<String> enactedLawIds,
      bool gameOver,
      String? victoryType});

  $CountryCopyWith<$Res> get player;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? civilizationName = null,
    Object? turn = null,
    Object? year = null,
    Object? month = null,
    Object? player = null,
    Object? aiCountries = null,
    Object? tiles = null,
    Object? activeEvents = null,
    Object? pendingEffects = null,
    Object? wars = null,
    Object? pacts = null,
    Object? log = null,
    Object? unlockedGovernmentIds = null,
    Object? enactedLawIds = null,
    Object? gameOver = null,
    Object? victoryType = freezed,
  }) {
    return _then(_value.copyWith(
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      civilizationName: null == civilizationName
          ? _value.civilizationName
          : civilizationName // ignore: cast_nullable_to_non_nullable
              as String,
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Country,
      aiCountries: null == aiCountries
          ? _value.aiCountries
          : aiCountries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      tiles: null == tiles
          ? _value.tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as List<MapTile>,
      activeEvents: null == activeEvents
          ? _value.activeEvents
          : activeEvents // ignore: cast_nullable_to_non_nullable
              as List<ActiveEvent>,
      pendingEffects: null == pendingEffects
          ? _value.pendingEffects
          : pendingEffects // ignore: cast_nullable_to_non_nullable
              as List<PendingEffect>,
      wars: null == wars
          ? _value.wars
          : wars // ignore: cast_nullable_to_non_nullable
              as List<WarRecord>,
      pacts: null == pacts
          ? _value.pacts
          : pacts // ignore: cast_nullable_to_non_nullable
              as List<DiplomacyPact>,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as List<GameLogEntry>,
      unlockedGovernmentIds: null == unlockedGovernmentIds
          ? _value.unlockedGovernmentIds
          : unlockedGovernmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enactedLawIds: null == enactedLawIds
          ? _value.enactedLawIds
          : enactedLawIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gameOver: null == gameOver
          ? _value.gameOver
          : gameOver // ignore: cast_nullable_to_non_nullable
              as bool,
      victoryType: freezed == victoryType
          ? _value.victoryType
          : victoryType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res> get player {
    return $CountryCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String campaignId,
      String civilizationName,
      int turn,
      int year,
      int month,
      Country player,
      List<Country> aiCountries,
      List<MapTile> tiles,
      List<ActiveEvent> activeEvents,
      List<PendingEffect> pendingEffects,
      List<WarRecord> wars,
      List<DiplomacyPact> pacts,
      List<GameLogEntry> log,
      List<String> unlockedGovernmentIds,
      List<String> enactedLawIds,
      bool gameOver,
      String? victoryType});

  @override
  $CountryCopyWith<$Res> get player;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? civilizationName = null,
    Object? turn = null,
    Object? year = null,
    Object? month = null,
    Object? player = null,
    Object? aiCountries = null,
    Object? tiles = null,
    Object? activeEvents = null,
    Object? pendingEffects = null,
    Object? wars = null,
    Object? pacts = null,
    Object? log = null,
    Object? unlockedGovernmentIds = null,
    Object? enactedLawIds = null,
    Object? gameOver = null,
    Object? victoryType = freezed,
  }) {
    return _then(_$GameStateImpl(
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      civilizationName: null == civilizationName
          ? _value.civilizationName
          : civilizationName // ignore: cast_nullable_to_non_nullable
              as String,
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Country,
      aiCountries: null == aiCountries
          ? _value._aiCountries
          : aiCountries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      tiles: null == tiles
          ? _value._tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as List<MapTile>,
      activeEvents: null == activeEvents
          ? _value._activeEvents
          : activeEvents // ignore: cast_nullable_to_non_nullable
              as List<ActiveEvent>,
      pendingEffects: null == pendingEffects
          ? _value._pendingEffects
          : pendingEffects // ignore: cast_nullable_to_non_nullable
              as List<PendingEffect>,
      wars: null == wars
          ? _value._wars
          : wars // ignore: cast_nullable_to_non_nullable
              as List<WarRecord>,
      pacts: null == pacts
          ? _value._pacts
          : pacts // ignore: cast_nullable_to_non_nullable
              as List<DiplomacyPact>,
      log: null == log
          ? _value._log
          : log // ignore: cast_nullable_to_non_nullable
              as List<GameLogEntry>,
      unlockedGovernmentIds: null == unlockedGovernmentIds
          ? _value._unlockedGovernmentIds
          : unlockedGovernmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enactedLawIds: null == enactedLawIds
          ? _value._enactedLawIds
          : enactedLawIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gameOver: null == gameOver
          ? _value.gameOver
          : gameOver // ignore: cast_nullable_to_non_nullable
              as bool,
      victoryType: freezed == victoryType
          ? _value.victoryType
          : victoryType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {required this.campaignId,
      required this.civilizationName,
      this.turn = 0,
      this.year = -10000,
      this.month = 1,
      required this.player,
      final List<Country> aiCountries = const [],
      final List<MapTile> tiles = const [],
      final List<ActiveEvent> activeEvents = const [],
      final List<PendingEffect> pendingEffects = const [],
      final List<WarRecord> wars = const [],
      final List<DiplomacyPact> pacts = const [],
      final List<GameLogEntry> log = const [],
      final List<String> unlockedGovernmentIds = const [],
      final List<String> enactedLawIds = const [],
      this.gameOver = false,
      this.victoryType})
      : _aiCountries = aiCountries,
        _tiles = tiles,
        _activeEvents = activeEvents,
        _pendingEffects = pendingEffects,
        _wars = wars,
        _pacts = pacts,
        _log = log,
        _unlockedGovernmentIds = unlockedGovernmentIds,
        _enactedLawIds = enactedLawIds;

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  final String campaignId;
  @override
  final String civilizationName;
  @override
  @JsonKey()
  final int turn;
  @override
  @JsonKey()
  final int year;
  @override
  @JsonKey()
  final int month;
  @override
  final Country player;
  final List<Country> _aiCountries;
  @override
  @JsonKey()
  List<Country> get aiCountries {
    if (_aiCountries is EqualUnmodifiableListView) return _aiCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aiCountries);
  }

  final List<MapTile> _tiles;
  @override
  @JsonKey()
  List<MapTile> get tiles {
    if (_tiles is EqualUnmodifiableListView) return _tiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiles);
  }

  final List<ActiveEvent> _activeEvents;
  @override
  @JsonKey()
  List<ActiveEvent> get activeEvents {
    if (_activeEvents is EqualUnmodifiableListView) return _activeEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeEvents);
  }

  final List<PendingEffect> _pendingEffects;
  @override
  @JsonKey()
  List<PendingEffect> get pendingEffects {
    if (_pendingEffects is EqualUnmodifiableListView) return _pendingEffects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingEffects);
  }

  final List<WarRecord> _wars;
  @override
  @JsonKey()
  List<WarRecord> get wars {
    if (_wars is EqualUnmodifiableListView) return _wars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wars);
  }

  final List<DiplomacyPact> _pacts;
  @override
  @JsonKey()
  List<DiplomacyPact> get pacts {
    if (_pacts is EqualUnmodifiableListView) return _pacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pacts);
  }

  final List<GameLogEntry> _log;
  @override
  @JsonKey()
  List<GameLogEntry> get log {
    if (_log is EqualUnmodifiableListView) return _log;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_log);
  }

  final List<String> _unlockedGovernmentIds;
  @override
  @JsonKey()
  List<String> get unlockedGovernmentIds {
    if (_unlockedGovernmentIds is EqualUnmodifiableListView)
      return _unlockedGovernmentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unlockedGovernmentIds);
  }

  final List<String> _enactedLawIds;
  @override
  @JsonKey()
  List<String> get enactedLawIds {
    if (_enactedLawIds is EqualUnmodifiableListView) return _enactedLawIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enactedLawIds);
  }

  @override
  @JsonKey()
  final bool gameOver;
  @override
  final String? victoryType;

  @override
  String toString() {
    return 'GameState(campaignId: $campaignId, civilizationName: $civilizationName, turn: $turn, year: $year, month: $month, player: $player, aiCountries: $aiCountries, tiles: $tiles, activeEvents: $activeEvents, pendingEffects: $pendingEffects, wars: $wars, pacts: $pacts, log: $log, unlockedGovernmentIds: $unlockedGovernmentIds, enactedLawIds: $enactedLawIds, gameOver: $gameOver, victoryType: $victoryType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.civilizationName, civilizationName) ||
                other.civilizationName == civilizationName) &&
            (identical(other.turn, turn) || other.turn == turn) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.player, player) || other.player == player) &&
            const DeepCollectionEquality()
                .equals(other._aiCountries, _aiCountries) &&
            const DeepCollectionEquality().equals(other._tiles, _tiles) &&
            const DeepCollectionEquality()
                .equals(other._activeEvents, _activeEvents) &&
            const DeepCollectionEquality()
                .equals(other._pendingEffects, _pendingEffects) &&
            const DeepCollectionEquality().equals(other._wars, _wars) &&
            const DeepCollectionEquality().equals(other._pacts, _pacts) &&
            const DeepCollectionEquality().equals(other._log, _log) &&
            const DeepCollectionEquality()
                .equals(other._unlockedGovernmentIds, _unlockedGovernmentIds) &&
            const DeepCollectionEquality()
                .equals(other._enactedLawIds, _enactedLawIds) &&
            (identical(other.gameOver, gameOver) ||
                other.gameOver == gameOver) &&
            (identical(other.victoryType, victoryType) ||
                other.victoryType == victoryType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      campaignId,
      civilizationName,
      turn,
      year,
      month,
      player,
      const DeepCollectionEquality().hash(_aiCountries),
      const DeepCollectionEquality().hash(_tiles),
      const DeepCollectionEquality().hash(_activeEvents),
      const DeepCollectionEquality().hash(_pendingEffects),
      const DeepCollectionEquality().hash(_wars),
      const DeepCollectionEquality().hash(_pacts),
      const DeepCollectionEquality().hash(_log),
      const DeepCollectionEquality().hash(_unlockedGovernmentIds),
      const DeepCollectionEquality().hash(_enactedLawIds),
      gameOver,
      victoryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(
      this,
    );
  }
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {required final String campaignId,
      required final String civilizationName,
      final int turn,
      final int year,
      final int month,
      required final Country player,
      final List<Country> aiCountries,
      final List<MapTile> tiles,
      final List<ActiveEvent> activeEvents,
      final List<PendingEffect> pendingEffects,
      final List<WarRecord> wars,
      final List<DiplomacyPact> pacts,
      final List<GameLogEntry> log,
      final List<String> unlockedGovernmentIds,
      final List<String> enactedLawIds,
      final bool gameOver,
      final String? victoryType}) = _$GameStateImpl;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  String get campaignId;
  @override
  String get civilizationName;
  @override
  int get turn;
  @override
  int get year;
  @override
  int get month;
  @override
  Country get player;
  @override
  List<Country> get aiCountries;
  @override
  List<MapTile> get tiles;
  @override
  List<ActiveEvent> get activeEvents;
  @override
  List<PendingEffect> get pendingEffects;
  @override
  List<WarRecord> get wars;
  @override
  List<DiplomacyPact> get pacts;
  @override
  List<GameLogEntry> get log;
  @override
  List<String> get unlockedGovernmentIds;
  @override
  List<String> get enactedLawIds;
  @override
  bool get gameOver;
  @override
  String? get victoryType;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
