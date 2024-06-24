import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../_components/url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ExtenalMapsController extends Controller {
  @override
  onInit() {}

  void _openExternalMaps(BuildContext context) async {
    UrlLauncher.openMap(-23.96337949586382, -46.335853380851646);
  }

  void _openWaze(BuildContext context) async {
    UrlLauncher.openWaze(-23.96337949586382, -46.335853380851646);
  }

  @override
  onClose() {}
}

class ExtenalMapsView extends ViewOf<ExtenalMapsController> {
  ExtenalMapsView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Mundo Pet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height(11)),
            ElevatedButton(
                onPressed: () => controller._openExternalMaps(context),
                child: const Text('Abrir Google Maps')),
            SizedBox(height: size.height(3)),
            ElevatedButton(
              onPressed: () => controller._openWaze(context),
              child: const Text('Abrir Waze'),
            ),
          ],
        ),
      ),
    );
  }
}
