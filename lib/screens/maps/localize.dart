import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import '../../domain/types/colors_app.dart';
import '../_components/modal/modal.dart';
import '../_components/snack/snack_success/snack_success.dart';
import '../_components/text_styles/text_styles.dart';
import '../_scaffold/scaffold_app.dart';

class LocalizeController extends Controller {
  ScaffoldAppController scaffoldAppController = ScaffoldAppController();
  Notifier<double> latitude = Notifier(0.0);
  Notifier<double> longitude = Notifier(0.0);
  Notifier<double> locationLat = Notifier(0.0);
  Notifier<double> locationLong = Notifier(0.0);

  @override
  onInit() {
    configScaffoldApp();
    _checkLocationPermission();
  }

  configScaffoldApp() {
    scaffoldAppController.title.value = 'Localização Atual';
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
      locationLat.value = position.latitude;
      locationLong.value = position.longitude;
    } catch (e) {
      SnackSuccess(message: 'Erro ao obter localização', title: e.toString());
    }
  }

  openModal() {
    MyDialog().showModal(context, size, locationLat.value, locationLong.value);
  }

  @override
  onClose() {}
}

class LocalizeView extends ViewOf<LocalizeController> {
  LocalizeView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppView(
      controller: controller.scaffoldAppController,
      child: controller.locationLat.show(
        (value) => value == 0.0
            ? Center(
                child: Container(
                    width: size.width(80),
                    height: size.height(8),
                    decoration: BoxDecoration(
                      color: ColorApp().fundo03,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Carregando Localização',
                            style: GFont().normalWhiteText(15)),
                        SizedBox(width: size.width(5)),
                        SizedBox(
                            width: size.width(7),
                            height: size.width(7),
                            child: CircularProgressIndicator(
                              color: ColorApp().fundo03,
                              backgroundColor: ColorApp().fundo02,
                            )),
                      ],
                    )))
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      controller.locationLat.value.toString(),
                      style: GFont().normalWhiteText(16),
                    ),
                    SizedBox(height: size.height(2)),
                    Text(
                      controller.locationLong.value.toString(),
                      style: GFont().normalWhiteText(16),
                    ),
                    SizedBox(height: size.height(6)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp().fundo03,
                        elevation: 4,
                        fixedSize: Size(size.width(50), size.height(5.5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: controller.openModal,
                      child: Text('Abrir Modal',
                          style: GFont().normalSecondary(14)),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
