import 'package:flutter/material.dart';
import '../text_styles/text_styles.dart';

Widget widgetPhones(store) {
  return Text(
    store['phones'].join(' - '),
    style: GFont().noticeDarkText(11.5),
  );
}
