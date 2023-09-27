import 'package:air_quality_apps/app/modules/home/controllers/home_controller.dart';
import 'package:air_quality_apps/app/modules/profilescreen/views/profilescreen_view.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../magazinescreen/views/magazinescreen_view.dart';
import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  final _homeController = Get.lazyPut(() => HomeController());
  final controller = Get.put(MainscreenController());

  final List<Widget> _pages = [
    MagazinescreenView(),
    HomeView(),
    ProfilescreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Magazine',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
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
