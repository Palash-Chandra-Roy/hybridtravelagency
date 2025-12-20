import 'dart:convert';

CountriesResponse countriesResponseFromJson(String str) =>
    CountriesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String countriesResponseToJson(CountriesResponse data) =>
    json.encode(data.toJson());

class CountriesResponse {
  bool? success;
  String? message;
  List<CountryData>? data;

  CountriesResponse({this.success, this.message, this.data});

  CountriesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CountryData>[];
      json['data'].forEach((v) {
        data!.add(CountryData.fromJson(v));
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

class CountryData {
  int? countryId;
  String? countryName;

  CountryData({this.countryId, this.countryName});

  CountryData.fromJson(Map<String, dynamic> json) {
    countryId = json['countryId'];
    countryName = json['countryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryId'] = countryId;
    data['countryName'] = countryName;
    return data;
  }
}
