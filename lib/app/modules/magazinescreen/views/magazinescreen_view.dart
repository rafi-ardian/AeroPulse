import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/magazinescreen_controller.dart';

class MagazinescreenView extends GetView<MagazinescreenController> {
  const MagazinescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MagazinescreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MagazinescreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
