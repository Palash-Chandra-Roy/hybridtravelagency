import 'dart:convert';

GetHolidayCountriesResponse getHolidayCountriesResponseFromJson(String str) =>
    GetHolidayCountriesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getHolidayCountriesResponseToJson(GetHolidayCountriesResponse data) => json.encode(data.toJson());

class GetHolidayCountriesResponse {
  bool? success;
  String? message;
  List<String>? data;

  GetHolidayCountriesResponse({this.success, this.message, this.data});

  GetHolidayCountriesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
