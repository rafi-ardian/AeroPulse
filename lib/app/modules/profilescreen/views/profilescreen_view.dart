import 'package:air_quality_apps/themes.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/profilescreen_controller.dart';
import '../widgets/chart.dart';

class ProfilescreenView extends GetView<ProfilescreenController> {
  // final controllerHome = Get.find<HomeController>();
  // final controller = Get.put(ProfilescreenController());
  @override
  Widget build(BuildContext context) {
    final controllerHome = Get.find<HomeController>();
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  // HEADER
                  Container(
                    decoration: BoxDecoration(
                        color: whiteSmoke,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style:
                                    semiBoldText35.copyWith(color: blackColor),
                              ),
                              Text(
                                "moresugar",
                                style:
                                    regulerText25.copyWith(color: blackColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/image/pubg.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // MAIN CONTENT
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Container(
                            height: Get.height / 2.5, child: BarChartSample1()),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: Get.height / 5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: whiteSmoke,
                              borderRadius: BorderRadius.circular(20)),
                          child: Obx(
                            () => CircularPercentIndicator(
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (controller.uv == null ||
                                          controller.uv == 0.0)
                                      ? Image.asset(
                                          "assets/icons/no-data.png",
                                          scale: 15,
                                        )
                                      : Text(
                                          "${controller.uv.toInt()}",
                                          style: regulerText20.copyWith(
                                              color: blackColor),
                                        ),
                                ],
                              ),
                              radius: 35,
                              header: Text(
                                "UV",
                                style:
                                    semiBoldText20.copyWith(color: blackColor),
                              ),
                              animation: true,
                              lineWidth: 10,
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: (controller.uv == null ||
                                      controller.uv == 0.0)
                                  ? whiteSmoke
                                  : lightGreyColor,
                              progressColor: controller.progressColor,
                              percent: controller.uvPercentage,
                              footer: (controller.uv == null ||
                                      controller.uv == 0.0)
                                  ? Text("no data")
                                  : Text(""),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteSmoke,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // If you want a minimum size, you can use MainAxisSize.min
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Safe exposure time",
                                style:
                                    regulerText20.copyWith(color: blackColor),
                              ),
                              Divider(thickness: 1),
                              GetX<ProfilescreenController>(
                                builder: (controller) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.bounceOut,
                                    height: controller.showNewContainer.value
                                        ? 50
                                        : 0,
                                    child: Center(child: Text("test")),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    // onTap: controller.toggleContainer,
                                    child: ElTooltip(
                                      controller: controller.tooltipController,
                                      showArrow: true,
                                      appearAnimationDuration:
                                          Duration(milliseconds: 150),
                                      disappearAnimationDuration:
                                          Duration(milliseconds: 150),
                                      content: Wrap(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.skinTypeValue.value =
                                                  1;
                                              controller.tooltipController
                                                  .hide();
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: skinType1,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () {
                                              controller.skinTypeValue.value =
                                                  2;
                                              controller.tooltipController
                                                  .hide();
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: skinType2,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () {
                                              controller.skinTypeValue.value =
                                                  3;
                                              controller.tooltipController
                                                  .hide();
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: skinType3,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () {
                                              controller.skinTypeValue.value =
                                                  4;
                                              controller.tooltipController
                                                  .hide();
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: skinType4,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () {
                                              controller.skinTypeValue.value =
                                                  5;
                                              controller.tooltipController
                                                  .hide();
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: skinType5,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () {
                                              controller.skinTypeValue.value =
                                                  6;
                                              controller.tooltipController
                                                  .hide();
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: skinType6,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Obx(() => Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: controller.skinColor,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          )),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Obx(() => Column(
                                        children: [
                                          Text(
                                            controller.skinTypeText,
                                            style: regulerText14.copyWith(
                                                color: blackColor),
                                          ),
                                          Text(
                                            "${controller.skinTime}",
                                            style: regulerText14.copyWith(
                                                color: blackColor),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// Row(
                //   children: [
                //     Expanded(
                //       flex: 1,
                //       child: Container(
                //         height: Get.height / 5,
                //         width: double.infinity,
                //         decoration: BoxDecoration(
                //             color: whiteSmoke,
                //             borderRadius: BorderRadius.circular(20)),
                //         child: Obx(() => CircularPercentIndicator(
                //               center: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     "${controller.uv.toInt()}",
                //                     style: regulerText20.copyWith(
                //                         color: blackColor),
                //                   ),
                //                 ],
                //               ),
                //               radius: 35,
                //               header: Text(
                //                 "UV",
                //                 style:
                //                     semiBoldText20.copyWith(color: blackColor),
                //               ),
                //               animation: true,
                //               lineWidth: 10,
                //               circularStrokeCap: CircularStrokeCap.round,
                //               backgroundColor: lightGreyColor,
                //               progressColor: controller.progressColor,
                //               percent: controller.uvPercentage,
                //             )),
                //       ),
                //     ),
                //     SizedBox(width: 10),
                //     Expanded(
                //       flex: 3,
                //       child: Container(
                //         padding: EdgeInsets.all(8),
                //         width: double.infinity,
                //         decoration: BoxDecoration(
                //           color: whiteSmoke,
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           // If you want a minimum size, you can use MainAxisSize.min
                //           // mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Text(
                //               "Safe exposure time",
                //               style: regulerText20.copyWith(color: blackColor),
                //             ),
                //             Divider(thickness: 1),
                //             GetX<ProfilescreenController>(
                //               builder: (controller) {
                //                 return AnimatedContainer(
                //                   duration: Duration(milliseconds: 300),
                //                   curve: Curves.bounceOut,
                //                   height: controller.showNewContainer.value
                //                       ? 50
                //                       : 0,
                //                   child: Center(child: Text("test")),
                //                 );
                //               },
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 GestureDetector(
                //                   // onTap: controller.toggleContainer,
                //                   child: ElTooltip(
                //                     controller: controller.tooltipController,
                //                     showArrow: true,
                //                     appearAnimationDuration:
                //                         Duration(milliseconds: 150),
                //                     disappearAnimationDuration:
                //                         Duration(milliseconds: 150),
                //                     content: Wrap(
                //                       children: [
                //                         GestureDetector(
                //                           onTap: () {
                //                             controller.skinTypeValue.value = 1;
                //                             controller.tooltipController.hide();
                //                           },
                //                           child: Container(
                //                             height: 35,
                //                             width: 35,
                //                             decoration: BoxDecoration(
                //                               color: skinType1,
                //                               borderRadius:
                //                                   BorderRadius.circular(25),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(width: 4),
                //                         GestureDetector(
                //                           onTap: () {
                //                             controller.skinTypeValue.value = 2;
                //                             controller.tooltipController.hide();
                //                           },
                //                           child: Container(
                //                             height: 35,
                //                             width: 35,
                //                             decoration: BoxDecoration(
                //                               color: skinType2,
                //                               borderRadius:
                //                                   BorderRadius.circular(25),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(width: 4),
                //                         GestureDetector(
                //                           onTap: () {
                //                             controller.skinTypeValue.value = 3;
                //                             controller.tooltipController.hide();
                //                           },
                //                           child: Container(
                //                             height: 35,
                //                             width: 35,
                //                             decoration: BoxDecoration(
                //                               color: skinType3,
                //                               borderRadius:
                //                                   BorderRadius.circular(25),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(width: 4),
                //                         GestureDetector(
                //                           onTap: () {
                //                             controller.skinTypeValue.value = 4;
                //                             controller.tooltipController.hide();
                //                           },
                //                           child: Container(
                //                             height: 35,
                //                             width: 35,
                //                             decoration: BoxDecoration(
                //                               color: skinType4,
                //                               borderRadius:
                //                                   BorderRadius.circular(25),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(width: 4),
                //                         GestureDetector(
                //                           onTap: () {
                //                             controller.skinTypeValue.value = 5;
                //                             controller.tooltipController.hide();
                //                           },
                //                           child: Container(
                //                             height: 35,
                //                             width: 35,
                //                             decoration: BoxDecoration(
                //                               color: skinType5,
                //                               borderRadius:
                //                                   BorderRadius.circular(25),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(width: 4),
                //                         GestureDetector(
                //                           onTap: () {
                //                             controller.skinTypeValue.value = 6;
                //                             controller.tooltipController.hide();
                //                           },
                //                           child: Container(
                //                             height: 35,
                //                             width: 35,
                //                             decoration: BoxDecoration(
                //                               color: skinType6,
                //                               borderRadius:
                //                                   BorderRadius.circular(25),
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                     child: Obx(() => Container(
                //                           height: 50,
                //                           width: 50,
                //                           decoration: BoxDecoration(
                //                             color: controller.skinColor,
                //                             borderRadius:
                //                                 BorderRadius.circular(25),
                //                           ),
                //                         )),
                //                   ),
                //                 ),
                //                 SizedBox(width: 10),
                //                 Obx(() => Column(
                //                       children: [
                //                         Text(
                //                           controller.skinTypeText,
                //                           style: regulerText14.copyWith(
                //                               color: blackColor),
                //                         ),
                //                         Text(
                //                           "${controller.skinTime}",
                //                           style: regulerText14.copyWith(
                //                               color: blackColor),
                //                         ),
                //                       ],
                //                     )),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
           