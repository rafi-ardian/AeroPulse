import 'package:air_quality_apps/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../themes.dart';
import '../../../routes/app_pages.dart';
import 'components.dart';

class Indicator extends StatelessWidget {
  final HomeController controller;

  Indicator({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: () async {
          await controller.fetchCityName(
              controller.lat.value, controller.lon.value);
          print(controller.city.value);

          if (controller.aqi.value == 0.0) {
            // showBeautifulDialog();
            Get.snackbar("please confirm your location!", "");
          } else {
            Get.toNamed(Routes.DETAILINFOSCREEN, arguments: {
              'cityName': controller.city.value,
            });
          }
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 200,
          height: 100,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => CircularPercentIndicator(
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AQI",
                          style: boldText13.copyWith(color: blackColor),
                        ),
                        Hero(
                          tag: "tag-1",
                          flightShuttleBuilder: flightShuttleBuilder,
                          child: Text(
                            "${controller.aqi}",
                            style: semiBoldText13.copyWith(color: blackColor),
                          ),
                        )
                      ],
                    ),
                    radius: 35,
                    animation: true,
                    lineWidth: 10,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: lightGreyColor,
                    progressColor: controller.progressColor,
                    percent: controller.aqiPercentage,
                  )),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Components(
                        componentsLabel: 'CO',
                        componentsValue:
                            "${controller.components["co"] ?? '-'}",
                      ),
                      SizedBox(width: 10),
                      Components(
                        componentsLabel: 'NO',
                        componentsValue:
                            "${controller.components["no"] ?? '-'}",
                      ),
                      SizedBox(width: 10),
                      Components(
                        componentsLabel: 'NO\u00B2',
                        componentsValue:
                            "${controller.components["no2"] ?? '-'}",
                      ),
                      SizedBox(width: 10),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    final Hero toHero = toHeroContext.widget as Hero;
    return RotationTransition(
      turns: animation,
      child: toHero.child,
    );
  }
}
