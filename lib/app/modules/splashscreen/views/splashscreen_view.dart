import 'package:air_quality_apps/app/modules/home/controllers/home_controller.dart';
import 'package:air_quality_apps/app/modules/magazinescreen/controllers/magazinescreen_controller.dart';
import 'package:air_quality_apps/app/modules/mainscreen/views/mainscreen_view.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../mainscreen/controllers/mainscreen_controller.dart';
import '../../profilescreen/controllers/profilescreen_controller.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(ProfilescreenController());
    Get.put(HomeController());
    Get.put(MagazinescreenController());
    return Scaffold(
      body: Center(
          child: AnimatedSplashScreen(
              backgroundColor: splashScreenScolor,
              splash: ("assets/icons/aeropulse-splash.png"),
              nextScreen: MainscreenView())),
    );
  }
}
