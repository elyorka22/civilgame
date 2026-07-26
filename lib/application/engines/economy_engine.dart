import '../../data/content/content_repository.dart';
import '../../domain/entities/game_models.dart';

class EconomyEngine {
  Country tick(Country country, GameContent content) {
    final era = content.eraById(country.eraId);
    final gov = content.governmentById(country.governmentId);
    final foodMult = era.bonuses['foodProduction'] ?? 1.0;
    final scienceMult = era.bonuses['scienceRate'] ?? 1.0;
    final economyBonus = gov.bonuses['economy'] ?? 0.0;
    final scienceBonus = gov.bonuses['science'] ?? 0.0;

    final pop = country.cities.fold<double>(0, (s, c) => s + c.population);
    final workers = (pop * 0.45).clamp(1, 999999);
    final foodGain = (8 + workers * 0.08) * foodMult;
    final woodGain = 4 + workers * 0.02;
    final stoneGain = 2 + workers * 0.015;
    final moneyGain =
        (5 + workers * 0.05) * (1 + economyBonus) * (country.economy.taxRate / 10);
    final scienceGain =
        (2 + workers * 0.03) * scienceMult * (1 + scienceBonus);

    var ironGain = 0.0;
    var coalGain = 0.0;
    var oilGain = 0.0;
    var elecGain = 0.0;

    for (final city in country.cities) {
      for (final bid in city.buildingIds) {
        final b = content.buildingById(bid);
        if (b == null) continue;
        ironGain += b.effects['iron'] ?? 0;
        coalGain += b.effects['coal'] ?? 0;
        oilGain += b.effects['oil'] ?? 0;
        elecGain += b.effects['electricity'] ?? 0;
      }
    }

    for (final techId in country.researchedTechIds) {
      final tech = content.techById(techId);
      if (tech == null) continue;
      if (tech.effects.containsKey('food')) {
        // already reflected loosely via era
      }
    }

    final foodNeed = pop * 0.12;
    final netFood = foodGain - foodNeed;

    var inflation = country.economy.inflation;
    if (country.resources.money > 5000) inflation += 0.05;
    inflation = (inflation * 0.98).clamp(0, 40);

    var unemployment = country.economy.unemployment;
    unemployment += (country.economy.taxRate - 12) * 0.02;
    unemployment = unemployment.clamp(0, 40);

    final gdp = moneyGain * 12 + pop * 0.4;
    var debt = country.economy.nationalDebt;
    if (country.resources.money < 0) debt += country.resources.money.abs() * 0.1;
    debt = (debt * 1.002).clamp(0, 999999);

    final exports = 5 + country.cities.length * 3.0;
    final imports = 3 + unemployment * 0.5;

    var happiness = country.happiness;
    if (netFood < 0) happiness -= 2;
    if (netFood > 10) happiness += 0.5;
    happiness += (gov.bonuses['happiness'] ?? 0) * 2;
    happiness = happiness.clamp(0, 100);

    var stability = country.stability;
    stability += (gov.bonuses['stability'] ?? 0) * 2;
    if (unemployment > 20) stability -= 1;
    stability = stability.clamp(0, 100);

    final grownCities = country.cities.map((c) {
      var growth = 0.4;
      if (netFood > 0) growth += 0.3;
      if (happiness > 70) growth += 0.2;
      return c.copyWith(population: c.population + growth);
    }).toList();

    final updatedResources = country.resources
        .copyWith(
          food: country.resources.food + netFood,
          wood: country.resources.wood + woodGain,
          stone: country.resources.stone + stoneGain,
          iron: country.resources.iron + ironGain,
          coal: country.resources.coal + coalGain,
          oil: country.resources.oil + oilGain,
          electricity: country.resources.electricity + elecGain,
          money: country.resources.money + moneyGain - debt * 0.001,
          science: country.resources.science + scienceGain,
          gold: country.resources.gold + 0.2,
        )
        .clampMin();

    return country.copyWith(
      resources: updatedResources,
      cities: grownCities,
      happiness: happiness,
      stability: stability,
      economy: country.economy.copyWith(
        gdp: gdp,
        inflation: inflation,
        unemployment: unemployment,
        nationalDebt: debt,
        exports: exports,
        imports: imports,
      ),
    );
  }

  Country setTaxRate(Country country, double rate) {
    return country.copyWith(
      economy: country.economy.copyWith(taxRate: rate.clamp(0, 40)),
    );
  }
}
