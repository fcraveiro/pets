import 'package:flutter/material.dart';

starRate(double numero, double sizeStar) {
  List<Widget> stars = [];
  int numeroInteiro = numero.floor();
  double decimalPart = numero - numeroInteiro;
  if (decimalPart > 0.5) {
    numeroInteiro += 1;
  }
  for (int i = 0; i < 5; i++) {
    if (i < numeroInteiro) {
      stars.add(Icon(Icons.star, color: Colors.amber, size: sizeStar));
    } else if (i == numeroInteiro && decimalPart == 0.5) {
      stars.add(Icon(Icons.star_half, color: Colors.amber, size: sizeStar));
    } else {
      stars.add(Icon(Icons.star_border,
          color: const Color(0xFFCCCCCC), size: sizeStar));
    }
  }
  return Row(children: stars);
}
