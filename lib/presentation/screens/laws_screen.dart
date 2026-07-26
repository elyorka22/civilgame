import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class LawsScreen extends ConsumerWidget {
  const LawsScreen({super.key});

  static const laws = [
    ('open_borders', 'Open Borders', 'Boosts trade, slightly lowers security.'),
    ('conscription', 'Conscription', 'Raises military readiness, lowers happiness.'),
    ('free_press', 'Free Press', 'Raises science and happiness, lowers stability.'),
    ('rationing', 'Rationing', 'Preserves food, lowers happiness.'),
    ('industrial_mandate', 'Industrial Mandate', 'Boosts economy, raises pollution unrest.'),
    ('research_grants', 'Research Grants', 'Boosts science at a money cost.'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    if (game == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Laws')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: laws.map((law) {
          final active = game.enactedLawIds.contains(law.$1);
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GlassPanel(
              onTap: () =>
                  ref.read(gameControllerProvider.notifier).toggleLaw(law.$1),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(law.$2,
                            style: TextStyle(
                              color: active ? AppColors.gold : AppColors.ice,
                              fontWeight: FontWeight.w700,
                            )),
                        const SizedBox(height: 4),
                        Text(law.$3, style: const TextStyle(color: AppColors.mist, fontSize: 12)),
                      ],
                    ),
                  ),
                  Switch(
                    value: active,
                    activeColor: AppColors.gold,
                    onChanged: (_) => ref
                        .read(gameControllerProvider.notifier)
                        .toggleLaw(law.$1),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
