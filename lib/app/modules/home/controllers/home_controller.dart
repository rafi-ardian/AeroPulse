import 'dart:convert';
import 'dart:ffi';

import 'package:air_quality_apps/app/data/models/city_name_model.dart';
import 'package:air_quality_apps/themes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../data/models/city_model.dart';
import '../../../data/models/pollution_model.dart';
import '../../../data/providers/city_provider.dart';
import 'package:http/http.dart' as http;

class Country {
  final String name;

  Country({required this.name});

  @override
  String toString() => name;
}

class HomeController extends GetxController {
  var bottomNavIndex = 0.obs;
  RxString city = "".obs;
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;

  RxDouble percentVertical = 0.0.obs;
  RxBool isExtended = true.obs;
  var aqi = 0.0.obs;
  var components = {}.obs;

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  double get aqiPercentage {
    return aqi.value / 5;
  }

  Future<void> fetchAirPollutionData(double lat, double lon) async {
    var url =
        "http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=$lat&lon=$lon&appid=7fdc9cc5f50861283776b8dcbb402732";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Jika respons berhasil
        var jsonData = jsonDecode(response.body);

        if (jsonData != null &&
            jsonData["list"] != null &&
            jsonData["list"].length > 0) {
          aqi.value = (jsonData["list"][0]["main"]["aqi"]).toDouble();

          components.value = jsonData["list"][0]["components"];
        }
      } else {
        print('Error with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching air pollution data: $e');
    }
  }

  Future<void> fetchCityName(double lat, double lon) async {
    var url =
        "http://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&limit=1&appid=7fdc9cc5f50861283776b8dcbb402732";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData != null && jsonData.length > 0) {
          var cityData = CityName.fromJson(jsonData[0]);
          city.value = cityData.name ?? "";
        }
      } else {
        print('Error with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching city name: $e');
    }
  }

  Color get progressColor {
    if (aqi.value == 1) {
      return greenApple;
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return yellowWarning;
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return redButtonColor;
    } else {
      return Colors.grey;
    }
  }

// text desc change on detail screen
  String? get healthDesc {
    if (aqi.value == 1) {
      return "good";
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return "moderate";
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return "unhealthy";
    }
  }

// text desc change on detail screen
  String? get textDesc1 {
    if (aqi.value == 1) {
      return "Enjoy the fresh air outside!";
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return "Limit prolonged outdoor activities!";
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return "wear a mask if go outside!";
    }
  }

  String? get textDesc2 {
    if (aqi.value == 1) {
      return "Perfect day for outdoor activities!";
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return "Keep windows closed during peak hours!";
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return "Do not ventilate!";
    }
  }

  String? get textDesc3 {
    if (aqi.value == 1) {
      return "No need for air purifiers today.";
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return "Consider using an air purifier inside.";
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return "Make sure your air purifier is on";
    }
  }

// Icon change on detail screen
  ImageProvider? get iconDesc1 {
    if (aqi.value == 1) {
      return AssetImage("assets/icons/fresh-air.png");
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return AssetImage("assets/icons/limit.png");
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return AssetImage("assets/icons/face-mask.png");
    }
  }

  ImageProvider? get iconDesc2 {
    if (aqi.value == 1) {
      return AssetImage("assets/icons/outdoor.png");
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return AssetImage("assets/icons/window-closed.png");
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return AssetImage("assets/icons/window-closed.png");
    }
  }

  ImageProvider? get iconDesc3 {
    if (aqi.value == 1) {
      return AssetImage("assets/icons/no-air-purifier.png");
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return AssetImage("assets/icons/air-purifier.png");
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return AssetImage("assets/icons/air-purifier.png");
    }
  }

// icon change to profile screen
  ImageProvider? get iconProfile {
    if (aqi.value == 1) {
      return AssetImage("assets/icons/happy.png");
    } else if (aqi.value >= 2 && aqi.value <= 3) {
      return AssetImage("assets/icons/poker-face.png");
    } else if (aqi.value >= 4 && aqi.value <= 5) {
      return AssetImage("assets/icons/sad.png");
    }
  }
}
