import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class CitiesScreen extends ConsumerWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    final content = ref.watch(contentProvider).valueOrNull;
    if (game == null || content == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final eraOrder = content.eraById(game.player.eraId).order;

    return Scaffold(
      appBar: AppBar(title: const Text('Cities')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GoldButton(
            label: 'FOUND CITY (100¤ + 60 wood)',
            onPressed: () => ref
                .read(gameControllerProvider.notifier)
                .foundCity('New Settlement'),
          ),
          const SizedBox(height: 12),
          ...game.player.cities.map((city) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GlassPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(city.name,
                        style: const TextStyle(color: AppColors.gold, fontSize: 18, fontWeight: FontWeight.w700)),
                    Text(
                      'Pop ${city.population.toStringAsFixed(0)} · ${city.visualTier.replaceAll('_', ' ')} · (${city.x},${city.y})',
                      style: const TextStyle(color: AppColors.mist, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      city.buildingIds.isEmpty
                          ? 'No buildings'
                          : 'Buildings: ${city.buildingIds.join(', ')}',
                      style: const TextStyle(color: AppColors.ice, fontSize: 12),
                    ),
                    if (city.id == game.player.cities.first.id) ...[
                      const SizedBox(height: 10),
                      const Text('Construct', style: TextStyle(color: AppColors.mist, fontSize: 12)),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: content.buildings
                            .where((b) => content.eraById(b.eraId).order <= eraOrder)
                            .where((b) => !city.buildingIds.contains(b.id))
                            .map((b) => ActionChip(
                                  label: Text(b.name, style: const TextStyle(fontSize: 11)),
                                  backgroundColor: AppColors.slate,
                                  onPressed: () => ref
                                      .read(gameControllerProvider.notifier)
                                      .buildInCapital(b.id),
                                ))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
