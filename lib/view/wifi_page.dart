// ignore_for_file: unused_local_variable

import 'package:esp_wifim/controller/home_controller.dart';
import 'package:esp_wifim/controller/wifi_page_controller.dart';
import 'package:esp_wifim/core/constants/colors.dart';
import 'package:esp_wifim/model/fonctions.dart';
import 'package:esp_wifim/view/widgets/button01.dart';
import 'package:esp_wifim/view/widgets/inputText.dart';
import 'package:esp_wifim/view/widgets/wifi_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WifiPage extends StatelessWidget {
  const WifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    // ignore: unused_local_variable
    HomeController Hcontroller = Get.find();
    WifiPageController controller = Get.put(WifiPageController());
    final double screenHeight =
        MediaQuery.of(context).size.height -
        (kBottomNavigationBarHeight + kToolbarHeight);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.GreyBackgraound,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.replay),
              onPressed: () async {
                String result = await Hcontroller.checkConfig();
                if (result == "true") {
                  controller.getScannedResults();
                } else {
                  AppFonctions.showMessage(context, result, Colors.red);
                }
              },
            ),
          ),
        ],
        title: FittedBox(
          child: Text(
            "Select Wifi Hotspot",
            style: TextStyle(fontFamily: "Inika"),
          ),
        ),
        backgroundColor: AppColors.GreyBackgraound,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 400,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    boxShadow: [],
                  ),
                  child: GetBuilder<WifiPageController>(
                    builder:
                        (controller) =>
                            controller.isLoading
                                ? Center(child: CircularProgressIndicator())
                                : controller.accessPoints.isEmpty
                                ? Center(child: Text("no Wifi availabel"))
                                : ListView.builder(
                                  padding: EdgeInsets.all(8),
                                  itemCount: controller.accessPoints.length,
                                  itemBuilder: (context, index) {
                                    return WifiItem(
                                      controller: controller,
                                      index: index,
                                      ssid: controller.accessPoints[index].ssid,
                                    );
                                  },
                                ),
                  ),
                ),
              ),
              GetBuilder<WifiPageController>(
                builder:
                    (controller) => Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 400,
                        width: 500,
                        child: Column(
                          children: [
                            InputWidget(
                              hint: "SSID",
                              controller: controller.ssidInput,
                            ),
                            InputWidget(
                              hint: "PASSWORD",
                              controller: controller.passInput,
                            ),
                            Button01(
                              title: "Send",
                              pressed: () async {
                                String result = await controller.send();
                                ("Credentials sent successfully!" == result)
                                    ? AppFonctions.showMessage(
                                      context,
                                      result+"\nWait for ESP connection...",
                                      Colors.green,
                                    )
                                    : AppFonctions.showMessage(
                                      context,
                                      result,
                                      Colors.red,
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
