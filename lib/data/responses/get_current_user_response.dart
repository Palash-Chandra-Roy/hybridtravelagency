import 'package:hybridtravelagency/data/responses/login_response.dart';

import 'dart:convert';

GetCurrentUserResponse getCurrentUserResponseFromJson(String str) =>
    GetCurrentUserResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getCurrentUserResponseToJson(GetCurrentUserResponse data) => json.encode(data.toJson());

class GetCurrentUserResponse {
  bool? success;
  User? data;

  GetCurrentUserResponse({this.success, this.data});

  GetCurrentUserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

