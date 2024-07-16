import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  // static Future<void> openWaze(double latitude, double longitude) async {
  //   String wazeUrl = 'https://waze.com/ul?ll=$latitude,$longitude&navigate=yes';
  //   if (await canLaunchUrl(Uri.parse(wazeUrl))) {
  //     await launchUrl(Uri.parse(wazeUrl));
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }

  static Future<void> openWaze(double latitude, double longitude) async {
    String wazeUrl = 'https://meet.google.com/wkn-waco-bft?authuser=2';
    if (await canLaunchUrl(Uri.parse(wazeUrl))) {
      await launchUrl(Uri.parse(wazeUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
