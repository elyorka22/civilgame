import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class GovernmentScreen extends ConsumerWidget {
  const GovernmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    final content = ref.watch(contentProvider).valueOrNull;
    if (game == null || content == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Government')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Rule determines the destiny of ${game.civilizationName}.',
            style: const TextStyle(color: AppColors.mist),
          ),
          const SizedBox(height: 12),
          ...content.governments.map((g) {
            final unlocked = game.unlockedGovernmentIds.contains(g.id);
            final selected = game.player.governmentId == g.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GlassPanel(
                onTap: unlocked
                    ? () => ref
                        .read(gameControllerProvider.notifier)
                        .setGovernment(g.id)
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            g.name,
                            style: TextStyle(
                              color: selected ? AppColors.gold : AppColors.ice,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        if (selected)
                          const Icon(Icons.check_circle, color: AppColors.gold, size: 18),
                        if (!unlocked)
                          const Icon(Icons.lock, color: AppColors.mist, size: 18),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(g.description, style: const TextStyle(color: AppColors.mist, fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(
                      'Bonuses: ${g.bonuses.entries.map((e) => '${e.key} ${(e.value * 100).toStringAsFixed(0)}%').join(' · ')}',
                      style: const TextStyle(color: AppColors.info, fontSize: 11),
                    ),
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
