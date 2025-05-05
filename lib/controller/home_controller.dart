import 'dart:async';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

class HomeController extends GetxController {
  final Uri url =
        Uri(scheme: 'https', host: 'github.com', path: 'abdearrahmane-z/ESP_WiFi_Connect');
  final Uri myProfileURL =
        Uri(scheme: 'https', host: 'github.com', path: 'abdearrahmane-z');


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<String> checkConfig() async {
    if (!await Permission.location.request().isGranted) {
      return "Permissions not granted!";
    }
    if (!await WiFiForIoTPlugin.isEnabled()) {
      return "Turn on Wi-Fi.";
    }
    if (!await WiFiForIoTPlugin.isConnected()) {
      return "Connect to ESP Wi-Fi.";
    }
    if (await WiFiScan.instance.canGetScannedResults() != CanGetScannedResults.yes) {
      return "Turn on GPS.";
    }
    else {
      return "true";
    }
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

}
