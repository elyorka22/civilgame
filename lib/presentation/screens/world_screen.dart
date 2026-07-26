import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';
import '../widgets/world_map_view.dart';

class WorldScreen extends ConsumerWidget {
  const WorldScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    if (game == null) {
      return const Scaffold(body: Center(child: Text('No game')));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('World Map')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GlassPanel(
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: WorldMapView(tiles: game.tiles),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: GoldButton(
                    label: 'EXPAND BORDERS (20¤)',
                    onPressed: () =>
                        ref.read(gameControllerProvider.notifier).expandBorders(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Text(
              'Owned tiles: ${game.tiles.where((t) => t.ownerId == game.player.id).length}  ·  Cities: ${game.player.cities.length}',
              style: const TextStyle(color: AppColors.mist, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
