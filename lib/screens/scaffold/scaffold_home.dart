import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../../domain/types/colors_app.dart';

class ScaffoldHomeController extends Controller {
  Notifier<String> title = Notifier('');

  @override
  onInit() {
    title.listen((p0) => null);
  }

  @override
  onClose() {}
}

class ScaffoldHomeView extends ViewOf<ScaffoldHomeController> {
  final Widget child;
  ScaffoldHomeView(
      {required this.child, required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp().primary,
        body: child,
      ),
    );
  }
}
