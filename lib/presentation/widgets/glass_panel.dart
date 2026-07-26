import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.borderRadius = 18,
    this.onTap,
  });

  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.slate.withOpacity(0.55),
                AppColors.deepNavy.withOpacity(0.72),
              ],
            ),
            border: Border.all(color: AppColors.glassBorder, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );

    if (onTap == null) return content;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: content,
      ),
    );
  }
}

class GoldButton extends StatelessWidget {
  const GoldButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: onPressed == null
              ? [AppColors.slate, AppColors.midnight]
              : const [AppColors.gold, AppColors.goldSoft],
        ),
        boxShadow: onPressed == null
            ? null
            : [
                BoxShadow(
                  color: AppColors.gold.withOpacity(0.28),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 14 : 20,
              vertical: compact ? 10 : 14,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: onPressed == null
                    ? AppColors.mist
                    : AppColors.voidBlack,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                fontSize: compact ? 12 : 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
