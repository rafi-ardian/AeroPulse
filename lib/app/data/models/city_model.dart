class City {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String state;
  final Map<String, String> localNames;

  City({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
    required this.localNames,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] ?? '',
      lat: json['lat'] ?? 0.0,
      lon: json['lon'] ?? 0.0,
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      localNames: Map<String, String>.from(json['local_names'] ?? {}),
    );
  }

  static List<City> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => City.fromJson(json)).toList();
  }

  @override
  String toString() => name;
}
