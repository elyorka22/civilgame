import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class EconomyScreen extends ConsumerWidget {
  const EconomyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameControllerProvider).valueOrNull;
    if (game == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final e = game.player.economy;

    return Scaffold(
      appBar: AppBar(title: const Text('Economy')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GlassPanel(
            child: Column(
              children: [
                _row('GDP', e.gdp.toStringAsFixed(0)),
                _row('Inflation', '${e.inflation.toStringAsFixed(1)}%'),
                _row('Unemployment', '${e.unemployment.toStringAsFixed(1)}%'),
                _row('Imports', e.imports.toStringAsFixed(0)),
                _row('Exports', e.exports.toStringAsFixed(0)),
                _row('National Debt', e.nationalDebt.toStringAsFixed(0)),
                _row('Tax Rate', '${e.taxRate.toStringAsFixed(0)}%'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Tax Policy', style: TextStyle(color: AppColors.ice)),
          Slider(
            value: e.taxRate,
            min: 0,
            max: 40,
            divisions: 40,
            activeColor: AppColors.gold,
            label: '${e.taxRate.toStringAsFixed(0)}%',
            onChanged: (v) =>
                ref.read(gameControllerProvider.notifier).setTaxRate(v),
          ),
          const Text(
            'Higher taxes raise revenue but can increase unemployment and unrest over time.',
            style: TextStyle(color: AppColors.mist, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _row(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(k, style: const TextStyle(color: AppColors.mist))),
          Text(v, style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
