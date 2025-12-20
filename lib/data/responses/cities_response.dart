import 'dart:convert';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String citiesResponseToJson(CitiesResponse data) =>
    json.encode(data.toJson());

class CitiesResponse {
  bool? success;
  String? message;
  List<CityData>? data;

  CitiesResponse({this.success, this.message, this.data});

  CitiesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(CityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityData {
  String? cityName;
  int? cityId;

  CityData({this.cityName, this.cityId});

  CityData.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cityName'] = cityName;
    data['cityId'] = cityId;
    return data;
  }
}
