import 'package:get/get.dart';

import '../models/uv_data_model.dart';

class UvDataProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return UvData.fromJson(map);
      if (map is List) return map.map((item) => UvData.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<UvData?> getUvData(int id) async {
    final response = await get('uvdata/$id');
    return response.body;
  }

  Future<Response<UvData>> postUvData(UvData uvdata) async =>
      await post('uvdata', uvdata);
  Future<Response> deleteUvData(int id) async => await delete('uvdata/$id');
}
