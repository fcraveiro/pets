import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../../components/text_styles/text_styles.dart';
import '../../domain/types/colors_app.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp().fundo02,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Altura padrão do AppBar
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorApp().fundo04, Colors.black],
                end: Alignment.bottomRight, // Fim do gradiente
                begin: Alignment.topRight, // Início do gradiente
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            controller.title.value,
            style: GFont().noticeWhiteText(16),
          ),
          backgroundColor:
              Colors.transparent, // Transparente para mostrar o gradiente
          elevation: 4, // Remove a sombra do AppBar
        ),
      ),
      body: Center(
        child: child,
      ),
    );
  }
}
