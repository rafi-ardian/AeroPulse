import 'package:get/get.dart';

import '../models/city_model.dart';
import '../models/pollution_model.dart';

class CityProvider extends GetConnect {
  Future<City?> getLatLon(int lat, int lon) async {
    final response = await get(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=7fdc9cc5f50861283776b8dcbb402732');

    if (response.status.hasError) {
      print("gagal dapet data");
    }
    return City.fromJson(response.body);
  }

  Future<PollutionData?> getPollutionData(double lat, double lon) async {
    final response = await get(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=7fdc9cc5f50861283776b8dcbb402732');
    print("dibawah ini response body/data");
    print(response.body);

    if (response.status.hasError) {
      print("DATA GADAAAAAAAAAAAAAAAAAAAAAAA");
    }

    return PollutionData.fromJson(response.body);
  }
}
