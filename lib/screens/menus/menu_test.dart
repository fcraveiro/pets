import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../../components/custon_button/custon_button.dart';
import '../home/home.dart';
import '../tests/test3.dart';
import '../tests/test1.dart';
import '../tests/test2.dart';

class MenuTestController extends Controller {
  @override
  onInit() {}
  goTeste() async {
    Navigator.pushNamed(context, (Test1View).toString());
  }

  goTeste2() async {
    Navigator.pushNamed(context, (Test2View).toString());
  }

  goTeste3() async {
    Navigator.pushNamed(context, (Test3View).toString());
  }

  goHome() async {
    Navigator.pushNamed(context, (HomeScreenView).toString());
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
                  text: 'Teste 1', onPressed: controller.goTeste, size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Teste 2', onPressed: controller.goTeste2, size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Test 3', onPressed: controller.goTeste3, size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Home', onPressed: controller.goHome, size: size),
              SizedBox(height: size.height(1)),
            ],
          ),
        ),
      ),
    );
  }
}
