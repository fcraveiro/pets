import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import '../_components/snack/snack_success/snack_success.dart';
import '../_components/text_styles/text_styles.dart';

class LocalizeController extends Controller {
  Notifier<double> latitude = Notifier(0.0);
  Notifier<double> longitude = Notifier(0.0);
  Notifier<String> locationLat = Notifier('');
  Notifier<String> locationLong = Notifier('');

  @override
  onInit() {
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
    if (await Permission.location.isGranted) {
      _getCurrentLocation();
    } else {
      SnackSuccess(message: 'Permissão de localização negada', title: 'Erro');
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      locationLat.value = 'Latitude: ${position.latitude}';
      locationLong.value = 'Longitude: ${position.longitude}';
    } catch (e) {
      SnackSuccess(message: 'Erro ao obter localização', title: e.toString());
    }
  }

  @override
  onClose() {}
}

class LocalizeView extends ViewOf<LocalizeController> {
  LocalizeView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização'),
      ),
      body: controller.locationLat.show(
        (value) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                controller.locationLat.value,
                style: GFont().normalBlackText(16),
              ),
              SizedBox(height: size.height(2)),
              Text(
                controller.locationLong.value,
                style: GFont().normalBlackText(16),
              ),
              SizedBox(height: size.height(6)),
              ElevatedButton(
                onPressed: controller._getCurrentLocation,
                child: const Text('Obter Localização Atual'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
