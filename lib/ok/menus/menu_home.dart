import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../../components/custon_button/custon_button.dart';
import '../service_list.dart';
import '../botton_bar.dart';
import '../home.dart';

class MenuHomeController extends Controller {
  @override
  onInit() {}

  openbottomBar() async {
    Navigator.pushNamed(context, (BottonBarView).toString());
  }

  goHomeView() async {
    Navigator.pushNamed(context, (HomeView).toString());
  }

  goServiceList() async {
    Navigator.pushNamed(context, (ServicesListView).toString());
  }

  @override
  onClose() {}
}

class MenuHomeView extends ViewOf<MenuHomeController> {
  MenuHomeView({super.key, required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Stores'),
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
                  text: 'Home BottonBar',
                  onPressed: controller.openbottomBar,
                  size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Home', onPressed: controller.goHomeView, size: size),
              SizedBox(height: size.height(1)),
              customButton(
                  text: 'Serviços',
                  onPressed: controller.goServiceList,
                  size: size),
              SizedBox(height: size.height(1)),
            ],
          ),
        ),
      ),
    );
  }
}
