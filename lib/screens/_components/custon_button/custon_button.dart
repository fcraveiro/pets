import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../text_styles/text_styles.dart';

/// A custom button with rounded corners, elevation, and a colored border.
///
/// [text] is the displayed text.
/// [onPressed] is the function called when the button is pressed.
/// [size] is the [Sizer] instance used for responsive design.
///

Widget customButton({
  required String text,
  required VoidCallback onPressed,
  required Sizer size,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: size.height(1)),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 4,
        side: const BorderSide(color: Colors.black, width: 1),
        fixedSize: Size(size.width(80), size.height(5)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            GFont().gFont(15, color: Colors.blue[900], weight: FontWeight.w600),
      ),
    ),
  );
}
