class Resources {
  const Resources({
    this.food = 0,
    this.wood = 0,
    this.stone = 0,
    this.iron = 0,
    this.coal = 0,
    this.oil = 0,
    this.gold = 0,
    this.electricity = 0,
    this.money = 0,
    this.science = 0,
  });

  final double food;
  final double wood;
  final double stone;
  final double iron;
  final double coal;
  final double oil;
  final double gold;
  final double electricity;
  final double money;
  final double science;

  Resources copyWith({
    double? food,
    double? wood,
    double? stone,
    double? iron,
    double? coal,
    double? oil,
    double? gold,
    double? electricity,
    double? money,
    double? science,
  }) {
    return Resources(
      food: food ?? this.food,
      wood: wood ?? this.wood,
      stone: stone ?? this.stone,
      iron: iron ?? this.iron,
      coal: coal ?? this.coal,
      oil: oil ?? this.oil,
      gold: gold ?? this.gold,
      electricity: electricity ?? this.electricity,
      money: money ?? this.money,
      science: science ?? this.science,
    );
  }

  Resources operator +(Resources other) {
    return Resources(
      food: food + other.food,
      wood: wood + other.wood,
      stone: stone + other.stone,
      iron: iron + other.iron,
      coal: coal + other.coal,
      oil: oil + other.oil,
      gold: gold + other.gold,
      electricity: electricity + other.electricity,
      money: money + other.money,
      science: science + other.science,
    );
  }

  Resources applyMap(Map<String, dynamic> map, {double scale = 1}) {
    double read(String key) => (map[key] as num?)?.toDouble() ?? 0;
    return Resources(
      food: food + read('food') * scale,
      wood: wood + read('wood') * scale,
      stone: stone + read('stone') * scale,
      iron: iron + read('iron') * scale,
      coal: coal + read('coal') * scale,
      oil: oil + read('oil') * scale,
      gold: gold + read('gold') * scale,
      electricity: electricity + read('electricity') * scale,
      money: money + read('money') * scale,
      science: science + read('science') * scale,
    );
  }

  Resources clampMin() {
    double c(double v) => v < 0 ? 0 : v;
    return Resources(
      food: c(food),
      wood: c(wood),
      stone: c(stone),
      iron: c(iron),
      coal: c(coal),
      oil: c(oil),
      gold: c(gold),
      electricity: c(electricity),
      money: money,
      science: c(science),
    );
  }

  Map<String, dynamic> toJson() => {
        'food': food,
        'wood': wood,
        'stone': stone,
        'iron': iron,
        'coal': coal,
        'oil': oil,
        'gold': gold,
        'electricity': electricity,
        'money': money,
        'science': science,
      };

  factory Resources.fromJson(Map<String, dynamic> json) {
    double read(String key) => (json[key] as num?)?.toDouble() ?? 0;
    return Resources(
      food: read('food'),
      wood: read('wood'),
      stone: read('stone'),
      iron: read('iron'),
      coal: read('coal'),
      oil: read('oil'),
      gold: read('gold'),
      electricity: read('electricity'),
      money: read('money'),
      science: read('science'),
    );
  }

  static const empty = Resources();
}
