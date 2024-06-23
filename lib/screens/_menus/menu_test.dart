import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../_components/custon_button/custon_button.dart';
import '../../not_used/_tests/container.dart';
import '../../not_used/_tests/container2.dart';
import '../../not_used/_tests/container3.dart';
import '../../not_used/_tests/container4.dart';

class MenuTestController extends Controller {
  @override
  onInit() {}

  openContainer() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContainerAPP()),
    );
  }

  openContainer2() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContainerApp2()),
    );
  }

  openContainer3() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContainerApp3()),
    );
  }

  openContainer4() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContainerApp4()),
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
        title: const Text('MenuPet Lojas'),
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
                  text: 'Container Test',
                  onPressed: controller.openContainer,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Container Test 2',
                  onPressed: controller.openContainer2,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Container Test 3',
                  onPressed: controller.openContainer3,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Container Test 4',
                  onPressed: controller.openContainer4,
                  size: size),
              SizedBox(height: size.height(1)),
            ],
          ),
        ),
      ),
    );
  }
}
