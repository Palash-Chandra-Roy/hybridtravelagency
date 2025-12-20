import 'dart:convert';

CurrenciesResponse currenciesResponseFromJson(String str) =>
    CurrenciesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String currenciesResponseToJson(CurrenciesResponse data) =>
    json.encode(data.toJson());

class CurrenciesResponse {
  bool? success;
  String? message;
  List<CurrencyData>? data;

  CurrenciesResponse({this.success, this.message, this.data});

  CurrenciesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CurrencyData>[];
      json['data'].forEach((v) {
        data!.add(CurrencyData.fromJson(v));
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

class CurrencyData {
  String? id;
  String? text;

  CurrencyData({this.id, this.text});

  CurrencyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}
