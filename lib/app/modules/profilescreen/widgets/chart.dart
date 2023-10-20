import 'dart:async';
import 'dart:math';

import 'package:air_quality_apps/app/modules/profilescreen/controllers/profilescreen_controller.dart';
import 'package:air_quality_apps/app/util/extensions/color_extensions.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../resources/app_colors.dart';

class BarChartSample1 extends StatefulWidget {
  BarChartSample1({super.key});

  List<Color> get availableColors => const <Color>[
        AppColors.contentColorPurple,
        AppColors.contentColorYellow,
        AppColors.contentColorBlue,
        AppColors.contentColorOrange,
        AppColors.contentColorPink,
        AppColors.contentColorRed,
      ];

  // final Color barBackgroundColor = redButtonColor;

  final Color barBackgroundColor =
      AppColors.contentColorWhite.darken().withOpacity(0.3);
  final Color barColor = AppColors.contentColorWhite;
  final Color touchedBarColor = whiteSmoke;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);

  ProfilescreenController controller = Get.put(ProfilescreenController());

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          // Obx(() => Skeletonizer(
          //       enabled: true,
          //       // enabled: controller.isLoading.value,
          //       effect: ShimmerEffect(
          //           baseColor: whiteColor,
          //           highlightColor: greyColor,
          //           duration: Duration(seconds: 1)),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: <Widget>[
          //           Text(
          //             '${controller.initCity.value}\nHourly UV Index',
          //             style: regulerText25.copyWith(color: whiteSmoke),
          //           ),
          //           SizedBox(
          //             height: 38,
          //           ),
          //           Obx(() {
          //             if (controller.uvDataList == null ||
          //                 controller.uvDataList.isEmpty) {
          //               return Center(child: Text("No data found"));
          //             }
          //             return Expanded(
          //               child: BarChart(
          //                 isPlaying ? randomData() : mainBarData(),
          //                 swapAnimationDuration: animDuration,
          //               ),
          //             );
          //           }),
          //         ],
          //       ),
          //     )),

          Obx(() => Skeletonizer(
                // enabled: true,
                enabled: controller.isLoading.value,
                effect: ShimmerEffect(
                    baseColor: whiteColor,
                    highlightColor: greyColor,
                    duration: Duration(seconds: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${controller.initCity.value}\nHourly UV Index',
                      style: regulerText25.copyWith(color: whiteSmoke),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Expanded(
                      child: BarChart(
                        isPlaying ? randomData() : mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    )
                  ],
                ),
              )),

          // Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Obx(() {
          //         if (controller.isLoading.value) {
          //           return Center(
          //             child: CircularProgressIndicator(color: whiteColor),
          //           );
          //         } else if (controller.uvDataList == null ||
          //             controller.uvDataList.isEmpty) {
          //           return Center(child: Text("No data found"));
          //         }
          //         return Column(
          //           children: [
          //             Text(
          //               '${controller.initCity.value}\nHourly UV Index',
          //               style: regulerText25.copyWith(color: whiteSmoke),
          //             ),
          //             Text(
          //               'Bekasi\nHourly UV Index',
          //               style: regulerText25.copyWith(color: whiteSmoke),
          //             ),
          //             SizedBox(
          //               height: 38,
          //             ),
          //             Expanded(
          //               child: BarChart(
          //                 isPlaying ? randomData() : mainBarData(),
          //                 swapAnimationDuration: animDuration,
          //               ),
          //             ),
          //           ],
          //         );
          //       })
          //     ]),

          Obx(
            () {
              if (controller.isLoading.value) {
                return Text("");
              } else
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: greenApple,
                      ),
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                          if (isPlaying) {
                            refreshState();
                          }
                        });
                      },
                    ),
                  ),
                );
            },
          )
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 25,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor.darken(80))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

// // value of the bar
//   List<BarChartGroupData> showingGroups() {
//     if (controller.uvDataList == null) {
//       return [];
//     }

//     return List.generate(10, (i) {
//       double uvValue = (controller.uvDataList[i + 3]['uv'])?.toDouble() ?? 1.0;
//       return makeGroupData(i + 3, uvValue, isTouched: i == touchedIndex);
//     });
//   }
  List<BarChartGroupData> showingGroups() {
    if (controller.uvDataList == null || controller.uvDataList.length < 13) {
      return [];
    }

    return List.generate(10, (i) {
      double uvValue = (controller.uvDataList[i + 3]['uv'])?.toDouble() ?? 1.0;
      return makeGroupData(i + 3, uvValue, isTouched: i == touchedIndex);
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      alignment: BarChartAlignment.spaceBetween,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          tooltipRoundedRadius: 8,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '',
              TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: regulerText17.copyWith(
                    color: widget.touchedBarColor,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    if (value.toInt() < controller.uvDataList.length) {
      DateTime parsedDate =
          DateTime.parse(controller.uvDataList[value.toInt()]['uv_time']);

      // convertion to wib
      DateTime wibDate = parsedDate.add(Duration(hours: 7));

      String formattedTime = DateFormat('HH:mm').format(wibDate);

      text =
          Text(formattedTime, style: regulerText14.copyWith(color: whiteSmoke));
    } else {
      text = Text('x', style: regulerText14.copyWith(color: whiteSmoke));
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget randomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    if (value.toInt() < controller.uvDataList.length) {
      DateTime parsedDate =
          DateTime.parse(controller.uvDataList[value.toInt()]['uv_time']);

      // convertion to wib
      DateTime wibDate = parsedDate.add(Duration(hours: 7));

      String formattedTime = DateFormat('HH:mm').format(wibDate);

      text = Text("", style: regulerText14.copyWith(color: whiteSmoke));
    } else {
      text = Text('x', style: regulerText14.copyWith(color: whiteSmoke));
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: randomTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(
        10,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(
                0,
                Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 1:
              return makeGroupData(
                1,
                Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 2:
              return makeGroupData(
                2,
                Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 3:
              return makeGroupData(
                3,
                Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 4:
              return makeGroupData(
                4,
                Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 5:
              return makeGroupData(
                5,
                Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 6:
              return makeGroupData(
                6,
                Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 7:
              return makeGroupData(
                7,
                Random().nextInt(15).toDouble() + 7,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 8:
              return makeGroupData(
                8,
                Random().nextInt(15).toDouble() + 8,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            case 9:
              return makeGroupData(
                9,
                Random().nextInt(15).toDouble() + 9,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)],
              );
            default:
              return throw Error();
          }
        },
      ),
      gridData: const FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
