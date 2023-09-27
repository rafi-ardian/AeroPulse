import 'package:air_quality_apps/app/modules/detailinfoscreen/controllers/detailinfoscreen_controller.dart';
import 'package:air_quality_apps/app/modules/detailinfoscreen/views/detailinfoscreen_view.dart';
import 'package:air_quality_apps/app/modules/home/widgets/indicator.dart';
import 'package:air_quality_apps/app/modules/home/widgets/map.dart';
import 'package:air_quality_apps/app/routes/app_pages.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../data/providers/city_provider.dart';
import '../controllers/home_controller.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

import '../widgets/components.dart';
import '';

class HomeView extends GetView<HomeController> {
  final iconList = <IconData>[
    Icons.book,
    Icons.home,
    Icons.person,
  ];
  final cityProvider = Get.put(CityProvider());
  final controllerDetailScreen = Get.put(DetailinfoscreenController());

  // var _bottomNavIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  MapView(
                    controller: controller,
                  ),
                  Indicator(controller: controller)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
