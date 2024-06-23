import 'package:flutter/material.dart';

import '../../components/text_styles/text_styles.dart';

class ContainerAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthApp = MediaQuery.of(context).size.width;
    var heightApp = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2D2D4D),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          margin: EdgeInsets.only(
              left: widthApp * 0.05,
              right: widthApp * 0.05,
              top: heightApp * 0.05),
          decoration: BoxDecoration(
            color: const Color(0xFF3C3C6C),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Icons.wb_cloudy,
                      color: Colors.white, size: 50.0), // Ícone do clima
                  SizedBox(width: heightApp * 0.02), // Espaçamento
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cloudy',
                        style: GFont().normalDarkText(20),
                      ),
                      const Text(
                        'Sidoluhur, Godean',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    '28°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildContainerAppInfo('31°C', 'Sensible'),
                  _buildContainerAppInfo('65%', 'Humidity'),
                  _buildContainerAppInfo('3', 'W. force'),
                  _buildContainerAppInfo('1009 hPa', 'Pressure'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainerAppInfo(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
