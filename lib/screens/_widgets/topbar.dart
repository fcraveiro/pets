import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../../components/star_rate/star_rate.dart';
import '../../components/temporary.dart';
import '../../components/text_styles/text_styles.dart';

Widget widgetTopCard(store, Sizer size) {
  return Row(
    children: [
      SizedBox(
          width: size.width(35),
          height: size.height(2.5),
          child: Text(store['bairro'],
              overflow: TextOverflow.ellipsis,
              style: GFont().noticeBlueText())),
      Container(
        width: size.width(16),
        height: size.height(2.5),
        alignment: Alignment.center,
        child: const Text('3.4 Km'),
      ),
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
              style: GFont().noticeBlueText(12))),
    ],
  );
}
