import 'package:air_quality_apps/app/modules/mainscreen/views/mainscreen_view.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../mainscreen/controllers/mainscreen_controller.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainscreenController());

    return Scaffold(
      body: Center(
          child:
              // FlutterSplashScreen.gif(
              //   gifPath: 'assets/icons/splash.gif',
              //   gifWidth: 269,
              //   gifHeight: 474,
              //   defaultNextScreen: MainscreenView(),
              //   duration: const Duration(milliseconds: 3515),
              //   onInit: () async {
              //     debugPrint("onInit 1");
              //     await Future.delayed(const Duration(milliseconds: 2000));
              //     debugPrint("onInit 2");
              //   },
              //   onEnd: () async {
              //     debugPrint("onEnd 1");
              //     debugPrint("onEnd 2");
              //   },
              // ),
              AnimatedSplashScreen(
                  backgroundColor: splashScreenScolor,
                  splash: ("assets/icons/aeropulse-splash.png"),
                  nextScreen: MainscreenView())),
    );
  }
}
