import 'package:get/get.dart';

class MainscreenController extends GetxController {
  var tabIndex = 1.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
