class PollutionData {
  final Map<String, double> coord;
  final List<PollutionDetail> list;

  PollutionData({required this.coord, required this.list});

  factory PollutionData.fromJson(Map<String, dynamic> json) {
    return PollutionData(
      coord: {
        "lon": json['coord']['lon'].toDouble(),
        "lat": json['coord']['lat'].toDouble(),
      },
      list: (json['list'] as List)
          .map((data) => PollutionDetail.fromJson(data))
          .toList(),
    );
  }
}

class PollutionDetail {
  final double aqi;
  final PollutionComponents components;

  PollutionDetail({required this.aqi, required this.components});

  factory PollutionDetail.fromJson(Map<String, dynamic> json) {
    return PollutionDetail(
      aqi: json['main']['aqi'].toDouble(),
      components: PollutionComponents.fromJson(json['components']),
    );
  }
}

class PollutionComponents {
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final double pm10;
  final double nh3;

  PollutionComponents({
    required this.co,
    required this.no,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.nh3,
  });

  factory PollutionComponents.fromJson(Map<String, dynamic> json) {
    return PollutionComponents(
      co: json['co'].toDouble(),
      no: json['no'].toDouble(),
      no2: json['no2'].toDouble(),
      o3: json['o3'].toDouble(),
      so2: json['so2'].toDouble(),
      pm2_5: json['pm2_5'].toDouble(),
      pm10: json['pm10'].toDouble(),
      nh3: json['nh3'].toDouble(),
    );
  }
}
