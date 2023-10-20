import 'package:air_quality_apps/app/modules/home/controllers/home_controller.dart';
import 'package:air_quality_apps/app/modules/magazinescreen/controllers/magazinescreen_controller.dart';
import 'package:air_quality_apps/app/modules/profilescreen/controllers/profilescreen_controller.dart';
import 'package:air_quality_apps/app/modules/profilescreen/views/profilescreen_view.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../magazinescreen/views/magazinescreen_view.dart';
import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  // final homeController = Get.lazyPut(() => HomeController());

  final List<Widget> _pages = [
    MagazinescreenView(),
    HomeView(),
    ProfilescreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final controller = Get.put(MainscreenController());
    Get.lazyPut(() => ProfilescreenController());
    // Get.put(MagazinescreenController());
    return Scaffold(
      body: Obx(() => _pages[controller.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/news.png',
                  width: 24.0,
                  height: 24.0,
                  color:
                      controller.tabIndex.value == 0 ? blackColor : greyColor),
              label: 'Magazine',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png',
                  width: 24.0,
                  height: 24.0,
                  color:
                      controller.tabIndex.value == 1 ? blackColor : greyColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/profile.png',
                  width: 24.0,
                  height: 24.0,
                  color:
                      controller.tabIndex.value == 2 ? blackColor : greyColor),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: blackColor,
          iconSize: 30,
        ),
      ),
    );
  }
}
