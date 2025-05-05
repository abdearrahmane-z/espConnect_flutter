import 'package:esp_wifim/controller/wifi_page_controller.dart';
import 'package:flutter/material.dart';

class WifiItem extends StatelessWidget {
  const WifiItem({super.key, required this.controller, required this.index, required this.ssid});
  final WifiPageController controller;
  final int index;
  final String ssid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minTileHeight: 40,
          selectedColor: Colors.red,
          selected: controller.isSelected(index),
          title: Text(ssid),
          subtitle: Text("wifi level"),
          onTap: () {
            controller.selectWifi(ssid, index);
          },
          leading: Icon(Icons.wifi),
        ),
        Divider(color: Colors.black),
      ],
    );
  }
}
