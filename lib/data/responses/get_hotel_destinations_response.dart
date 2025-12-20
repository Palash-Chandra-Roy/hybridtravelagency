import 'dart:convert';

List<GetHotelDestinationsResponse> getHotelDestinationsResponseFromJson(String str) =>
    List<GetHotelDestinationsResponse>.from(
      json.decode(str).map((x) => GetHotelDestinationsResponse.fromJson(x)),
    );

String getHotelDestinationsResponseToJson(List<GetHotelDestinationsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetHotelDestinationsResponse {
  String? id;
  String? text;

  GetHotelDestinationsResponse({this.id, this.text});

  GetHotelDestinationsResponse.fromJson(Map<String, dynamic> json) {
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
