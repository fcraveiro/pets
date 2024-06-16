import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';

Widget widgetServices(store, Sizer size) {
  return Wrap(
    children: [
      ...store.services.map((activity) => Container(
          height: size.height(2.5),
          margin: EdgeInsets.only(right: size.width(2)),
          padding: EdgeInsets.symmetric(horizontal: size.width(2)),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(activity))),
    ],
  );
}
