import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../../components/custon_button/custon_button.dart';
import '../tests/container.dart';
import '../tests/container2.dart';
import '../home/home.dart';
import '../home/button_navigation.dart';
import '../tests/container3.dart';
import '../tests/container4.dart';
import '../tests/listview_image.dart';

class MenuTestController extends Controller {
  @override
  onInit() {}

  goHomeView() async {
    Navigator.pushNamed(context, (HomeView).toString());
  }

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

  openListviewImage() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListViewImage()),
    );
  }

  openbottomBar() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenHome()),
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
                  text: 'Home Solo',
                  onPressed: controller.goHomeView,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Page Botton',
                  onPressed: controller.openbottomBar,
                  size: size),
              SizedBox(height: size.height(1)),
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
              customButton(
                  text: 'Listview Image',
                  onPressed: controller.openListviewImage,
                  size: size),
              SizedBox(height: size.height(1)),
            ],
          ),
        ),
      ),
    );
  }
}
