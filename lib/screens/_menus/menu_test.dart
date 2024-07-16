import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../_components/custon_button/custon_button.dart';
import '../maps/distance.dart';
import '../maps/localize.dart';
import '../maps/open_maps.dart';
import '../testes/container_design_1.dart';

class MenuTestController extends Controller {
  @override
  onInit() {}

  openDistance() async {
    Navigator.pushNamed(context, (DistanceView).toString());
  }

  openLocalize() async {
    Navigator.pushNamed(context, (LocalizeView).toString());
  }

  openExternalMaps() async {
    Navigator.pushNamed(context, (ExtenalMapsView).toString());
  }

  openContainer() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ContainerDesign1()),
    );
  }

  @override
  onClose() {}
}

class MenuTestView extends ViewOf<MenuTestController> {
  MenuTestView({super.key, required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Terstes'),
        centerTitle: true,
        backgroundColor: Colors.green.shade600,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height(14)),
              customButton(
                  text: 'Distância',
                  onPressed: controller.openDistance,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Localização',
                  onPressed: controller.openLocalize,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Maps & Waze',
                  onPressed: controller.openExternalMaps,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Container Design 1',
                  onPressed: controller.openContainer,
                  size: size),
              SizedBox(height: size.height(1)),
            ],
          ),
        ),
      ),
    );
  }
}
