import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../../domain/types/colors_app.dart';
import '../_widgets/appbar.dart';

class ScaffoldAppController extends Controller {
  Notifier<String> title = Notifier('');

  @override
  onInit() {
    title.listen((p0) => null);
  }

  @override
  onClose() {}
}

class ScaffoldAppView extends ViewOf<ScaffoldAppController> {
  final Widget child;
  ScaffoldAppView({required this.child, required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp().primary,
      appBar: appBar(
        controller.title.value,
        ColorApp().primary,
      ),
      body: child,
    );
  }
}
