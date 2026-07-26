import 'package:flutter_test/flutter_test.dart';
import 'package:rise_of_civilization/application/engines/turn_engine.dart';
import 'package:rise_of_civilization/domain/content/content_defs.dart';
import 'package:rise_of_civilization/data/content/content_repository.dart';

GameContent _sampleContent() {
  return GameContent(
    eras: [
      EraDef.fromJson({
        'id': 'tribe',
        'name': 'Tribe Age',
        'order': 0,
        'description': 'Start',
        'yearStart': -10000,
        'requiredTechIds': [],
        'cityVisual': 'village',
        'bonuses': {
          'foodProduction': 1.0,
          'scienceRate': 0.6,
          'militaryPower': 0.5
        },
      }),
      EraDef.fromJson({
        'id': 'ancient',
        'name': 'Ancient Age',
        'order': 1,
        'description': 'Next',
        'yearStart': -3000,
        'requiredTechIds': ['agriculture'],
        'cityVisual': 'ancient_city',
        'bonuses': {
          'foodProduction': 1.3,
          'scienceRate': 1.0,
          'militaryPower': 0.9
        },
      }),
    ],
    governments: [
      GovernmentDef.fromJson({
        'id': 'tribal_council',
        'name': 'Tribal Council',
        'description': 'Elders',
        'unlockedEraId': 'tribe',
        'bonuses': {'happiness': 0.1, 'stability': 0.15},
        'penalties': {},
        'eventsTag': 'tribal',
      }),
    ],
    technologies: [
      TechnologyDef.fromJson({
        'id': 'fire',
        'name': 'Fire',
        'eraId': 'tribe',
        'cost': 20,
        'prerequisites': [],
        'effects': {'food': 0.05},
        'description': 'Warmth',
      }),
      TechnologyDef.fromJson({
        'id': 'agriculture',
        'name': 'Agriculture',
        'eraId': 'ancient',
        'cost': 80,
        'prerequisites': ['fire'],
        'effects': {'food': 0.35},
        'description': 'Fields',
      }),
    ],
    events: [
      GameEventDef.fromJson({
        'id': 'flood',
        'title': 'Flood',
        'description': 'Water rises',
        'category': 'disaster',
        'minEraId': 'tribe',
        'weight': 10,
        'choices': [
          {
            'id': 'evacuate',
            'label': 'Evacuate',
            'immediate': {'food': -10},
            'delayed': [
              {
                'turns': 2,
                'effects': {'happiness': 5},
              }
            ],
          }
        ],
      }),
    ],
    buildings: [
      BuildingDef.fromJson({
        'id': 'campfire',
        'name': 'Campfire',
        'eraId': 'tribe',
        'cost': {'wood': 20},
        'effects': {'happiness': 5},
        'description': 'Heart',
      }),
    ],
    units: [
      UnitDef.fromJson({
        'id': 'hunters',
        'name': 'Hunters',
        'eraId': 'tribe',
        'cost': {'food': 20},
        'strength': 8,
        'upkeep': {'food': 2},
        'roles': ['attack', 'defend'],
      }),
    ],
  );
}

void main() {
  test('new game creates player tribe and AI countries', () {
    final engine = TurnEngine();
    final content = _sampleContent();
    final state = engine.createNewGame(
      civilizationName: 'TestCiv',
      content: content,
    );

    expect(state.civilizationName, 'TestCiv');
    expect(state.player.eraId, 'tribe');
    expect(state.player.cities, isNotEmpty);
    expect(state.aiCountries.length, greaterThanOrEqualTo(1));
    expect(state.tiles, isNotEmpty);
  });

  test('end turn advances month and keeps player alive', () {
    final engine = TurnEngine();
    final content = _sampleContent();
    var state = engine.createNewGame(
      civilizationName: 'Aurora',
      content: content,
    );
    final turn = state.turn;
    state = engine.advanceTurn(state, content);
    expect(state.turn, turn + 1);
    expect(state.player.isAlive, isTrue);
  });
}
