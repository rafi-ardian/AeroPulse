import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../../themes.dart';

class ComponentIndicator extends StatelessWidget {
  ComponentIndicator({
    super.key,
    required this.titleTest,
    required this.valueTest,
  });

  final String titleTest;
  double valueTest;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FittedBox(
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: whiteOne, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Text(
                  titleTest,
                  style: semiBoldText20,
                ),
                SizedBox(width: 5),
                ProgressBar(
                  value: valueTest,
                  //specify only one: color or gradient
                  // color: Colors.red,
                  height: 15,
                  width: Get.width / 3.5,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  gradient: LinearGradient(
                    colors: [
                      greenApple,
                      yellowColor,
                      redColor,
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
