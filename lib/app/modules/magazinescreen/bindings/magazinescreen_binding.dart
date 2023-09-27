import 'package:get/get.dart';

import '../controllers/magazinescreen_controller.dart';

class MagazinescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MagazinescreenController>(
      () => MagazinescreenController(),
    );
  }
}
