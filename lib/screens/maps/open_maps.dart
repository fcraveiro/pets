import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../../domain/types/colors_app.dart';
import '../_components/text_styles/text_styles.dart';
import '../_components/url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../_scaffold/scaffold_app.dart';

class ExtenalMapsController extends Controller {
  ScaffoldAppController scaffoldAppController = ScaffoldAppController();

  @override
  onInit() {
    configScaffoldApp();
  }

  configScaffoldApp() {
    scaffoldAppController.title.value = 'Localização Atual';
  }

  void _openExternalMaps(BuildContext context) async {
    UrlLauncher.openMap(-23.97694619776616, -46.31118901918475);
  }

  void _openWaze(BuildContext context) async {
    UrlLauncher.openWaze(-23.97694619776616, -46.31118901918475);
  }

  @override
  onClose() {}
}

class ExtenalMapsView extends ViewOf<ExtenalMapsController> {
  ExtenalMapsView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppView(
      controller: controller.scaffoldAppController,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp().fundo03,
                elevation: 4,
                fixedSize: Size(size.width(70), size.height(5.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => controller._openExternalMaps(context),
              child:
                  Text('Abrir Google Maps', style: GFont().normalSecondary(14)),
            ),
            SizedBox(height: size.height(3)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp().fundo03,
                elevation: 4,
                fixedSize: Size(size.width(70), size.height(5.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => controller._openWaze(context),
              child: Text('Abrir Waze', style: GFont().normalSecondary(14)),
            ),
          ],
        ),
      ),
    );
  }
}
