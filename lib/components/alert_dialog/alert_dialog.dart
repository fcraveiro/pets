import 'package:flutter/material.dart';
import '../text_styles/text_styles.dart';

extension ContextExt on BuildContext {
  void displayAlertDialog({
    required String title,
    required String content,
    // required String strongText,
    VoidCallback? onPositivePressed,
    String positiveButtonText = 'OK',
    VoidCallback? onNegativePressed,
    String negativeButtonText = 'Cancel',
  }) {
    if (!mounted) return;
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            content,
            style:
                GFont().gFont(16, color: Colors.white, weight: FontWeight.w700),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onNegativePressed ??
                  () {
                    Navigator.of(this).pop();
                  },
              child: Text(negativeButtonText),
            ),
            TextButton(
              onPressed: onPositivePressed ??
                  () {
                    Navigator.of(this).pop();
                    Navigator.of(this).pop();
                  },
              child: Text(positiveButtonText),
            ),
          ],
        );
      },
    );
  }
}
