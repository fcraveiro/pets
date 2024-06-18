import 'package:flutter/material.dart';

import '../../components/text_styles/text_styles.dart';

appBar(title, [Color? color]) {
  return AppBar(
    title: Text(title, style: GFont().noticeDarkText(17)),
    centerTitle: true,
    iconTheme: const IconThemeData(color: Color(0xFFA2AFDA)),
    backgroundColor: color ?? Colors.blue[300],
  );
}
