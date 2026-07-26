import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    if (game == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Events')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (game.activeEvents.isEmpty)
            const GlassPanel(
              child: Text(
                'No active events. End turns to let history unfold.',
                style: TextStyle(color: AppColors.mist),
              ),
            ),
          ...game.activeEvents.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GlassPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title,
                        style: const TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(height: 8),
                    Text(e.description, style: const TextStyle(color: AppColors.ice, height: 1.4)),
                    const SizedBox(height: 12),
                    ...e.choices.map((c) {
                      final id = c['id'] as String? ?? '';
                      final label = c['label'] as String? ?? 'Choice';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GoldButton(
                          label: label.toUpperCase(),
                          onPressed: () => ref
                              .read(gameControllerProvider.notifier)
                              .resolveEvent(e.instanceId, id),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          const Text('Chronicle', style: TextStyle(color: AppColors.ice, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ...game.log.reversed.take(30).map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                'T${entry.turn}: ${entry.message}',
                style: TextStyle(
                  color: entry.tone == 'danger'
                      ? AppColors.danger
                      : entry.tone == 'good'
                          ? AppColors.success
                          : AppColors.mist,
                  fontSize: 12,
                ),
              ),
            );
          }),
          if (game.pendingEffects.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text('Delayed Consequences',
                style: TextStyle(color: AppColors.warning, fontWeight: FontWeight.w600)),
            ...game.pendingEffects.map((p) => Text(
                  'Turn ${p.resolveTurn}: ${p.label ?? 'Pending effect'}',
                  style: const TextStyle(color: AppColors.mist, fontSize: 12),
                )),
          ],
        ],
      ),
    );
  }
}
