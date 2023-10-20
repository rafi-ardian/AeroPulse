class UvData {
  double? uv;
  String? uvTime;
  double? uvMax;
  String? uvMaxTime;
  double? ozone;
  String? ozoneTime;
  SafeExposureTime? safeExposureTime;
  SunInfo? sunInfo;

  UvData(
      {this.uv,
      this.uvTime,
      this.uvMax,
      this.uvMaxTime,
      this.ozone,
      this.ozoneTime,
      this.safeExposureTime,
      this.sunInfo});

  UvData.fromJson(Map<String, dynamic> json) {
    uv = json['uv'];
    uvTime = json['uv_time'];
    uvMax = json['uv_max'];
    uvMaxTime = json['uv_max_time'];
    ozone = json['ozone'];
    ozoneTime = json['ozone_time'];
    safeExposureTime = json['safe_exposure_time'] != null
        ? SafeExposureTime?.fromJson(json['safe_exposure_time'])
        : null;
    sunInfo =
        json['sun_info'] != null ? SunInfo?.fromJson(json['sun_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uv'] = uv;
    data['uv_time'] = uvTime;
    data['uv_max'] = uvMax;
    data['uv_max_time'] = uvMaxTime;
    data['ozone'] = ozone;
    data['ozone_time'] = ozoneTime;
    if (safeExposureTime != null) {
      data['safe_exposure_time'] = safeExposureTime?.toJson();
    }
    if (sunInfo != null) {
      data['sun_info'] = sunInfo?.toJson();
    }
    return data;
  }
}

class SafeExposureTime {
  int? st1;
  int? st2;
  int? st3;
  int? st4;
  int? st5;
  int? st6;

  SafeExposureTime(
      {this.st1, this.st2, this.st3, this.st4, this.st5, this.st6});

  SafeExposureTime.fromJson(Map<String, dynamic> json) {
    st1 = json['st1'];
    st2 = json['st2'];
    st3 = json['st3'];
    st4 = json['st4'];
    st5 = json['st5'];
    st6 = json['st6'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['st1'] = st1;
    data['st2'] = st2;
    data['st3'] = st3;
    data['st4'] = st4;
    data['st5'] = st5;
    data['st6'] = st6;
    return data;
  }
}

class SunInfo {
  SunTimes? sunTimes;
  SunPosition? sunPosition;

  SunInfo({this.sunTimes, this.sunPosition});

  SunInfo.fromJson(Map<String, dynamic> json) {
    sunTimes = json['sun_times'] != null
        ? SunTimes?.fromJson(json['sun_times'])
        : null;
    sunPosition = json['sun_position'] != null
        ? SunPosition?.fromJson(json['sun_position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (sunTimes != null) {
      data['sun_times'] = sunTimes?.toJson();
    }
    if (sunPosition != null) {
      data['sun_position'] = sunPosition?.toJson();
    }
    return data;
  }
}

class SunTimes {
  String? solarNoon;
  String? nadir;
  String? sunrise;
  String? sunset;
  String? sunriseEnd;
  String? sunsetStart;
  String? dawn;
  String? dusk;
  String? nauticalDawn;
  String? nauticalDusk;
  String? nightEnd;
  String? night;
  String? goldenHourEnd;
  String? goldenHour;

  SunTimes(
      {this.solarNoon,
      this.nadir,
      this.sunrise,
      this.sunset,
      this.sunriseEnd,
      this.sunsetStart,
      this.dawn,
      this.dusk,
      this.nauticalDawn,
      this.nauticalDusk,
      this.nightEnd,
      this.night,
      this.goldenHourEnd,
      this.goldenHour});

  SunTimes.fromJson(Map<String, dynamic> json) {
    solarNoon = json['solarNoon'];
    nadir = json['nadir'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    sunriseEnd = json['sunriseEnd'];
    sunsetStart = json['sunsetStart'];
    dawn = json['dawn'];
    dusk = json['dusk'];
    nauticalDawn = json['nauticalDawn'];
    nauticalDusk = json['nauticalDusk'];
    nightEnd = json['nightEnd'];
    night = json['night'];
    goldenHourEnd = json['goldenHourEnd'];
    goldenHour = json['goldenHour'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['solarNoon'] = solarNoon;
    data['nadir'] = nadir;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['sunriseEnd'] = sunriseEnd;
    data['sunsetStart'] = sunsetStart;
    data['dawn'] = dawn;
    data['dusk'] = dusk;
    data['nauticalDawn'] = nauticalDawn;
    data['nauticalDusk'] = nauticalDusk;
    data['nightEnd'] = nightEnd;
    data['night'] = night;
    data['goldenHourEnd'] = goldenHourEnd;
    data['goldenHour'] = goldenHour;
    return data;
  }
}

class SunPosition {
  double? azimuth;
  double? altitude;

  SunPosition({this.azimuth, this.altitude});

  SunPosition.fromJson(Map<String, dynamic> json) {
    azimuth = json['azimuth'];
    altitude = json['altitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['azimuth'] = azimuth;
    data['altitude'] = altitude;
    return data;
  }
}
