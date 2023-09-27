import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profilescreen_controller.dart';

class ProfilescreenView extends GetView<ProfilescreenController> {
  const ProfilescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilescreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilescreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
