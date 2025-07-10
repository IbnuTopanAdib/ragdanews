import 'package:flutter/material.dart';

enum AppColors {
  naplesBlue500(Color(0xFF539DF3), "Naples Blue 500"),
  cornellRed500(Color(0xFFB3001B), "Cornell Red 500"),
  vividSkyBlue500(Color(0xFF44CCFF), "Vivid Sky Blue 500"),
  malachite500(Color(0xFF04E762), "Malachite 500"),
  neutral500(Color(0xFF000500), "Neutral 500");

  const AppColors(this.color, this.name);
  final Color color;
  final String name;
}
