import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../star_rate/star_rate.dart';
import '../temporary.dart';
import '../text_styles/text_styles.dart';

Widget widgetTopCard(store, Sizer size) {
  return Row(
    children: [
      SizedBox(
          width: size.width(45),
          height: size.height(2.5),
          child: Text(store['bairro'],
              overflow: TextOverflow.ellipsis,
              style: GFont().noticeDarkText())),
      const Spacer(),
      SizedBox(
        width: size.width(20),
        height: size.height(2.5),
        child: starRate(decimalRandom(), size.width(4)),
      ),
      Container(
          height: size.height(2.5),
          padding: EdgeInsets.symmetric(horizontal: size.width(1.5)),
          alignment: Alignment.center,
          child: Text('(${inteiro().toString()})',
              style: GFont().normalDarkText(12))),
    ],
  );
}
