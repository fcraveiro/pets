import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../../domain/types/_priority.dart';
import '../text_styles/text_styles.dart';

Widget buildChip(label, priority, Sizer size) {
  return Container(
    height: size.height(2.7), // 24,
    margin: EdgeInsets.only(right: size.width(2), top: size.height(.8)),
    padding: EdgeInsets.symmetric(
        horizontal: size.width(1.5), vertical: size.height(.3)),
    decoration: BoxDecoration(
      color: PriorityType.fromIdColor(priority),
      borderRadius: BorderRadius.circular(size.width(1.5)),
      // border: Border.all(color: Colors.grey[400]!, width: 1)
    ),
    child: Text(label, style: GFont().normalBlackText(size.width(3.2))),
  );
}
