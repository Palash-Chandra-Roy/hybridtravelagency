import 'dart:convert';

GetHotelFacilitiesResponse getHotelFacilitiesResponseFromJson(String str) =>
    GetHotelFacilitiesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getHotelFacilitiesResponseToJson(GetHotelFacilitiesResponse data) => json.encode(data.toJson());


class GetHotelFacilitiesResponse {
  bool? success;
  String? message;
  List<HotelFacility>? data;

  GetHotelFacilitiesResponse({this.success, this.message, this.data});

  GetHotelFacilitiesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HotelFacility>[];
      json['data'].forEach((v) {
        data!.add(HotelFacility.fromJson(v));
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

class HotelFacility {
  int? facilityId;
  String? name;

  HotelFacility({this.facilityId, this.name});

  HotelFacility.fromJson(Map<String, dynamic> json) {
    facilityId = json['facility_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facility_id'] = facilityId;
    data['name'] = name;
    return data;
  }
}
