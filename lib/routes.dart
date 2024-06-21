import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'screens/home/home.dart';
import 'screens/menus/menu.dart';
import 'screens/menus/menu_services.dart';
import 'screens/menus/menu_stores.dart';
import 'screens/menus/menu_test.dart';
import 'screens/service_list.dart';
import 'screens/store_detals.dart';
import 'screens/stores_service.dart';
import 'splash.dart';

class AppRouter {
  final fadeRoutes = ['SplashView', 'HomeScreenView'];
  final routes = {
    'SplashView': (context) =>
        SplashView(controller: Controller.register(SplashController())),
    'MenuPetView': (context) =>
        MenuPetView(controller: Controller.register(MenuPetController())),
    'MenuStoresView': (context) =>
        MenuStoresView(controller: Controller.register(MenuStoresController())),
    'MenuServicesView': (context) => MenuServicesView(
        controller: Controller.register(MenuServicesController())),
    'MenuTestView': (context) =>
        MenuTestView(controller: Controller.register(MenuTestController())),
    //
    // Novas Telas
    //
    'ServicesListView': (context) => ServicesListView(
        controller: Controller.register(ServicesListController())),
    'StoresServiceView': (context) => StoresServiceView(
        controller: Controller.register(StoresServiceController())),
    'StoreDetalsView': (context) => StoreDetalsView(
        controller: Controller.register(StoreDetalsController())),
    'HomeView': (context) =>
        HomeView(controller: Controller.register(HomeController())),
  };
}
