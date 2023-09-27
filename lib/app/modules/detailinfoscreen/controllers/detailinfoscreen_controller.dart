import 'dart:convert';
import 'package:air_quality_apps/app/data/models/city_name_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class DetailinfoscreenController extends GetxController {
  RxDouble percentVertical = 0.0.obs;
  RxBool isExtended = true.obs;
}
