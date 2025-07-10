import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.naplesBlue500.color,
        onPrimary: Colors.white,
        secondary: AppColors.cornellRed500.color,
        onSecondary: Colors.white,
        surface: AppColors.neutral500.color,
        onSurface: Colors.black87,
        error: Colors.red,
        onError: Colors.white,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      cardTheme: _cardTheme(),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: AppTextStyles.headline1Bold,
      headlineMedium: AppTextStyles.headline2Bold,
      headlineSmall: AppTextStyles.headline3Bold,
      titleLarge: AppTextStyles.headline4Bold,
      titleMedium: AppTextStyles.headline5Bold,
      titleSmall: AppTextStyles.headline6Bold,
      bodyLarge: AppTextStyles.headline7Regular,
      bodyMedium: AppTextStyles.headline8Regular,
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.naplesBlue500.color,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: AppTextStyles.headline3Bold.copyWith(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.naplesBlue500.color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.headline5Bold.copyWith(color: Colors.white),
      ),
    );
  }

  static CardThemeData _cardTheme() {
    return CardThemeData(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black26,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
