import 'package:flutter/material.dart';

enum AppColors {
  naplesBlue500(Color(0xFF539DF3), "Naples Blue 500"),
  cornellRed500(Color(0xFFB3001B), "Cornell Red 500"),
  vividSkyBlue500(Color(0xFF44CCFF), "Vivid Sky Blue 500"),
  malachite500(Color(0xFF04E762), "Malachite 500"),
  neutral500(Color(0xFF000500), "Neutral 500"),
  neutral1(Color(0xFFFFFFFF), "Neutral 1"),
  neutral300(Color(0xFF545854), "Neutral 300"),
  neutral6(Color(0xFF8C8C8C), "Neutral 6"),
  neutral7(Color(0xFF595959), "Neutral 7"),
  grey100(Color(0xFFD0D3D9), "Grey 100"),
  red400(Color(0xFFFF3333), "Red 400"),;

  const AppColors(this.color, this.name);
  final Color color;
  final String name;
}
