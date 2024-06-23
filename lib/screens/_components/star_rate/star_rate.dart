import 'package:flutter/material.dart';

import '../../../domain/types/colors_app.dart';

starRate(double numero, double sizeStar) {
  List<Widget> stars = [];
  int numeroInteiro = numero.floor();
  double decimalPart = numero - numeroInteiro;
  if (decimalPart > 0.5) {
    numeroInteiro += 1;
  }
  for (int i = 0; i < 5; i++) {
    if (i < numeroInteiro) {
      stars.add(Icon(Icons.star, color: ColorApp().starRate, size: sizeStar));
    } else if (i == numeroInteiro && decimalPart == 0.5) {
      stars.add(
          Icon(Icons.star_half, color: ColorApp().starRate, size: sizeStar));
    } else {
      stars.add(Icon(Icons.star_border, color: Colors.black, size: sizeStar));
    }
  }
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
}
