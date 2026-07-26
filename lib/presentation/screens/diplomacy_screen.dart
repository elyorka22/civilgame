import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class DiplomacyScreen extends ConsumerWidget {
  const DiplomacyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    if (game == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Diplomacy')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Civilizations', style: TextStyle(color: AppColors.ice, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ...game.aiCountries.map((c) {
            final rel = game.player.relations[c.id] ?? 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GlassPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            c.name,
                            style: TextStyle(
                              color: c.isAlive ? AppColors.gold : AppColors.mist,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(c.isAlive ? 'Active' : 'Collapsed',
                            style: TextStyle(
                              color: c.isAlive ? AppColors.success : AppColors.danger,
                              fontSize: 12,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${c.personality.name} · ${c.goal} · Era ${c.eraId}',
                      style: const TextStyle(color: AppColors.mist, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text('Relation: $rel', style: const TextStyle(color: AppColors.info, fontSize: 12)),
                    Text(
                      'Mil ${c.militaryStrength.toStringAsFixed(0)} · Pop ${c.cities.fold<double>(0, (s, x) => s + x.population).toStringAsFixed(0)} · Gov ${c.governmentId}',
                      style: const TextStyle(color: AppColors.mist, fontSize: 11),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          const Text('Pacts', style: TextStyle(color: AppColors.ice, fontWeight: FontWeight.w600)),
          ...game.pacts.map((p) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('${p.type}: ${p.aId} ↔ ${p.bId}',
                    style: const TextStyle(color: AppColors.ice, fontSize: 13)),
                subtitle: Text('Since turn ${p.startTurn}',
                    style: const TextStyle(color: AppColors.mist, fontSize: 11)),
              )),
        ],
      ),
    );
  }
}
