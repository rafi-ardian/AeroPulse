import 'package:flutter/material.dart';

import '../../../../themes.dart';

class Components extends StatelessWidget {
  String componentsLabel;

  String componentsValue;

  Components({
    required this.componentsLabel,
    required this.componentsValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(componentsLabel, style: boldText25.copyWith(color: blackColor)),
        Text(
          componentsValue,
          style: semiBoldText13,
        ),
      ],
    );
  }
}
