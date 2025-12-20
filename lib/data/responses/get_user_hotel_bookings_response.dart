import 'dart:convert';

GetUserHotelBookingsResponse getUserHotelBookingsResponseFromJson(String str) =>
    GetUserHotelBookingsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getUserHotelBookingsResponseToJson(GetUserHotelBookingsResponse data) => json.encode(data.toJson());

class GetUserHotelBookingsResponse {
  bool? success;
  String? message;
  List<HotelBookingData>? data;

  GetUserHotelBookingsResponse({this.success, this.message, this.data});

  GetUserHotelBookingsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HotelBookingData>[];
      json['data'].forEach((v) {
        data!.add(HotelBookingData.fromJson(v));
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

class HotelBookingData {
  int? id;
  String? bookingId;
  String? clientReference;
  String? supplierBookingId;
  String? supplierBookingName;
  String? supplier;
  int? supplierId;
  String? status;
  String? hotelConfirmationCode;
  String? checkin;
  String? checkout;
  String? hotelId;
  String? hotelName;
  String? roomTypeName;
  int? adults;
  int? children;
  String? rateAmount;
  String? rateCurrency;
  String? cancellationAmount;
  String? cancelTime;
  String? refundableTag;
  String? holderFirstName;
  String? holderLastName;
  String? holderEmail;
  String? holderPhone;
  String? price;
  String? commission;
  String? currency;
  String? remarks;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? cancelledAt;
  String? cancelledFee;
  String? cancelledRefund;
  String? cancelledCurrency;

  HotelBookingData(
      {this.id,
        this.bookingId,
        this.clientReference,
        this.supplierBookingId,
        this.supplierBookingName,
        this.supplier,
        this.supplierId,
        this.status,
        this.hotelConfirmationCode,
        this.checkin,
        this.checkout,
        this.hotelId,
        this.hotelName,
        this.roomTypeName,
        this.adults,
        this.children,
        this.rateAmount,
        this.rateCurrency,
        this.cancellationAmount,
        this.cancelTime,
        this.refundableTag,
        this.holderFirstName,
        this.holderLastName,
        this.holderEmail,
        this.holderPhone,
        this.price,
        this.commission,
        this.currency,
        this.remarks,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.cancelledAt,
        this.cancelledFee,
        this.cancelledRefund,
        this.cancelledCurrency});

  HotelBookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    clientReference = json['client_reference'];
    supplierBookingId = json['supplier_booking_id'];
    supplierBookingName = json['supplier_booking_name'];
    supplier = json['supplier'];
    supplierId = json['supplier_id'];
    status = json['status'];
    hotelConfirmationCode = json['hotel_confirmation_code'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    hotelId = json['hotel_id'];
    hotelName = json['hotel_name'];
    roomTypeName = json['room_type_name'];
    adults = json['adults'];
    children = json['children'];
    rateAmount = json['rate_amount'];
    rateCurrency = json['rate_currency'];
    cancellationAmount = json['cancellation_amount'];
    cancelTime = json['cancel_time'];
    refundableTag = json['refundable_tag'];
    holderFirstName = json['holder_first_name'];
    holderLastName = json['holder_last_name'];
    holderEmail = json['holder_email'];
    holderPhone = json['holder_phone'];
    price = json['price'];
    commission = json['commission'];
    currency = json['currency'];
    remarks = json['remarks'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cancelledAt = json['cancelled_at'];
    cancelledFee = json['cancelled_fee'];
    cancelledRefund = json['cancelled_refund'];
    cancelledCurrency = json['cancelled_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['client_reference'] = clientReference;
    data['supplier_booking_id'] = supplierBookingId;
    data['supplier_booking_name'] = supplierBookingName;
    data['supplier'] = supplier;
    data['supplier_id'] = supplierId;
    data['status'] = status;
    data['hotel_confirmation_code'] = hotelConfirmationCode;
    data['checkin'] = checkin;
    data['checkout'] = checkout;
    data['hotel_id'] = hotelId;
    data['hotel_name'] = hotelName;
    data['room_type_name'] = roomTypeName;
    data['adults'] = adults;
    data['children'] = children;
    data['rate_amount'] = rateAmount;
    data['rate_currency'] = rateCurrency;
    data['cancellation_amount'] = cancellationAmount;
    data['cancel_time'] = cancelTime;
    data['refundable_tag'] = refundableTag;
    data['holder_first_name'] = holderFirstName;
    data['holder_last_name'] = holderLastName;
    data['holder_email'] = holderEmail;
    data['holder_phone'] = holderPhone;
    data['price'] = price;
    data['commission'] = commission;
    data['currency'] = currency;
    data['remarks'] = remarks;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cancelled_at'] = cancelledAt;
    data['cancelled_fee'] = cancelledFee;
    data['cancelled_refund'] = cancelledRefund;
    data['cancelled_currency'] = cancelledCurrency;
    return data;
  }
}
