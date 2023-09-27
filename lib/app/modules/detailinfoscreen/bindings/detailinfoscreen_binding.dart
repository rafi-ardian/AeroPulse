import 'package:get/get.dart';

import '../controllers/detailinfoscreen_controller.dart';

class DetailinfoscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailinfoscreenController>(
      () => DetailinfoscreenController(),
    );
  }
}
