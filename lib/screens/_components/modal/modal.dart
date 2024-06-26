import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../../../domain/types/colors_app.dart';
import '../text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import '../../maps/open_map.dart';

class MyDialog {
  Future<void> showModal(
      BuildContext context, Sizer size, double lat, double long) async {
    return showDialog<void>(
      // barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Center(
          child: SizedBox(
            width: size.width(84),
            height: size.height(70),
            // color: ColorApp().fundo02,
            child: Card(
              color: ColorApp().fundo03,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height(3.5)),
                  Text('Localização Atual', style: GFont().normalWhiteText(16)),
                  SizedBox(height: size.height(3)),
                  Text('Latitude : $lat', style: GFont().normalSecondary(14)),
                  SizedBox(height: size.height(1)),
                  Text('Longitude : $long', style: GFont().normalSecondary(14)),
                  SizedBox(height: size.height(3.5)),
                  Center(
                    child: Container(
                        width: size.width(70),
                        height: size.height(46),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorApp().secondary,
                            width: 1,
                          ),
                        ),
                        // padding: EdgeInsets.all(size.width(4)),
                        // color: ColorApp().fundo04,
                        child: MapPage(latitude: lat, longitude: long)),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn().scaleXY(
                begin: 0.0,
                end: 1.0,
                duration: 210.ms,
              ), // inherits duration from fadeIn
          // .moveY(
          //     begin: 800,
          //     end: 0,
          //     delay: 300.ms,
          //     duration: 700.ms), // runs after the above w/new duration
        );
      },
    );
  }
}
