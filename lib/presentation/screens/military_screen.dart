import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/entities/game_models.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class MilitaryScreen extends ConsumerWidget {
  const MilitaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    final content = ref.watch(contentProvider).valueOrNull;
    if (game == null || content == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final power = ref
        .read(turnEngineProvider)
        .war
        .armyPower(game.player, content);

    return Scaffold(
      appBar: AppBar(title: const Text('Military')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GlassPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Army Power: ${power.toStringAsFixed(0)}',
                    style: const TextStyle(color: AppColors.gold, fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(
                  'Strength ${game.player.militaryStrength.toStringAsFixed(0)} · Morale & supply matter more than buttons.',
                  style: const TextStyle(color: AppColors.mist, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Units', style: TextStyle(color: AppColors.ice, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ...game.player.army.map((u) {
            final def = content.unitById(u.unitDefId);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(def?.name ?? u.unitDefId, style: const TextStyle(color: AppColors.ice)),
              subtitle: Text('x${u.count} · morale ${u.morale.toStringAsFixed(0)}',
                  style: const TextStyle(color: AppColors.mist, fontSize: 12)),
            );
          }),
          const Divider(color: AppColors.glassBorder),
          const Text('Strategic Actions', style: TextStyle(color: AppColors.ice, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ...game.aiCountries.where((c) => c.isAlive).map((enemy) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GlassPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(enemy.name, style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.w700)),
                    Text(
                      'Mil ${enemy.militaryStrength.toStringAsFixed(0)} · Rel ${game.player.relations[enemy.id] ?? 0}',
                      style: const TextStyle(color: AppColors.mist, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: WarAction.values.map((action) {
                        return ActionChip(
                          label: Text(_label(action), style: const TextStyle(fontSize: 11)),
                          backgroundColor: AppColors.slate,
                          onPressed: () => ref
                              .read(gameControllerProvider.notifier)
                              .warAction(enemy.id, action),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          const Text('Active Wars', style: TextStyle(color: AppColors.ice, fontWeight: FontWeight.w600)),
          ...game.wars.where((w) => w.active).map((w) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('${w.attackerId} vs ${w.defenderId}',
                  style: const TextStyle(color: AppColors.danger, fontSize: 13)),
              subtitle: Text(w.log.isEmpty ? '' : w.log.last,
                  style: const TextStyle(color: AppColors.mist, fontSize: 11)),
            );
          }),
        ],
      ),
    );
  }

  String _label(WarAction a) {
    switch (a) {
      case WarAction.attack:
        return 'Attack';
      case WarAction.defend:
        return 'Defend';
      case WarAction.retreat:
        return 'Retreat';
      case WarAction.bomb:
        return 'Bomb';
      case WarAction.drones:
        return 'Drones';
      case WarAction.spy:
        return 'Spy';
      case WarAction.missile:
        return 'Missile';
      case WarAction.navalInvasion:
        return 'Naval';
    }
  }
}
