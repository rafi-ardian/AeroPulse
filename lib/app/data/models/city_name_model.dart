class CityName {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  CityName(
      {this.name,
      this.localNames,
      this.lat,
      this.lon,
      this.country,
      this.state});

  CityName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? LocalNames?.fromJson(json['local_names'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    if (localNames != null) {
      data['local_names'] = localNames?.toJson();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    data['state'] = state;
    return data;
  }
}

class LocalNames {
  String? ja;
  String? zh;
  String? id;

  LocalNames({this.ja, this.zh, this.id});

  LocalNames.fromJson(Map<String, dynamic> json) {
    ja = json['ja'];
    zh = json['zh'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ja'] = ja;
    data['zh'] = zh;
    data['id'] = id;
    return data;
  }
}
