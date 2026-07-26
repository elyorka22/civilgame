import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class TechnologyScreen extends ConsumerWidget {
  const TechnologyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    final content = ref.watch(contentProvider).valueOrNull;
    if (game == null || content == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final researching = content.techById(game.player.researchingTechId);

    return Scaffold(
      appBar: AppBar(title: const Text('Technology')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (researching != null)
            GlassPanel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Researching: ${researching.name}',
                      style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (game.player.researchProgress / researching.cost).clamp(0, 1),
                    color: AppColors.info,
                    backgroundColor: AppColors.slate,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${game.player.researchProgress.toStringAsFixed(0)} / ${researching.cost.toStringAsFixed(0)}',
                    style: const TextStyle(color: AppColors.mist, fontSize: 12),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),
          ...content.eras.map((era) {
            final techs = content.technologies.where((t) => t.eraId == era.id);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(era.name,
                      style: const TextStyle(color: AppColors.gold, fontSize: 16, fontWeight: FontWeight.w700)),
                ),
                ...techs.map((t) {
                  final done = game.player.researchedTechIds.contains(t.id);
                  final prereqOk = t.prerequisites.every(game.player.researchedTechIds.contains);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GlassPanel(
                      onTap: done || !prereqOk
                          ? null
                          : () => ref.read(gameControllerProvider.notifier).research(t.id),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(t.name,
                                    style: TextStyle(
                                      color: done ? AppColors.success : AppColors.ice,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                              Text('${t.cost.toStringAsFixed(0)}',
                                  style: const TextStyle(color: AppColors.mist, fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(t.description,
                              style: const TextStyle(color: AppColors.mist, fontSize: 12)),
                          if (!prereqOk && !done)
                            const Text('Prerequisites incomplete',
                                style: TextStyle(color: AppColors.warning, fontSize: 11)),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }
}
