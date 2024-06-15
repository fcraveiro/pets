import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../src/test1.dart';
import '../../components/custon_button/custon_button.dart';
import 'package:flutter/material.dart';

import '../src/test2.dart';

class MenuPetController extends Controller {
  @override
  onInit() {}

  goTeste() async {
    Navigator.pushNamed(context, (Test1View).toString());
  }

  goTeste2() async {
    Navigator.pushNamed(context, (Test2View).toString());
  }

  // openRoute() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => DistancePage()),
  //   );
  // }
  @override
  onClose() {}
}

class MenuPetView extends ViewOf<MenuPetController> {
  MenuPetView({super.key, required super.controller, super.size});

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
              SizedBox(height: size.height(8)),
              customButton(
                  text: 'Teste', onPressed: controller.goTeste, size: size),
              customButton(
                  text: 'Teste 2', onPressed: controller.goTeste2, size: size),
            ],
          ),
        ),
      ),
    );
  }
}
