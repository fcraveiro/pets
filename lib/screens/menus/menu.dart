import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../../components/custon_button/custon_button.dart';
import 'package:flutter/material.dart';

import 'menu_services.dart';
import 'menu_stores.dart';
import 'menu_test.dart';

class MenuPetController extends Controller {
  @override
  onInit() {}

  goMenuStores() async {
    Navigator.pushNamed(context, (MenuStoresView).toString());
  }

  goMenuServices() async {
    Navigator.pushNamed(context, (MenuServicesView).toString());
  }

  goMenuTest() async {
    Navigator.pushNamed(context, (MenuTestView).toString());
  }

  // goTeste2() async {
  //   Navigator.pushNamed(context, (Test2View).toString());
  // }

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
              SizedBox(height: size.height(14)),
              customButton(
                  text: 'Stores',
                  onPressed: controller.goMenuStores,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Services',
                  onPressed: controller.goMenuServices,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Testes', onPressed: controller.goMenuTest, size: size),
            ],
          ),
        ),
      ),
    );
  }
}
