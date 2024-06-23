import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'ok/home.dart';
import 'ok/menus/menu.dart';
import 'ok/menus/menu_home.dart';
import 'ok/menus/menu_test.dart';
import 'ok/botton_bar.dart';
import 'ok/service_list.dart';
import 'screens/src/store_detals.dart';
import 'screens/src/stores_service.dart';
import 'splash.dart';

class AppRouter {
  final fadeRoutes = ['SplashView', 'HomeScreenView'];
  final routes = {
    //
    // Novas Telas
    //
    'StoresServiceView': (context) => StoresServiceView(
        controller: Controller.register(StoresServiceController())),
    'StoreDetalsView': (context) => StoreDetalsView(
        controller: Controller.register(StoreDetalsController())),
    //
    // Novas Rotas
    //

    'SplashView': (context) =>
        SplashView(controller: Controller.register(SplashController())),
    'MenuPetView': (context) =>
        MenuPetView(controller: Controller.register(MenuPetController())),
    'MenuTestView': (context) =>
        MenuTestView(controller: Controller.register(MenuTestController())),
    'MenuHomeView': (context) =>
        MenuHomeView(controller: Controller.register(MenuHomeController())),
    'BottonBarView': (context) =>
        BottonBarView(controller: Controller.register(BottonBarController())),
    'HomeView': (context) =>
        HomeView(controller: Controller.register(HomeController())),
    'ServicesListView': (context) => ServicesListView(
        controller: Controller.register(ServicesListController())),
  };
}
