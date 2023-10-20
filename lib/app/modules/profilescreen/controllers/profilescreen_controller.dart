import 'dart:convert';

import 'package:air_quality_apps/app/modules/home/controllers/home_controller.dart';
import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../themes.dart';
import '../../../data/models/city_name_model.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ProfilescreenController extends GetxController {
  RxDouble initLat = 0.0.obs;
  RxDouble initLon = 0.0.obs;
  RxDouble uv = 0.0.obs;
  RxString initCity = "".obs;
  RxString iconProfile = "".obs;
  RxInt skinTypeValue = 0.obs;
  RxBool isLoading = false.obs;

  var exposure = {}.obs;
  var showNewContainer = false.obs;
  final uvDataList = [].obs;

  ElTooltipController tooltipController = ElTooltipController();
  RxList<Map<String, dynamic>> exposureList = <Map<String, dynamic>>[].obs;

  void toggleContainer() {
    showNewContainer.value = !showNewContainer.value;
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Layanan lokasi tidak aktif");
      return Future.error("Layanan lokasi tidak aktif");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Izin lokasi ditolak");
        return Future.error("Izin lokasi ditolak");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Izin lokasi ditolak untuk selamanya");
      return Future.error("Izin lokasi ditolak untuk selamanya");
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<ImageProvider> getIcon(iconProfile) async {
    HomeController controllerHome = Get.find();

    iconProfile;
    {
      if (controllerHome.aqi.value == 1) {
        return AssetImage("assets/icons/happy.png");
      } else if (controllerHome.aqi.value >= 2 &&
          controllerHome.aqi.value <= 3) {
        return AssetImage("assets/icons/poker-face.png");
      } else if (controllerHome.aqi.value >= 4 &&
          controllerHome.aqi.value <= 5) {
        return AssetImage("assets/icons/sad.png");
      }
    }

    return await getIcon(iconProfile);
  }

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  _initializeData() async {
    try {
      Position position = await getCurrentLocation();
      fetchInitCityName(position.latitude, position.longitude);
      fetchUVData(position.latitude, position.longitude);
      fetchForecastUv(position.latitude, position.longitude);
      // fetchForecastUv(40.741895, -73.989308);
      // fetchUVData(40.741895, -73.989308);
      getIcon(iconProfile);
    } catch (e) {
      print('Error initializing data: $e');
    }
  }

  Future<void> fetchInitCityName(double initLat, double initLon) async {
    var url =
        "http://api.openweathermap.org/geo/1.0/reverse?lat=$initLat&lon=$initLon&limit=1&appid=7fdc9cc5f50861283776b8dcbb402732";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData != null && jsonData.length > 0) {
          var cityData = CityName.fromJson(jsonData[0]);
          initCity.value = cityData.name ?? "";
        }
      } else {
        print('Error with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching city name: $e');
    }
  }

  double get uvPercentage {
    return uv.value / 20;
  }

  fetchUVData(double lat, double lng) async {
    var url = 'https://api.openuv.io/api/v1/uv?lat=$lat&lng=$lng&alt=100&dt=';

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'x-access-token': 'openuv-29rlnctt0u4-io',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData != null) {
          var uvData = jsonData['result'];

          uv.value = (uvData['uv'])?.toDouble();
          exposure.value = uvData['safe_exposure_time'];
        }
      } else {
        print('Error with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching UV data: $e');
    }
  }

  fetchForecastUv(double lat, double lng) async {
    isLoading.value = true;

    var url =
        'https://api.openuv.io/api/v1/forecast?lat=$lat&lng=$lng&alt=100&dt=';

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'x-access-token': 'openuv-29rlnctt0u4-io',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData != null) {
          var uvData = jsonData['result'];

          // print(uvData[0]['uv_time']);
          // print(uvData[1]['uv_time']);
          // print(uvData[2]['uv_time']);

          uvDataList.value = jsonData['result'];
          print(uvDataList.length);

          // uv.value = uvData['uv_max'];
          // exposure.value = uvData['safe_exposure_time'];
        }
      } else {
        print('Error with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching forecast uv data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Color get progressColor {
    if (uv.value >= 0.0 && uv.value <= 3.0) {
      return greenApple;
    } else if (uv.value > 3.0 && uv.value <= 6.0) {
      return yellowWarning;
    } else if (uv.value > 6.0 && uv.value <= 8.0) {
      return redButtonColor;
    } else if (uv.value > 8.0 && uv.value <= 11.0) {
      return purple;
    } else {
      return purple;
    }
  }

  Color get skinColor {
    if (skinTypeValue.value == 1) {
      return skinType1;
    } else if (skinTypeValue.value == 2) {
      return skinType2;
    } else if (skinTypeValue.value == 3) {
      return skinType3;
    } else if (skinTypeValue.value == 4) {
      return skinType4;
    } else if (skinTypeValue.value == 5) {
      return skinType5;
    } else if (skinTypeValue.value == 6) {
      return skinType6;
    } else {
      return greyColor;
    }
  }

  String get skinTypeText {
    if (skinTypeValue.value == 1) {
      return "Skin type 1";
    } else if (skinTypeValue.value == 2) {
      return "Skin type 2";
    } else if (skinTypeValue.value == 3) {
      return "Skin type 3";
    } else if (skinTypeValue.value == 4) {
      return "Skin type 4";
    } else if (skinTypeValue.value == 5) {
      return "Skin type 5";
    } else if (skinTypeValue.value == 6) {
      return "Skin type 6";
    } else {
      return "< Select your skin type";
    }
  }

  String convertToHoursMinutes(int totalMinutes) {
    int hours = totalMinutes ~/ 60; // Integer division
    int minutes = totalMinutes % 60; // Remainder (modulo)
    return '${hours}h ${minutes}m';
  }

  dynamic get skinTime {
    int? timeInMinutes;
    switch (skinTypeValue.value) {
      case 1:
        timeInMinutes = exposure['st1'];
        break;
      case 2:
        timeInMinutes = exposure['st2'];
        break;
      case 3:
        timeInMinutes = exposure['st3'];
        break;
      case 4:
        timeInMinutes = exposure['st4'];
        break;
      case 5:
        timeInMinutes = exposure['st5'];
        break;
      case 6:
        timeInMinutes = exposure['st6'];
        break;
      default:
        return "";
    }

    if (timeInMinutes != null) {
      return convertToHoursMinutes(timeInMinutes);
    } else {
      return "no data";
    }
  }
}
