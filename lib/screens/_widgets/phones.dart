import 'package:flutter/material.dart';
import '../../components/text_styles/text_styles.dart';

Widget widgetPhones(store) {
  return Text(
    store.phones.join(' - '),
    style: GFont().noticeBlueText(11.5),
  );
}
