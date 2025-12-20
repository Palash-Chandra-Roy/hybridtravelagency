import 'dart:convert';

GetHotelTypesResponse getHotelTypesResponseFromJson(String str) =>
    GetHotelTypesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getHotelTypesResponseToJson(GetHotelTypesResponse data) => json.encode(data.toJson());


class GetHotelTypesResponse {
  bool? success;
  String? message;
  List<HotelType>? data;

  GetHotelTypesResponse({this.success, this.message, this.data});

  GetHotelTypesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HotelType>[];
      json['data'].forEach((v) {
        data!.add(HotelType.fromJson(v));
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

class HotelType {
  int? id;
  String? name;

  HotelType({this.id, this.name});

  HotelType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
