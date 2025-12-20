import 'dart:convert';

GetUserVisaApplicationsResponse getUserVisaApplicationsResponseFromJson(String str) =>
    GetUserVisaApplicationsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getUserVisaApplicationsResponseToJson(GetUserVisaApplicationsResponse data) => json.encode(data.toJson());

class GetUserVisaApplicationsResponse {
  bool? success;
  String? message;
  List<VisaApplicationData>? data;

  GetUserVisaApplicationsResponse({this.success, this.message, this.data});

  GetUserVisaApplicationsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <VisaApplicationData>[];
      json['data'].forEach((v) {
        data!.add(VisaApplicationData.fromJson(v));
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

class VisaApplicationData {
  int? id;
  String? firstName;
  String? lastName;
  int? visaTypeId;
  String? visaCountry;
  String? phoneNo;
  String? email;
  String? nationality;
  String? permanentAddress;
  String? profession;
  String? passportNo;
  String? passportExpiry;
  String? purposeOfTravel;
  String? travelDate;
  String? picture;
  String? passportPicture;
  String? status;
  String? visaAmount;
  String? visaEntryType;
  String? visaServiceName;
  String? visaTypeName;
  int? userId;
  String? approvedVisa;
  String? createdAt;
  String? updatedAt;
  String? hotel;
  String? ticket;
  int? paymentStatus;
  String? transactionNo;
  String? currency;
  int? isPaid;

  VisaApplicationData(
      {this.id,
        this.firstName,
        this.lastName,
        this.visaTypeId,
        this.visaCountry,
        this.phoneNo,
        this.email,
        this.nationality,
        this.permanentAddress,
        this.profession,
        this.passportNo,
        this.passportExpiry,
        this.purposeOfTravel,
        this.travelDate,
        this.picture,
        this.passportPicture,
        this.status,
        this.visaAmount,
        this.visaEntryType,
        this.visaServiceName,
        this.visaTypeName,
        this.userId,
        this.approvedVisa,
        this.createdAt,
        this.updatedAt,
        this.hotel,
        this.ticket,
        this.paymentStatus,
        this.transactionNo,
        this.currency,
        this.isPaid});

  VisaApplicationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    visaTypeId = json['visa_type_id'];
    visaCountry = json['visa_country'];
    phoneNo = json['phone_no'];
    email = json['email'];
    nationality = json['nationality'];
    permanentAddress = json['permanent_address'];
    profession = json['profession'];
    passportNo = json['passport_no'];
    passportExpiry = json['passport_expiry'];
    purposeOfTravel = json['purpose_of_travel'];
    travelDate = json['travel_date'];
    picture = json['picture'];
    passportPicture = json['passport_picture'];
    status = json['status'];
    visaAmount = json['visa_amount'];
    visaEntryType = json['visa_entry_type'];
    visaServiceName = json['visa_service_name'];
    visaTypeName = json['visa_type_name'];
    userId = json['user_id'];
    approvedVisa = json['approved_visa'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hotel = json['hotel'];
    ticket = json['ticket'];
    paymentStatus = json['payment_status'];
    transactionNo = json['transaction_no'];
    currency = json['currency'];
    isPaid = json['is_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['visa_type_id'] = visaTypeId;
    data['visa_country'] = visaCountry;
    data['phone_no'] = phoneNo;
    data['email'] = email;
    data['nationality'] = nationality;
    data['permanent_address'] = permanentAddress;
    data['profession'] = profession;
    data['passport_no'] = passportNo;
    data['passport_expiry'] = passportExpiry;
    data['purpose_of_travel'] = purposeOfTravel;
    data['travel_date'] = travelDate;
    data['picture'] = picture;
    data['passport_picture'] = passportPicture;
    data['status'] = status;
    data['visa_amount'] = visaAmount;
    data['visa_entry_type'] = visaEntryType;
    data['visa_service_name'] = visaServiceName;
    data['visa_type_name'] = visaTypeName;
    data['user_id'] = userId;
    data['approved_visa'] = approvedVisa;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['hotel'] = hotel;
    data['ticket'] = ticket;
    data['payment_status'] = paymentStatus;
    data['transaction_no'] = transactionNo;
    data['currency'] = currency;
    data['is_paid'] = isPaid;
    return data;
  }
}
