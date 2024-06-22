import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/types/colors_app.dart';

// openSans
// inter
// lato
// poppins
// montserrat
// raleway

class GFont {
  ///  [noticeBlueText] bold blue.
  ///  [noticeBlackText] bold black.

  TextStyle gFont(
    double fontSize, {
    FontWeight? weight,
    Color? color,
    double? height,
    TextDecoration? decoration,
    FontStyle? style,
    double? letterSpacing,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize * 1.2,
      fontWeight: weight ?? FontWeight.w400,
      decoration: decoration,
      height: height ?? 1.0,
      fontStyle: style ?? FontStyle.normal,
      letterSpacing: letterSpacing ?? 0,
      color: color ?? Colors.white.withOpacity(.7),
    );
  }

  TextStyle noticeBlueText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w700, color: color ?? Colors.blue);
  }

  TextStyle noticeBlackText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w700, color: color ?? Colors.black);
  }

  TextStyle noticeGreyText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w700, color: color ?? Colors.grey);
  }

  TextStyle noticeWhiteText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w700, color: color ?? Colors.white);
  }

  TextStyle normalBlueText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w500, color: color ?? Colors.blue);
  }

  TextStyle normalBlackText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w500, color: color ?? Colors.black);
  }

  TextStyle normalGreyText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w500, color: color ?? Colors.grey.shade700);
  }

  TextStyle normalWhiteText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w500, color: color ?? Colors.white);
  }

  TextStyle normalDarkText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w500, color: color ?? const Color(0xFFEEF7FF));
  }

  TextStyle noticeDarkText([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w700, color: color ?? const Color(0xFFEEF7FF));
  }

  TextStyle noticePrimary([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w700, color: color ?? ColorApp().textPrimary);
  }

  TextStyle normalPrimary([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w500, color: color ?? ColorApp().textPrimary);
  }

  TextStyle noticeSecondary([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w700, color: color ?? ColorApp().textSecondary);
  }

  TextStyle normalSecondary([double fontSize = 14, Color? color]) {
    return gFont(fontSize,
        weight: FontWeight.w500, color: color ?? ColorApp().textSecondary);
  }
}
