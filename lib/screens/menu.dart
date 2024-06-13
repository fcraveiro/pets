import 'package:flutter_view_controller/flutter_view_controller.dart';
import '_components/custon_button/custon_button.dart';
import 'package:flutter/material.dart';

class MenuPetController extends Controller {
  @override
  onInit() {}

  // searchServices() async {
  //   Navigator.pushNamed(context, (ServicesListView).toString());
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
              SizedBox(height: size.height(8)),
              customButton(text: 'Lojas', onPressed: () {}, size: size),
            ],
          ),
        ),
      ),
    );
  }
}
