import 'package:esp_wifim/controller/home_controller.dart';
import 'package:esp_wifim/core/constants/colors.dart';
import 'package:esp_wifim/model/fonctions.dart';
import 'package:esp_wifim/view/widgets/button01.dart';
import 'package:esp_wifim/view/widgets/txtButton.dart';
import 'package:esp_wifim/view/wifi_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.GreyBackgraound),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: AppColors.GreyBackgraound,
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: FittedBox(
                  alignment: Alignment.center,
                  child: Text(
                    "ESP\n Wifi Connect",
                    style: TextStyle(fontFamily: "king"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button01(
                      title: "Connect",
                      pressed: () async {
                        String result = await controller.checkConfig();
                        if (result == "true") {
                          Get.to(() => WifiPage());
                        } else {
                          AppFonctions.showMessage(context, result, Colors.red);
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    Button01(
                      title: "ESP code",
                      pressed: () {
                        controller.launchInBrowser(controller.url);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: txtButton(title: "About", onPressed: () {
                  AppFonctions.showMessage(context, "created by abdarrahmen-z", const Color.fromARGB(255, 17, 56, 25));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
