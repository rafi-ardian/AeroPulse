import 'package:air_quality_apps/app/modules/home/controllers/home_controller.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../controllers/detailinfoscreen_controller.dart';
import '../widgets/detail_component_indicator.dart';

class DetailinfoscreenView extends GetView<DetailinfoscreenController> {
  final controllerHome = Get.put(HomeController());

  var valueTest;
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, String>;
    final cityName = arguments['cityName'];

    return Scaffold(
      // appBar: AppBar(backgroundColor: redButtonColor),
      body: SafeArea(
        child: Center(
          child: Container(
            color: controllerHome.progressColor,
            height: Get.height,
            child: ExpandableBottomSheet(
              //optional; default: Duration(milliseconds: 250)
              //The durations of the animations.
              animationDurationExtend: Duration(milliseconds: 500),
              animationDurationContract: Duration(milliseconds: 250),

              //optional; default: Curves.ease
              //The curves of the animations.
              animationCurveExpand: Curves.ease,
              animationCurveContract: Curves.ease,

              //optional
              //The content extend will be at least this height. If the content
              //height is smaller than the persistentContentHeight it will be
              //animated on a height change.
              //You can use it for example if you have no header.
              persistentContentHeight: 0,

              // This will enable tap to toggle option on header.
              enableToggle: true,

              onIsContractedCallback: () => controller.isExtended.value = true,
              onIsExtendedCallback: () => controller.isExtended.value = false,

              //optional
              //This widget is sticking above the content and will never be contracted.
              persistentHeader: Container(
                color: Colors.transparent,
                constraints: BoxConstraints.expand(height: 40),
                child: Obx(
                  () => Center(
                    child: controller.isExtended.value
                        ? Icon(
                            Icons.keyboard_arrow_up,
                            size: 35,
                            color: blackColor.withOpacity(0.4),
                          )
                        : Icon(Icons.keyboard_arrow_down,
                            size: 35, color: blackColor.withOpacity(0.4)),
                  ),
                ),
              ),
              background: Column(
                children: [
                  Container(
                    height: Get.height / 16,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_searching_outlined),
                        SizedBox(width: Get.width / 40),
                        // Obx(() =>
                        Text(
                          "${cityName}",
                          // "ss",
                          style: semiBoldText20.copyWith(color: whiteColor),
                        )
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "tag-1",
                          flightShuttleBuilder: flightShuttleBuilder,
                          child: Text(
                            "${controllerHome.aqi}",
                            style: mediumText50.copyWith(color: whiteColor),
                          ),
                        ),
                        Text(
                          "${controllerHome.healthDesc}",
                          style: regulerText35.copyWith(color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    height: Get.height / 2,
                    width: Get.width,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: blackColor.withOpacity(0.15), width: 7),
                          bottom: BorderSide(
                              color: blackColor.withOpacity(0.15), width: 7),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: ImageIcon(controllerHome.iconDesc1,
                                    size: 35),
                              ),
                              SizedBox(width: 15),
                              Flexible(
                                flex: 5,
                                child: RichText(
                                  text: TextSpan(
                                    text: "${controllerHome.textDesc1}",
                                    style: regulerText20.copyWith(
                                        color: whiteColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: ImageIcon(controllerHome.iconDesc2,
                                    size: 35),
                              ),
                              SizedBox(width: 15),
                              Flexible(
                                flex: 5,
                                child: RichText(
                                  text: TextSpan(
                                    text: "${controllerHome.textDesc2}",
                                    style: regulerText20.copyWith(
                                        color: whiteColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              ImageIcon(controllerHome.iconDesc3, size: 35),
                              SizedBox(width: 15),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: "${controllerHome.textDesc3}",
                                    style: regulerText20.copyWith(
                                        color: whiteColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   // color: Colors.white,
                  //   height: Get.height / 2,
                  //   width: Get.width,
                  //   padding: EdgeInsets.only(left: 20, right: 20),
                  //   child: Row(
                  //     children: [
                  //       // verticalIndicator(),
                  //       VerticalBarIndicator(
                  //         percent: controllerHome.components["co"] / 15400,
                  //         header: '${controllerHome.components["co"]}',
                  //         footer: 'CO',
                  //       ),
                  //       SizedBox(width: 20),
                  //       VerticalBarIndicator(
                  //         percent: controllerHome.components["o3"] / 180,
                  //         header: '${controllerHome.components["o3"]}',
                  //         footer: 'o3',
                  //       ),
                  //       SizedBox(width: 20),
                  //       VerticalBarIndicator(
                  //         percent: controllerHome.components["so2"] / 350,
                  //         header: '${controllerHome.components["so2"]}',
                  //         footer: 'so2',
                  //       ),
                  //       SizedBox(width: 20),
                  //       VerticalBarIndicator(
                  //         percent: controllerHome.components["pm2_5"] / 75,
                  //         header: '${controllerHome.components["pm2_5"] / 75}',
                  //         footer: 'pm2_5',
                  //       ),
                  //       SizedBox(width: 20),
                  //       VerticalBarIndicator(
                  //         percent: controllerHome.components["pm10"] / 200,
                  //         header: '${controllerHome.components["pm10"] / 200}',
                  //         footer: 'pm10',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              expandableContent: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: Get.height / 3,
                width: Get.width,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        // lanjutin yg bawah dah bener
                        ComponentIndicator(
                            titleTest: "CO",
                            valueTest: controllerHome.components["co"] / 15400),
                        SizedBox(width: 10),
                        ComponentIndicator(
                            titleTest: "o3",
                            valueTest: controllerHome.components["o3"] / 180),
                      ],
                    ),
                    Row(
                      children: [
                        // lanjutin yg bawah dah bener
                        ComponentIndicator(
                            titleTest: "so2",
                            valueTest: controllerHome.components["so2"] / 350),
                        SizedBox(width: 10),
                        ComponentIndicator(
                            titleTest: "no2",
                            valueTest: controllerHome.components["no2"] / 200),
                      ],
                    ),
                    Row(
                      children: [
                        // lanjutin yg bawah dah bener
                        ComponentIndicator(
                            titleTest: "pm10",
                            valueTest: controllerHome.components["pm10"] / 200),
                        SizedBox(width: 10),
                        ComponentIndicator(
                            titleTest: "pm2_5",
                            valueTest: controllerHome.components["pm2_5"] / 75),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
