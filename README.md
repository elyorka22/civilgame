# Rise of Civilization

Premium turn-based mobile strategy game built with Flutter.

## Stack

- Flutter + Clean Architecture
- Riverpod state management
- GoRouter navigation
- Freezed immutable models
- Hive local saves
- JSON-driven eras, governments, technologies, events, buildings, units

## Run

```bash
export PATH="/Users/admin/flutter-compat/bin:$PATH"
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
# or: flutter run
```

## Play loop

1. Start a civilization from the splash screen
2. Manage resources, research, government, cities, and laws
3. Resolve events (some effects are delayed by months/years)
4. End turn to advance one month
5. AI civilizations act, war, trade, ally, revolt, and collapse on their own

## Content

Add new gameplay content under `assets/content/*.json` without changing engine code.
