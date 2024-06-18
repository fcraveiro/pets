import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:page_transition/page_transition.dart';
import 'components/keys/globals.dart';
import 'routes.dart';
import 'splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // FlutterNativeSplash.remove();
  // AppColorsModeRepositoryStorage appThemeModeStorage =
  //     AppColorsModeRepositoryStorage();
  // GlobalState<AppColors>().register(await appThemeModeStorage.load());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF2D3A5C),
      ),
      child: MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        debugShowCheckedModeBanner: false,
        initialRoute: (SplashView).toString(),
        navigatorObservers: [FVCNavigatorMonitor()],
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1)),
            child: child!,
          );
        },
        onGenerateRoute: (settings) {
          if (AppRouter().fadeRoutes.contains(settings.name!)) {
            return PageTransition(
              type: PageTransitionType.fade,
              settings: settings,
              duration: const Duration(seconds: 1),
              child: AppRouter().routes[settings.name!]!(context),
            );
          } else {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (context, animation, secondaryAnimation) {
                return AppRouter().routes[settings.name!]!(context);
              },
            );
          }
        },
      ),
    );
  }
}
