import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle _withFont({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    required double letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height / fontSize, // Convert pt line-height to Flutter height multiplier
      letterSpacing: letterSpacing,
    );
  }

  // Headline 1 - 32px
  static TextStyle headline1Bold = _withFont(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40,
    letterSpacing: -0.02 * 32,
  );

  static TextStyle headline1SemiBold = _withFont(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 40,
    letterSpacing: -0.02 * 32,
  );

  static TextStyle headline1Regular = _withFont(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 40,
    letterSpacing: -0.02 * 32,
  );

  // Headline 2 - 28px
  static TextStyle headline2Bold = _withFont(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 36,
    letterSpacing: -0.02 * 28,
  );

  static TextStyle headline2SemiBold = _withFont(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 36,
    letterSpacing: -0.02 * 28,
  );

  static TextStyle headline2Regular = _withFont(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 36,
    letterSpacing: -0.02 * 28,
  );

  // Headline 3 - 24px
  static TextStyle headline3Bold = _withFont(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32,
    letterSpacing: -0.02 * 24,
  );

  static TextStyle headline3SemiBold = _withFont(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32,
    letterSpacing: -0.02 * 24,
  );

  static TextStyle headline3Regular = _withFont(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 32,
    letterSpacing: -0.02 * 24,
  );

  // Headline 4 - 20px
  static TextStyle headline4Bold = _withFont(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 28,
    letterSpacing: -0.01 * 20,
  );

  static TextStyle headline4SemiBold = _withFont(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28,
    letterSpacing: -0.01 * 20,
  );

  static TextStyle headline4Regular = _withFont(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 28,
    letterSpacing: -0.01 * 20,
  );

  // Headline 5 - 18px
  static TextStyle headline5Bold = _withFont(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 26,
    letterSpacing: -0.01 * 18,
  );

  static TextStyle headline5SemiBold = _withFont(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 26,
    letterSpacing: -0.01 * 18,
  );

  static TextStyle headline5Regular = _withFont(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 26,
    letterSpacing: -0.01 * 18,
  );

  // Headline 6 - 16px
  static TextStyle headline6Bold = _withFont(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 24,
    letterSpacing: -0.01 * 16,
  );

  static TextStyle headline6SemiBold = _withFont(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24,
    letterSpacing: -0.01 * 16,
  );

  static TextStyle headline6Regular = _withFont(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24,
    letterSpacing: -0.01 * 16,
  );

  // Headline 7 - 14px
  static TextStyle headline7Bold = _withFont(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 20,
    letterSpacing: -0.01 * 14,
  );

  static TextStyle headline7SemiBold = _withFont(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20,
    letterSpacing: -0.01 * 14,
  );

  static TextStyle headline7Regular = _withFont(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20,
    letterSpacing: -0.01 * 14,
  );

  // Headline 8 - 12px
  static TextStyle headline8Bold = _withFont(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 16,
    letterSpacing: 0,
  );

  static TextStyle headline8SemiBold = _withFont(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16,
    letterSpacing: 0,
  );

  static TextStyle headline8Regular = _withFont(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16,
    letterSpacing: 0,
  );
}
