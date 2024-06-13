import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'screens/menu.dart';
import 'splash.dart';

class AppRouter {
  final fadeRoutes = ['SplashView', 'HomeScreenView'];
  final routes = {
    //
    // Rota Login
    //
    'SplashView': (context) =>
        SplashView(controller: Controller.register(SplashController())),
    'MenuPetView': (context) =>
        MenuPetView(controller: Controller.register(MenuPetController())),
    // 'MenuNewView': (context) =>
    //     MenuNewView(controller: Controller.register(MenuNewController())),
    // 'MenuLojasView': (context) =>
    //     MenuLojasView(controller: Controller.register(MenuLojasController())),
    // 'MenuPetView': (context) =>
    //     MenuPetView(controller: Controller.register(MenuPetController())),
    // 'HomeScreenView': (context) =>
    //     HomeScreenView(controller: Controller.register(HomeScreenController())),
    // 'StorePageView': (context) =>
    //     StorePageView(controller: Controller.register(StorePageController())),
    // 'ServicesListView': (context) => ServicesListView(
    //     controller: Controller.register(ServicesListController())),
    // 'StoresServiceView': (context) => StoresServiceView(
    //     controller: Controller.register(StoresServiceController())),
    // 'StoreDetalsView': (context) => StoreDetalsView(
    //     controller: Controller.register(StoreDetalsController())),
    // 'MenuTestesView': (context) =>
    //     MenuTestesView(controller: Controller.register(MenuTestesController())),
    // 'RpcTestesView': (context) =>
    //     RpcTestesView(controller: Controller.register(RpcTestesController())),
  };
}
