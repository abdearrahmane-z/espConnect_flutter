import 'package:esp_wifim/controller/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wifi_scan/wifi_scan.dart';

class WifiPageController extends GetxController {
  TextEditingController ssidInput = TextEditingController();
  TextEditingController passInput = TextEditingController();
  int? _itemSelected;
  HomeController Hcontroller = Get.find();
  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];
  bool isLoading = true;
  // ESP8266's access point IP (default is 192.168.4.1)
  final String url = "http://192.168.4.1/wifisave";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getScannedResults();
  }

  Future<String> send() async {
    String ssid = ssidInput.text;
    String pass = passInput.text;
    if (ssid.isEmpty) {
      return "WIFI SSID is requird";
    }
    String result = await Hcontroller.checkConfig();
    if (result == "true") {
      return await sendRequest(ssid, pass);
    } else {
      return result;
    }
  }

  void selectWifi(String ssid, int index) {
    ssidInput.text = ssid;
    _itemSelected = index;
    update();
  }

  bool isSelected(int index) {
    if (_itemSelected == index) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getScannedResults() async {
    isLoading = true;
    final results = await WiFiScan.instance.getScannedResults();
    isLoading = false;
    accessPoints = results;
    update();
  }

  Future<String> sendRequest(String ssid, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"s": ssid, "p": password},
      );

      if (response.statusCode == 200) {
        return "Credentials sent successfully!";
      } else {
        return "Failed to send credentials. Status code: ${response.statusCode}";
      }
    } catch (e) {
      return "An error \nWait for ESP connection.";
    }
  }
}
