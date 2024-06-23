import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'screens/home.dart';
import 'screens/_menus/menu.dart';
import 'screens/_menus/menu_home.dart';
import 'screens/_menus/menu_test.dart';
import 'screens/botton_bar.dart';
import 'screens/service_list.dart';
import 'screens/store_detals.dart';
import 'screens/stores_service.dart';
import 'splash.dart';

class AppRouter {
  final fadeRoutes = ['SplashView', 'HomeScreenView'];
  final routes = {
    //
    // Novas Telas
    //
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
    'StoresServiceView': (context) => StoresServiceView(
        controller: Controller.register(StoresServiceController())),
  };
}
