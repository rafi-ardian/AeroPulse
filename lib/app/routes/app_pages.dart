import 'package:get/get.dart';

import '../modules/detailinfoscreen/bindings/detailinfoscreen_binding.dart';
import '../modules/detailinfoscreen/views/detailinfoscreen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/magazinescreen/bindings/magazinescreen_binding.dart';
import '../modules/magazinescreen/views/magazinescreen_view.dart';
import '../modules/mainscreen/bindings/mainscreen_binding.dart';
import '../modules/mainscreen/views/mainscreen_view.dart';
import '../modules/profilescreen/bindings/profilescreen_binding.dart';
import '../modules/profilescreen/views/profilescreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAINSCREEN,
      page: () => MainscreenView(),
      binding: MainscreenBinding(),
    ),
    GetPage(
      name: _Paths.MAGAZINESCREEN,
      page: () => const MagazinescreenView(),
      binding: MagazinescreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILESCREEN,
      page: () => ProfilescreenView(),
      binding: ProfilescreenBinding(),
    ),
    GetPage(
      name: _Paths.DETAILINFOSCREEN,
      page: () => DetailinfoscreenView(),
      binding: DetailinfoscreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}
