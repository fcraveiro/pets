import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';

class MyDialog {
  // Future<void> showModal(BuildContext context,
  //     Map<int, List<Services>> groupedServices, Sizer size) async {
  Future<void> showModal(BuildContext context, Sizer size) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Center(
          child: Container(
            width: size.width(84),
            height: size.height(70),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width(4)),
            ),
          ),
        );
      },
    );
  }
}
