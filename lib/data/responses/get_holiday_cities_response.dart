import 'dart:convert';

GetHolidayCitiesResponse getHolidayCitiesResponseFromJson(String str) =>
    GetHolidayCitiesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getHolidayCitiesResponseToJson(GetHolidayCitiesResponse data) => json.encode(data.toJson());

class GetHolidayCitiesResponse {
  bool? success;
  String? message;
  List<String>? data;

  GetHolidayCitiesResponse({this.success, this.message, this.data});

  GetHolidayCitiesResponse.fromJson(Map<String, dynamic> json) {
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
