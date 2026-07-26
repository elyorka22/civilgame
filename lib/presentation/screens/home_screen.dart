import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';
import '../widgets/resource_bar.dart';
import '../widgets/world_map_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameAsync = ref.watch(gameControllerProvider);
    final contentAsync = ref.watch(contentProvider);

    return gameAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.gold)),
      ),
      error: (e, _) => Scaffold(body: Center(child: Text('$e'))),
      data: (game) {
        if (game == null) {
          return Scaffold(
            body: Center(
              child: GoldButton(
                label: 'Start',
                onPressed: () => context.go('/'),
              ),
            ),
          );
        }

        final content = contentAsync.valueOrNull;
        final eraName = content?.eraById(game.player.eraId).name ?? game.player.eraId;
        final govName =
            content?.governmentById(game.player.governmentId).name ??
                game.player.governmentId;

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0A1224),
                  AppColors.voidBlack,
                  Color(0xFF121A28),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            game.civilizationName,
                            style: const TextStyle(
                              fontFamily: 'Georgia',
                              color: AppColors.gold,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          '${_dateLabel(game.year, game.month)} · T${game.turn}',
                          style: const TextStyle(
                            color: AppColors.mist,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: ResourceBar(state: game),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: StatusMeters(
                      player: game.player,
                      eraName: eraName,
                      govName: govName,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GlassPanel(
                        padding: EdgeInsets.zero,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: WorldMapView(tiles: game.tiles),
                              ),
                              Positioned(
                                left: 12,
                                right: 12,
                                bottom: 12,
                                child: GlassPanel(
                                  padding: const EdgeInsets.all(10),
                                  borderRadius: 14,
                                  child: Text(
                                    game.log.isEmpty
                                        ? 'The world awaits your command.'
                                        : game.log.last.message,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: AppColors.ice,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              if (game.activeEvents.isNotEmpty)
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: GoldButton(
                                    compact: true,
                                    label: 'EVENT',
                                    onPressed: () => context.push('/events'),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        _nav(context, 'World', '/world', Icons.public),
                        _nav(context, 'Government', '/government', Icons.account_balance),
                        _nav(context, 'Military', '/military', Icons.shield),
                        _nav(context, 'Economy', '/economy', Icons.insights),
                        _nav(context, 'Technology', '/technology', Icons.memory),
                        _nav(context, 'Diplomacy', '/diplomacy', Icons.handshake),
                        _nav(context, 'Cities', '/cities', Icons.location_city),
                        _nav(context, 'Laws', '/laws', Icons.gavel),
                        _nav(context, 'Events', '/events', Icons.auto_awesome),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: GoldButton(
                            label: game.activeEvents.isNotEmpty
                                ? 'RESOLVE EVENTS FIRST'
                                : 'END TURN (+1 MONTH)',
                            onPressed: game.activeEvents.isNotEmpty
                                ? () => context.push('/events')
                                : () => ref
                                    .read(gameControllerProvider.notifier)
                                    .endTurn(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _dateLabel(int year, int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final era = year < 0 ? 'BCE' : 'CE';
    final y = year.abs();
    return '${months[month - 1]} $y $era';
  }

  Widget _nav(BuildContext context, String label, String path, IconData icon) {
    return InkWell(
      onTap: () => context.push(path),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.midnight.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.glassBorder.withOpacity(0.45)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.gold, size: 18),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: AppColors.mist, fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }
}
