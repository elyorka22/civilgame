import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const String _display = 'Georgia';
  static const String _body = 'Helvetica Neue';

  static ThemeData get dark {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.voidBlack,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.gold,
        secondary: AppColors.info,
        surface: AppColors.midnight,
        error: AppColors.danger,
        onPrimary: AppColors.voidBlack,
        onSecondary: AppColors.ice,
        onSurface: AppColors.ice,
        onError: AppColors.ice,
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        displayLarge: const TextStyle(
          fontFamily: _display,
          color: AppColors.gold,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: const TextStyle(
          fontFamily: _display,
          color: AppColors.gold,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: const TextStyle(
          fontFamily: _display,
          color: AppColors.gold,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: const TextStyle(
          fontFamily: _body,
          color: AppColors.mist,
          fontSize: 14,
          height: 1.4,
        ),
        bodySmall: const TextStyle(
          fontFamily: _body,
          color: AppColors.mist,
          fontSize: 12,
        ),
        labelLarge: const TextStyle(
          fontFamily: _body,
          color: AppColors.ice,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
        ),
        titleMedium: const TextStyle(
          fontFamily: _body,
          color: AppColors.ice,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: _display,
          color: AppColors.gold,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerColor: AppColors.glassBorder,
    );
  }
}
