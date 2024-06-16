import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'screens/menus/menu.dart';

class SplashController extends Controller {
  @override
  onInit() {
    tempo();
  }

  tempo() async {
    await Future.delayed(const Duration(seconds: 5));
    // chamaEmpresaListPage();
    // mainmenu();
    mainmenu();
  }

  mainmenu() async {
    Navigator.pushReplacementNamed(context, (MenuPetView).toString());
  }

  // chamaEmpresaListPage() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => CategorySearchByStoreScreen()),
  //   );
  // }

  @override
  onClose() {}
}

class SplashView extends ViewOf<SplashController> {
  SplashView({super.key, required super.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: size.width(100),
              height: size.height(100),
              color: Colors.blue,
              child: Image.asset(
                'assets/splash/capa.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
                width: size.width(17),
                height: size.height(17),
                margin: EdgeInsets.only(
                    top: size.height(24.5), left: size.width(40)),
                child: Lottie.asset('assets/json/loader.json', reverse: true)),
            Container(
                width: size.width(100),
                height: size.height(5),
                alignment: Alignment.center,
                // color: Colors.blue,
                margin: EdgeInsets.only(top: size.height(36)),
                child: Text('Aguarde Carregando...',
                    style: TextStyle(
                        fontSize: size.width(5),
                        color: const Color(0xFF3E6F8D)))),
          ],
        ),
      ),
    );
  }
}
