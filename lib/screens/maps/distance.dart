import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../domain/types/colors_app.dart';
import '../_components/text_styles/text_styles.dart';
import '../_scaffold/scaffold_app.dart';

class DistanceController extends Controller {
  ScaffoldAppController scaffoldAppController = ScaffoldAppController();
  String apiDistance = dotenv.env['apiDistance']!;
  String errorMessage = '';
  late final apiKey = apiDistance;
  final Notifier<double> _distance = Notifier(0.0);

  @override
  onInit() {
    configScaffoldApp();
  }

  configScaffoldApp() {
    scaffoldAppController.title.value = 'Calculo de Distância';
  }

  Future<void> _calculateDistance() async {
    const startLng = -46.347817814019606; // start : Aleatório
    const startLat = -23.963462414778537;
    const endLng = -46.31118901918475; // end : Shopping Praia Mar
    const endLat = -23.97694619776616;

    const url = 'https://api.openrouteservice.org/v2/directions/driving-car?';
    final params = {
      'api_key': apiDistance,
      'start': '$startLng,$startLat',
      'end': '$endLng,$endLat'
    };
    try {
      final response = await Dio().get(url, queryParameters: params);
      if (response.statusCode == 200) {
        final data = response.data;
        final segments =
            List.from(data['features'][0]['properties']['segments']);
        if (segments.isNotEmpty) {
          final distanceInMeters = segments
              .map((segment) => segment['distance'])
              .reduce((a, b) => a + b);
          _distance.value = distanceInMeters / 1000;
        } else {
          errorMessage =
              'Não foi possível calcular a distância. Verifique os dados de entrada.';
        }
      } else {
        errorMessage = 'Erro na requisição: ${response.statusCode}';
      }
    } catch (e) {
      print(e);
      errorMessage = 'Falha ao carregar dados: $e';
    }
  }

  @override
  onClose() {}
}

class DistanceView extends ViewOf<DistanceController> {
  DistanceView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppView(
      controller: controller.scaffoldAppController,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller._distance.show(
              (value) => Text('Distância: ${value.toStringAsFixed(2)} km',
                  style: GFont().normalSecondary(16)),
            ),
            SizedBox(height: size.height(4)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp().fundo03,
                elevation: 4,
                fixedSize: Size(size.width(70), size.height(5.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: controller._calculateDistance,
              child: Text('Calcular Distância',
                  style: GFont().normalSecondary(14)),
            ),
            SizedBox(height: size.height(3)),
            // if (controller._distance.value > 0)
          ],
        ),
      ),
    );
  }
}

oldFunction(data, distance) {
  if (data != null &&
      data['features'] != null &&
      data['features'].isNotEmpty &&
      data['features'][0]['properties'] != null &&
      data['features'][0]['properties']['segments'] != null &&
      data['features'][0]['properties']['segments'].isNotEmpty) {
    final distance =
        data['features'][0]['properties']['segments'][0]['distance'] / 1000;
    return distance;
  }
}
