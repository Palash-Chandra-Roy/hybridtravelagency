import 'dart:convert';

GetUserActivityBookingsResponse getUserActivityBookingsResponseFromJson(String str) =>
    GetUserActivityBookingsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getUserActivityBookingsResponseToJson(GetUserActivityBookingsResponse data) => json.encode(data.toJson());

class GetUserActivityBookingsResponse {
  bool? success;
  String? message;
  List<ActivityData>? data;

  GetUserActivityBookingsResponse({this.success, this.message, this.data});

  GetUserActivityBookingsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ActivityData>[];
      json['data'].forEach((v) {
        data!.add(ActivityData.fromJson(v));
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

class ActivityData {
  int? id;
  int? userId;
  int? tourId;
  int? orderId;
  Request? request;
  Response? response;
  String? bookingStatus;
  String? items;
  String? paymentID;
  String? createdAt;
  String? updatedAt;
  Tour? tour;
  User? user;

  ActivityData(
      {this.id,
        this.userId,
        this.tourId,
        this.orderId,
        this.request,
        this.response,
        this.bookingStatus,
        this.items,
        this.paymentID,
        this.createdAt,
        this.updatedAt,
        this.tour,
        this.user});

  ActivityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tourId = json['tour_id'];
    orderId = json['order_id'];
    request =
    json['request'] != null ? Request.fromJson(json['request']) : null;
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
    bookingStatus = json['booking_status'];
    items = json['items'];
    paymentID = json['paymentID'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tour = json['tour'] != null ? Tour.fromJson(json['tour']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tour_id'] = tourId;
    data['order_id'] = orderId;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (response != null) {
      data['response'] = response!.toJson();
    }
    data['booking_status'] = bookingStatus;
    data['items'] = items;
    data['paymentID'] = paymentID;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (tour != null) {
      data['tour'] = tour!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Request {
  int? uniqueNo;
  String? agentRefNo;
  String? currency;
  String? bookingtoken;
  List<TourDetails>? tourDetails;

  Request(
      {this.uniqueNo,
        this.agentRefNo,
        this.currency,
        this.bookingtoken,
        this.tourDetails});

  Request.fromJson(Map<String, dynamic> json) {
    uniqueNo = json['uniqueNo'];
    agentRefNo = json['agentRefNo'];
    currency = json['currency'];
    bookingtoken = json['bookingtoken'];
    if (json['tourDetails'] != null) {
      tourDetails = <TourDetails>[];
      json['tourDetails'].forEach((v) {
        tourDetails!.add(TourDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uniqueNo'] = uniqueNo;
    data['agentRefNo'] = agentRefNo;
    data['currency'] = currency;
    data['bookingtoken'] = bookingtoken;
    if (tourDetails != null) {
      data['tourDetails'] = tourDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourDetails {
  String? serviceUniqueId;
  String? tourId;
  String? optionId;
  String? adult;
  String? child;
  String? infant;
  String? tourDate;
  int? timeSlotId;
  String? startTime;
  String? transferId;
  String? serviceTotal;
  String? pickup;
  String? adultRate;
  String? childRate;
  String? rateKey;
  List<Passengers>? passengers;

  TourDetails(
      {this.serviceUniqueId,
        this.tourId,
        this.optionId,
        this.adult,
        this.child,
        this.infant,
        this.tourDate,
        this.timeSlotId,
        this.startTime,
        this.transferId,
        this.serviceTotal,
        this.pickup,
        this.adultRate,
        this.childRate,
        this.rateKey,
        this.passengers});

  TourDetails.fromJson(Map<String, dynamic> json) {
    serviceUniqueId = json['serviceUniqueId'];
    tourId = json['tourId'];
    optionId = json['optionId'];
    adult = json['adult'];
    child = json['child'];
    infant = json['infant'];
    tourDate = json['tourDate'];
    timeSlotId = json['timeSlotId'];
    startTime = json['startTime'];
    transferId = json['transferId'];
    serviceTotal = json['serviceTotal'];
    pickup = json['pickup'];
    adultRate = json['adultRate'];
    childRate = json['childRate'];
    rateKey = json['rateKey'];
    if (json['passengers'] != null) {
      passengers = <Passengers>[];
      json['passengers'].forEach((v) {
        passengers!.add(Passengers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceUniqueId'] = serviceUniqueId;
    data['tourId'] = tourId;
    data['optionId'] = optionId;
    data['adult'] = adult;
    data['child'] = child;
    data['infant'] = infant;
    data['tourDate'] = tourDate;
    data['timeSlotId'] = timeSlotId;
    data['startTime'] = startTime;
    data['transferId'] = transferId;
    data['serviceTotal'] = serviceTotal;
    data['pickup'] = pickup;
    data['adultRate'] = adultRate;
    data['childRate'] = childRate;
    data['rateKey'] = rateKey;
    if (passengers != null) {
      data['passengers'] = passengers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Passengers {
  String? prefix;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? paxType;
  int? leadPassenger;
  String? serviceType;

  Passengers(
      {this.prefix,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.paxType,
        this.leadPassenger,
        this.serviceType});

  Passengers.fromJson(Map<String, dynamic> json) {
    prefix = json['prefix'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    paxType = json['paxType'];
    leadPassenger = json['leadPassenger'];
    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prefix'] = prefix;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['paxType'] = paxType;
    data['leadPassenger'] = leadPassenger;
    data['serviceType'] = serviceType;
    return data;
  }
}

class Response {
  int? statuscode;
  Null error;
  Result? result;

  Response({this.statuscode, this.error, this.result});

  Response.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    error = json['error'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statuscode'] = statuscode;
    data['error'] = error;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Details>? details;
  String? referenceNo;

  Result({this.details, this.referenceNo});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
    referenceNo = json['referenceNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    data['referenceNo'] = referenceNo;
    return data;
  }
}

class Details {
  String? status;
  bool? downloadRequired;
  String? serviceUniqueId;
  String? confirmationNo;
  String? supplierConfirmationNo;

  Details(
      {this.status,
        this.downloadRequired,
        this.serviceUniqueId,
        this.confirmationNo,
        this.supplierConfirmationNo});

  Details.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    downloadRequired = json['downloadRequired'];
    serviceUniqueId = json['serviceUniqueId'];
    confirmationNo = json['confirmationNo'];
    supplierConfirmationNo = json['supplierConfirmationNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['downloadRequired'] = downloadRequired;
    data['serviceUniqueId'] = serviceUniqueId;
    data['confirmationNo'] = confirmationNo;
    data['supplierConfirmationNo'] = supplierConfirmationNo;
    return data;
  }
}

class Tour {
  int? tourId;
  int? countryId;
  String? countryName;
  int? cityId;
  String? cityName;
  String? tourName;
  int? reviewCount;
  int? rating;
  String? duration;
  String? imagePath;
  String? imageCaptionName;
  int? cityTourTypeId;
  String? cityTourType;
  String? tourShortDescription;
  String? cancellationPolicyName;
  int? onlyChild;
  int? contractId;
  int? sortOrder;
  int? recommended;
  String? createdAt;
  String? updatedAt;

  Tour(
      {this.tourId,
        this.countryId,
        this.countryName,
        this.cityId,
        this.cityName,
        this.tourName,
        this.reviewCount,
        this.rating,
        this.duration,
        this.imagePath,
        this.imageCaptionName,
        this.cityTourTypeId,
        this.cityTourType,
        this.tourShortDescription,
        this.cancellationPolicyName,
        this.onlyChild,
        this.contractId,
        this.sortOrder,
        this.recommended,
        this.createdAt,
        this.updatedAt});

  Tour.fromJson(Map<String, dynamic> json) {
    tourId = json['tourId'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    tourName = json['tourName'];
    reviewCount = json['reviewCount'];
    rating = json['rating'];
    duration = json['duration'];
    imagePath = json['imagePath'];
    imageCaptionName = json['imageCaptionName'];
    cityTourTypeId = json['cityTourTypeId'];
    cityTourType = json['cityTourType'];
    tourShortDescription = json['tourShortDescription'];
    cancellationPolicyName = json['cancellationPolicyName'];
    onlyChild = json['onlyChild'];
    contractId = json['contractId'];
    sortOrder = json['sortOrder'];
    recommended = json['recommended'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tourId'] = tourId;
    data['countryId'] = countryId;
    data['countryName'] = countryName;
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['tourName'] = tourName;
    data['reviewCount'] = reviewCount;
    data['rating'] = rating;
    data['duration'] = duration;
    data['imagePath'] = imagePath;
    data['imageCaptionName'] = imageCaptionName;
    data['cityTourTypeId'] = cityTourTypeId;
    data['cityTourType'] = cityTourType;
    data['tourShortDescription'] = tourShortDescription;
    data['cancellationPolicyName'] = cancellationPolicyName;
    data['onlyChild'] = onlyChild;
    data['contractId'] = contractId;
    data['sortOrder'] = sortOrder;
    data['recommended'] = recommended;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  Null referredBy;
  int? isReferralRewarded;
  String? name;
  String? email;
  String? salutation;
  String? age;
  Null userId;
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
  Null emailVerificationToken;
  String? emailVerificationStatus;
  Null emailVerifiedAt;
  String? passwordReset;
  int? passwordStatus;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? adminapprovel;
  String? avatar;
  int? isGoogleAccount;
  Null agentId;
  Null agentPercentage;
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
