import 'dart:convert';

GetUserFlightBookingsResponse getUserFlightBookingsResponseFromJson(String str) =>
    GetUserFlightBookingsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getUserFlightBookingsResponseToJson(GetUserFlightBookingsResponse data) => json.encode(data.toJson());

class GetUserFlightBookingsResponse {
  bool? success;
  String? message;
  List<FlightBookingData>? data;

  GetUserFlightBookingsResponse({this.success, this.message, this.data});

  GetUserFlightBookingsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FlightBookingData>[];
      json['data'].forEach((v) {
        data!.add(FlightBookingData.fromJson(v));
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

class FlightBookingData {
  int? id;
  int? userId;
  String? tripeId;
  String? airlinePnr;
  int? noOfAdults;
  int? noOfChilds;
  int? noOfInfants;
  String? classType;
  String? currency;
  String? tripType;
  String? origin;
  String? destination;
  int? sellRequestId;
  String? destinationDate;
  String? arrivalDate;
  int? isPaid;
  int? status;
  int? paymentStatus;
  String? transactionNo;
  String? description;
  String? createdAt;
  String? updatedAt;
  User? user;

  FlightBookingData(
      {this.id,
        this.userId,
        this.tripeId,
        this.airlinePnr,
        this.noOfAdults,
        this.noOfChilds,
        this.noOfInfants,
        this.classType,
        this.currency,
        this.tripType,
        this.origin,
        this.destination,
        this.sellRequestId,
        this.destinationDate,
        this.arrivalDate,
        this.isPaid,
        this.status,
        this.paymentStatus,
        this.transactionNo,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.user});

  FlightBookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tripeId = json['tripe_id'];
    airlinePnr = json['airline_pnr'];
    noOfAdults = json['NoOfAdults'];
    noOfChilds = json['NoOfChilds'];
    noOfInfants = json['NoOfInfants'];
    classType = json['ClassType'];
    currency = json['Currency'];
    tripType = json['TripType'];
    origin = json['Origin'];
    destination = json['Destination'];
    sellRequestId = json['sellRequestId'];
    destinationDate = json['DestinationDate'];
    arrivalDate = json['arrivalDate'];
    isPaid = json['is_paid'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    transactionNo = json['transaction_no'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tripe_id'] = tripeId;
    data['airline_pnr'] = airlinePnr;
    data['NoOfAdults'] = noOfAdults;
    data['NoOfChilds'] = noOfChilds;
    data['NoOfInfants'] = noOfInfants;
    data['ClassType'] = classType;
    data['Currency'] = currency;
    data['TripType'] = tripType;
    data['Origin'] = origin;
    data['Destination'] = destination;
    data['sellRequestId'] = sellRequestId;
    data['DestinationDate'] = destinationDate;
    data['arrivalDate'] = arrivalDate;
    data['is_paid'] = isPaid;
    data['status'] = status;
    data['payment_status'] = paymentStatus;
    data['transaction_no'] = transactionNo;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? referredBy;
  int? isReferralRewarded;
  String? name;
  String? email;
  String? salutation;
  String? age;
  int? userId;
  String? company;
  String? panNumber;
  String? panName;
  String? address;
  String? country;
  String? state;
  String? city;
  String? pinCode;
  String? mobile;
  String? phone;
  String? companyLogo;
  String? bankAccountName;
  String? bankAccountNumber;
  String? bankIfscCode;
  String? emailVerificationToken;
  String? emailVerificationStatus;
  String? emailVerifiedAt;
  String? passwordReset;
  int? passwordStatus;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? adminapprovel;
  String? avatar;
  int? isGoogleAccount;
  int? agentId;
  double? agentPercentage;
  String? currency;
  String? referralCode;
  String? fcmToken;

  User(
      {this.id,
        this.referredBy,
        this.isReferralRewarded,
        this.name,
        this.email,
        this.salutation,
        this.age,
        this.userId,
        this.company,
        this.panNumber,
        this.panName,
        this.address,
        this.country,
        this.state,
        this.city,
        this.pinCode,
        this.mobile,
        this.phone,
        this.companyLogo,
        this.bankAccountName,
        this.bankAccountNumber,
        this.bankIfscCode,
        this.emailVerificationToken,
        this.emailVerificationStatus,
        this.emailVerifiedAt,
        this.passwordReset,
        this.passwordStatus,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.adminapprovel,
        this.avatar,
        this.isGoogleAccount,
        this.agentId,
        this.agentPercentage,
        this.currency,
        this.referralCode,
        this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referredBy = json['referred_by'];
    isReferralRewarded = json['is_referral_rewarded'];
    name = json['name'];
    email = json['email'];
    salutation = json['salutation'];
    age = json['age'];
    userId = json['user_id'];
    company = json['company'];
    panNumber = json['pan_number'];
    panName = json['pan_name'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pinCode = json['pin_code'];
    mobile = json['mobile'];
    phone = json['phone'];
    companyLogo = json['company_logo'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    bankIfscCode = json['bank_ifsc_code'];
    emailVerificationToken = json['email_verification_token'];
    emailVerificationStatus = json['email_verification_status'];
    emailVerifiedAt = json['email_verified_at'];
    passwordReset = json['password_reset'];
    passwordStatus = json['password_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    adminapprovel = json['adminapprovel'];
    avatar = json['avatar'];
    isGoogleAccount = json['is_google_account'];
    agentId = json['agent_id'];
    agentPercentage = json['agent_percentage'];
    currency = json['currency'];
    referralCode = json['referral_code'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['referred_by'] = referredBy;
    data['is_referral_rewarded'] = isReferralRewarded;
    data['name'] = name;
    data['email'] = email;
    data['salutation'] = salutation;
    data['age'] = age;
    data['user_id'] = userId;
    data['company'] = company;
    data['pan_number'] = panNumber;
    data['pan_name'] = panName;
    data['address'] = address;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['pin_code'] = pinCode;
    data['mobile'] = mobile;
    data['phone'] = phone;
    data['company_logo'] = companyLogo;
    data['bank_account_name'] = bankAccountName;
    data['bank_account_number'] = bankAccountNumber;
    data['bank_ifsc_code'] = bankIfscCode;
    data['email_verification_token'] = emailVerificationToken;
    data['email_verification_status'] = emailVerificationStatus;
    data['email_verified_at'] = emailVerifiedAt;
    data['password_reset'] = passwordReset;
    data['password_status'] = passwordStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role'] = role;
    data['adminapprovel'] = adminapprovel;
    data['avatar'] = avatar;
    data['is_google_account'] = isGoogleAccount;
    data['agent_id'] = agentId;
    data['agent_percentage'] = agentPercentage;
    data['currency'] = currency;
    data['referral_code'] = referralCode;
    data['fcm_token'] = fcmToken;
    return data;
  }
}
