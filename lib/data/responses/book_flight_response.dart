import 'dart:convert';

BookFlightResponse bookFlightResponseFromJson(String str) =>
    BookFlightResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String bookFlightResponseToJson(BookFlightResponse data) =>
    json.encode(data.toJson());

class BookFlightResponse {
  bool? success;
  String? paymentGateway;
  String? sessionId;
  String? paymentLink;

  BookFlightResponse(
      {this.success, this.paymentGateway, this.sessionId, this.paymentLink});

  BookFlightResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    paymentGateway = json['paymentGateway'];
    sessionId = json['sessionId'];
    paymentLink = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['paymentGateway'] = paymentGateway;
    data['sessionId'] = sessionId;
    data['payment_link'] = paymentLink;
    return data;
  }
}
