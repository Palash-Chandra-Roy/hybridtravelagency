import 'dart:convert';

AirportsResponse airportsResponseFromJson(String str) =>
    AirportsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String airportsResponseToJson(AirportsResponse data) =>
    json.encode(data.toJson());

class AirportsResponse {
  bool? success;
  String? message;
  List<AirportData>? data;

  AirportsResponse({this.success, this.message, this.data});

  AirportsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AirportData>[];
      json['data'].forEach((v) {
        data!.add(AirportData.fromJson(v));
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

class AirportData {
  String? name;
  String? code;
  String? countryCode;
  String? countryName;

  AirportData({this.name, this.code, this.countryCode, this.countryName});

  AirportData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['countryCode'] = countryCode;
    data['countryName'] = countryName;
    return data;
  }
}
