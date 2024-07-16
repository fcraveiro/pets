import 'package:flutter/material.dart';

abstract class ColorsApp {
  // Color get primary;
  // Color get secondary;

  Color get bottomBar;
  Color get starRate;

  Color get textPrimary;
  Color get textSecondary;

  Color get fundo01;
  Color get fundo02;
  Color get fundo03;

  Color get fundo001;
  Color get fundo002;
  Color get fundo003;

  Color get borderActive;
  Color get borderInactive;

  Color get colorWhite;
}

class ColorApp extends ColorsApp {
  // @override
  // Color get primary => const Color(0xFF263A47);

  // @override
  // Color get secondary => const Color(0xFF253745);

  @override
  Color get bottomBar => const Color(0xFF1F2023);

  @override
  Color get starRate => const Color(0xFFF97E29);

  //
  // Novas Cores
  //

  @override
  Color get textPrimary => const Color(0xFFFFFFFF);

  @override
  Color get textSecondary => const Color(0xFFB8B9B8);

  @override
  Color get fundo01 => const Color(0xFF98BFF4);

  @override
  Color get fundo02 => const Color(0xFF27C499);

  @override
  Color get fundo03 => const Color(0xFF253745);

  @override
  Color get fundo001 => const Color(0xFF000000);
  @override
  Color get fundo002 => const Color(0xFF222423);
  @override
  Color get fundo003 => const Color(0xFF27C499);

  @override
  Color get borderActive => const Color(0xFF27C499);

  @override
  Color get borderInactive => const Color(0xFF222423);

  @override
  Color get colorWhite => const Color(0xFFFFFFFF);
}
