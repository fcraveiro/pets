import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'screens/home/home.dart';
import 'screens/tests/test3.dart';
import 'screens/menus/menu.dart';
import 'screens/menus/menu_services.dart';
import 'screens/menus/menu_stores.dart';
import 'screens/menus/menu_test.dart';
import 'screens/service_list.dart';
import 'screens/store_detals.dart';
import 'screens/stores_service.dart';
import 'screens/tests/test2.dart';
import 'splash.dart';
import 'screens/tests/test1.dart';

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
    'Test1View': (context) =>
        Test1View(controller: Controller.register(Test1Controller())),
    'Test2View': (context) =>
        Test2View(controller: Controller.register(Test2Controller())),
    //
    // Novas Telas
    //
    'HomeScreenView': (context) =>
        HomeScreenView(controller: Controller.register(HomeScreenController())),
    'ServicesListView': (context) => ServicesListView(
        controller: Controller.register(ServicesListController())),
    'StoresServiceView': (context) => StoresServiceView(
        controller: Controller.register(StoresServiceController())),
    'StoreDetalsView': (context) => StoreDetalsView(
        controller: Controller.register(StoreDetalsController())),
    'Test3View': (context) =>
        Test3View(controller: Controller.register(Test3Controller())),
  };
}
