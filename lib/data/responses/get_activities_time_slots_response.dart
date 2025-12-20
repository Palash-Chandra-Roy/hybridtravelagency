import 'dart:convert';

GetActivitiesTimeSlotsResponse getActivitiesTimeSlotsResponseFromJson(String str) =>
    GetActivitiesTimeSlotsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getActivitiesTimeSlotsResponseToJson(GetActivitiesTimeSlotsResponse data) => json.encode(data.toJson());

class GetActivitiesTimeSlotsResponse {
  bool? success;
  String? message;
  Data? data;

  GetActivitiesTimeSlotsResponse({this.success, this.message, this.data});

  GetActivitiesTimeSlotsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? statuscode;
  Null error;
  String? currency;
  String? currencysymbol;
  String? errormessage;
  int? count;
  Null sessionId;
  List<TimeSlot>? result;

  Data(
      {this.statuscode,
        this.error,
        this.currency,
        this.currencysymbol,
        this.errormessage,
        this.count,
        this.sessionId,
        this.result});

  Data.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    error = json['error'];
    currency = json['currency'];
    currencysymbol = json['currencysymbol'];
    errormessage = json['errormessage'];
    count = json['count'];
    sessionId = json['sessionId'];
    if (json['result'] != null) {
      result = <TimeSlot>[];
      json['result'].forEach((v) {
        result!.add(TimeSlot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statuscode'] = statuscode;
    data['error'] = error;
    data['currency'] = currency;
    data['currencysymbol'] = currencysymbol;
    data['errormessage'] = errormessage;
    data['count'] = count;
    data['sessionId'] = sessionId;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeSlot {
  int? tourOptionId;
  String? timeSlotId;
  String? timeSlot;
  int? available;
  int? adultPrice;
  int? childPrice;
  bool? isDynamicPrice;

  TimeSlot(
      {this.tourOptionId,
        this.timeSlotId,
        this.timeSlot,
        this.available,
        this.adultPrice,
        this.childPrice,
        this.isDynamicPrice});

  TimeSlot.fromJson(Map<String, dynamic> json) {
    tourOptionId = json['tourOptionId'];
    timeSlotId = json['timeSlotId'];
    timeSlot = json['timeSlot'];
    available = json['available'];
    adultPrice = json['adultPrice'];
    childPrice = json['childPrice'];
    isDynamicPrice = json['isDynamicPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tourOptionId'] = tourOptionId;
    data['timeSlotId'] = timeSlotId;
    data['timeSlot'] = timeSlot;
    data['available'] = available;
    data['adultPrice'] = adultPrice;
    data['childPrice'] = childPrice;
    data['isDynamicPrice'] = isDynamicPrice;
    return data;
  }
}
