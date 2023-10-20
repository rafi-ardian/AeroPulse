import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MagazinescreenController extends GetxController {
  RxString title = "".obs;
  RxString imageUrl = "".obs;
  RxString linkUrl = "".obs;
  RxList<Map<String, dynamic>> newsList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNewsData();
  }

  fetchNewsData() async {
    try {
      var url =
          "http://api.mediastack.com/v1/news?access_key=55a962ae648fc63d75240c8563dc3334&categories=health";

      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Jika respons berhasil
        var jsonData = jsonDecode(response.body);

        // print(jsonData);
        if (jsonData != null && jsonData["data"] != null) {
          newsList.assignAll(
              (jsonData["data"] as List).cast<Map<String, dynamic>>());
        }
      } else {
        print('Error with status code: ${response.statusCode}');
        // }
      }
    } catch (e) {
      print('Error initializing data: $e');
    }
  }
}
