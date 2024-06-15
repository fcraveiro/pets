import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'screens/menu/menu.dart';
import 'screens/src/test2.dart';
import 'splash.dart';
import 'screens/src/test1.dart';

class AppRouter {
  final fadeRoutes = ['SplashView', 'HomeScreenView'];
  final routes = {
    'SplashView': (context) =>
        SplashView(controller: Controller.register(SplashController())),
    'MenuPetView': (context) =>
        MenuPetView(controller: Controller.register(MenuPetController())),
    'Test1View': (context) =>
        Test1View(controller: Controller.register(Test1Controller())),
    'Test2View': (context) =>
        Test2View(controller: Controller.register(Test2Controller())),
  };
}
