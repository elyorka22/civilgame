import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/entities/game_models.dart';

class ResourceBar extends StatelessWidget {
  const ResourceBar({super.key, required this.state});

  final GameState state;

  @override
  Widget build(BuildContext context) {
    final r = state.player.resources;
    final pop =
        state.player.cities.fold<double>(0, (s, c) => s + c.population);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _chip(Icons.restaurant, 'Food', r.food),
          _chip(Icons.park, 'Wood', r.wood),
          _chip(Icons.landscape, 'Stone', r.stone),
          _chip(Icons.hardware, 'Iron', r.iron),
          _chip(Icons.local_fire_department, 'Coal', r.coal),
          _chip(Icons.oil_barrel, 'Oil', r.oil),
          _chip(Icons.bolt, 'Power', r.electricity),
          _chip(Icons.monetization_on, 'Gold', r.gold),
          _chip(Icons.account_balance_wallet, 'Money', r.money),
          _chip(Icons.biotech, 'Science', r.science),
          _chip(Icons.groups, 'Pop', pop),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String label, double value) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.midnight.withOpacity(0.85),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.glassBorder.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.gold),
          const SizedBox(width: 6),
          Text(
            '${value.toStringAsFixed(0)}',
            style: const TextStyle(
              color: AppColors.ice,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(color: AppColors.mist, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class StatusMeters extends StatelessWidget {
  const StatusMeters({super.key, required this.player, required this.eraName, required this.govName});

  final Country player;
  final String eraName;
  final String govName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _meter('Era', eraName, AppColors.gold)),
            const SizedBox(width: 8),
            Expanded(child: _meter('Gov', govName, AppColors.info)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _bar('Economy', player.economy.gdp / 500, AppColors.success)),
            const SizedBox(width: 6),
            Expanded(child: _bar('Military', player.militaryStrength / 200, AppColors.danger)),
            const SizedBox(width: 6),
            Expanded(child: _bar('Science', player.resources.science / 100, AppColors.info)),
            const SizedBox(width: 6),
            Expanded(child: _bar('Happy', player.happiness / 100, AppColors.warning)),
          ],
        ),
      ],
    );
  }

  Widget _meter(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.deepNavy.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: AppColors.mist, fontSize: 10)),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _bar(String label, double t, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.mist, fontSize: 9)),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: t.clamp(0, 1),
            minHeight: 6,
            backgroundColor: AppColors.slate,
            color: color,
          ),
        ),
      ],
    );
  }
}
