import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../providers/game_provider.dart';
import '../widgets/glass_panel.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _rise;
  final _nameController = TextEditingController(text: 'Aurora');
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _rise = Tween<double>(begin: 24, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
    Future.microtask(() async {
      await ref.read(gameControllerProvider.notifier).bootstrap();
      if (mounted) setState(() => _ready = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameAsync = ref.watch(gameControllerProvider);
    final hasSave = gameAsync.valueOrNull != null;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A1630),
              AppColors.voidBlack,
              Color(0xFF101820),
            ],
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Opacity(
                opacity: _fade.value,
                child: Transform.translate(
                  offset: Offset(0, _rise.value),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          'RISE OF\nCIVILIZATION',
                          textAlign: TextAlign.center,
                          softWrap: false,
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            color: AppColors.gold,
                            fontSize: 36,
                            height: 1.05,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Guide a tribe through millennia.\nEvery decision shapes the ages.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.mist,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const Spacer(),
                        GlassPanel(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Civilization Name',
                                style: TextStyle(
                                  color: AppColors.gold,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _nameController,
                                style: const TextStyle(color: AppColors.ice),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      AppColors.voidBlack.withOpacity(0.45),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: AppColors.glassBorder,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: AppColors.glassBorder
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GoldButton(
                                label: 'NEW CAMPAIGN',
                                onPressed: !_ready
                                    ? null
                                    : () async {
                                        await ref
                                            .read(
                                                gameControllerProvider.notifier)
                                            .newGame(_nameController.text);
                                        if (context.mounted) {
                                          context.go('/home');
                                        }
                                      },
                              ),
                              if (hasSave) ...[
                                const SizedBox(height: 10),
                                OutlinedButton(
                                  onPressed: !_ready
                                      ? null
                                      : () async {
                                          await ref
                                              .read(gameControllerProvider
                                                  .notifier)
                                              .continueGame();
                                          if (context.mounted) {
                                            context.go('/home');
                                          }
                                        },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.ice,
                                    side: const BorderSide(
                                        color: AppColors.goldDim),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                  ),
                                  child: const Text('CONTINUE'),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
