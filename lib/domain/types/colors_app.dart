import 'package:flutter/material.dart';

// enum ColorsApp {
//   backApp,
//   foreApp,
//   textDark,
//   textLight,
//   border,
//   shadow;

//   bool get isbackApp => this == ColorsApp.backApp;
//   bool get isforeApp => this == ColorsApp.foreApp;
//   bool get isTextDark => this == ColorsApp.textDark;
//   bool get isTextLight => this == ColorsApp.textLight;
//   bool get isBorder => this == ColorsApp.border;
//   bool get isShadow => this == ColorsApp.shadow;

//   get color {
//     switch (this) {
//       case ColorsApp.backApp:
//         return const Color(0xFF2D3A5C);
//       case ColorsApp.foreApp:
//         return Colors.black;
//       case ColorsApp.textDark:
//         return Colors.black;
//       case ColorsApp.textLight:
//         return Colors.black;
//       case ColorsApp.border:
//         return Colors.black;
//       case ColorsApp.shadow:
//         return Colors.black;
//     }
//   }

//   static fromIdColor(int value) {
//     switch (value) {
//       case 1:
//         return Colors.black;
//       case 2:
//         return Colors.black;
//       case 3:
//         return Colors.black;
//       case 4:
//         return Colors.black;
//       case 5:
//         return Colors.black;
//       case 6:
//         return Colors.black;
//     }
//   }

//   static fromIdSubTitle(int value) {
//     switch (value) {
//       case 1:
//         return GFont().normalGreyText(12);
//       case 2:
//         return GFont().normalGreyText(12);
//       case 3:
//         return GFont().normalGreyText(12);
//       case 4:
//         return GFont().normalGreyText(12);
//       case 5:
//         return GFont().normalGreyText(12);
//       case 6:
//         return GFont().normalWhiteText(12);
//     }
//   }
// }

abstract class ColorsApp {
  Color get primary;
  Color get secondary;
  Color get bottomBar;
  Color get starRate;
  Color get border200;
  Color get border400;
  Color get border500;
  Color get border600;
  Color get border700;
  Color get border800;
  Color get grey500;
  Color get grey600;
  Color get grey700;

  Color get pageBackground;
  Color get containerBackground;
  Color get textPrimary;
  Color get textSecondary;
  Color get iconBackground;

  Color get degradeServices;
  Color get degradeIcon;
  Color get degradeButton;

  Color get fundo01;
  Color get fundo02;
  Color get fundo03;
  Color get fundo04;
  Color get fundo05;
  Color get fundo06;

// pagina : Color(0xFF0F0F0F),
// container : Color(0xFF222222),
// texto forte : Color(0xFFFFFFFF)
// texto fraco : Color(0xFFB8B9B8)
// icon : Color(0xFF27C197)
}

// #263A47 #4A5B6A #728495 #98A9BE #B4C5DB

class ColorApp extends ColorsApp {
  @override
  Color get primary => const Color(0xFF263A47);

  @override
  Color get secondary => const Color(0xFF253745);

  @override
  Color get bottomBar => const Color(0xFF1F2023);

  @override
  Color get starRate => const Color(0xFFF97E29);

  @override
  Color get border200 => const Color(0xFF98A9BE);

  @override
  Color get border400 => const Color(0xFF4A5C6A);

  @override
  Color get border500 => const Color(0xFF4A5C6A);

  @override
  Color get border600 => const Color(0xFF4A5C6A);

  @override
  Color get border700 => const Color(0xFF4A5C6A);

  @override
  Color get border800 => const Color(0xFF4A5B6A);

  @override
  Color get grey500 => const Color(0xFF4A5B6A);

  @override
  Color get grey600 => const Color(0xFF4A5B6A);

  @override
  Color get grey700 => const Color(0xFF4A5B6A);

  //
  // Novas Cores
  //

  @override
  Color get pageBackground => const Color(0xFF0F0F0F);

  @override
  Color get containerBackground => const Color(0xFF222222);

  @override
  Color get textPrimary => const Color(0xFFFFFFFF);

  @override
  Color get textSecondary => const Color(0xFFB8B9B8);

  @override
  Color get iconBackground => const Color(0xFFB8B9B8);

// pagina : Color(0xFF0F0F0F),
// container : Color(0xFF222222),
// texto forte : Color(0xFFFFFFFF)
// texto fraco : Color(0xFFB8B9B8)
// icon : Color(0xFF27C197)

  //
  // Cores DA Home
  //

  @override
  Color get degradeServices => const Color(0xFF27C499);

  @override
  Color get degradeIcon => const Color(0xFFFFFFFF);

  @override
  Color get degradeButton => const Color(0xFF27C499);

  @override
  Color get fundo01 => const Color(0xFF05141B);

  @override
  Color get fundo02 => const Color(0xFF11212D);

  @override
  Color get fundo03 => const Color(0xFF253745);

  @override
  Color get fundo04 => const Color(0xFF4A5C6A);

  @override
  Color get fundo05 => const Color(0xFFCCD0CF);

  @override
  Color get fundo06 => const Color(0xFF00C4CC);
}



// class ColorApp extends ColorsApp {
//   @override
//   Color get primary => const Color(0xFF322c2b);

//   @override
//   Color get secondary => const Color(0xFFA7450C);

//   @override
//   Color get bottomBar => const Color(0xFF1F2023);

//   @override
//   Color get starRate => const Color(0xFFF97E29);

//   @override
//   Color get border200 => const Color(0xFFFABF8F);

//   @override
//   Color get border400 => const Color(0xFFF68D3C);

//   @override
//   Color get border500 => const Color(0xFFF07828);

//   @override
//   Color get border600 => const Color(0xFFD15D10);

//   @override
//   Color get border700 => const Color(0xFFA7450C);

//   @override
//   Color get border800 => const Color(0xFF78320A);

//   @override
//   Color get grey500 => const Color(0xFF52525B);

//   @override
//   Color get grey600 => const Color(0xFF3F3F46);

//   @override
//   Color get grey700 => const Color(0xFF27272A);
// }
