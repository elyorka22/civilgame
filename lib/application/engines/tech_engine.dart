import '../../data/content/content_repository.dart';
import '../../domain/entities/game_models.dart';

class TechEngine {
  Country startResearch(Country country, String techId, GameContent content) {
    final tech = content.techById(techId);
    if (tech == null) return country;
    if (country.researchedTechIds.contains(techId)) return country;
    for (final pre in tech.prerequisites) {
      if (!country.researchedTechIds.contains(pre)) return country;
    }
    return country.copyWith(
      researchingTechId: techId,
      researchProgress: country.researchingTechId == techId
          ? country.researchProgress
          : 0,
    );
  }

  Country tickResearch(Country country, GameContent content) {
    if (country.researchingTechId.isEmpty) return country;
    final tech = content.techById(country.researchingTechId);
    if (tech == null) return country;

    final era = content.eraById(country.eraId);
    final gov = content.governmentById(country.governmentId);
    final scienceRate = (era.bonuses['scienceRate'] ?? 1) *
        (1 + (gov.bonuses['science'] ?? 0));
    final progress = country.researchProgress +
        country.resources.science * 0.15 * scienceRate +
        3;

    if (progress >= tech.cost) {
      final researched = [...country.researchedTechIds, tech.id];
      return country.copyWith(
        researchedTechIds: researched,
        researchingTechId: '',
        researchProgress: 0,
        resources: country.resources.copyWith(science: 0),
        militaryStrength:
            country.militaryStrength + (tech.effects['military'] ?? 0) * 40,
      );
    }

    return country.copyWith(researchProgress: progress);
  }

  String? checkEraAdvancement(Country country, GameContent content) {
    final current = content.eraById(country.eraId);
    for (final era in content.eras) {
      if (era.order <= current.order) continue;
      final ready = era.requiredTechIds.every(country.researchedTechIds.contains);
      if (ready) return era.id;
    }
    return null;
  }

  Country advanceEra(Country country, String eraId, GameContent content) {
    final era = content.eraById(eraId);
    final cities = country.cities
        .map((c) => c.copyWith(visualTier: era.cityVisual))
        .toList();
    return country.copyWith(eraId: eraId, cities: cities);
  }
}
