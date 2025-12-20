import 'dart:convert';

GetUserHolidayBookingsResponse getUserHolidayBookingsResponseFromJson(String str) =>
    GetUserHolidayBookingsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getUserHolidayBookingsResponseToJson(GetUserHolidayBookingsResponse data) => json.encode(data.toJson());

class GetUserHolidayBookingsResponse {
  bool? success;
  String? message;
  List<HolidayBookingData>? data;

  GetUserHolidayBookingsResponse({this.success, this.message, this.data});

  GetUserHolidayBookingsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HolidayBookingData>[];
      json['data'].forEach((v) {
        data!.add(HolidayBookingData.fromJson(v));
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

class HolidayBookingData {
  int? id;
  int? travelPersons;
  String? travelDate;
  String? email;
  String? mobileNumber;
  int? userId;
  int? holidayPackageId;
  int? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  Holiday? holiday;

  HolidayBookingData(
      {this.id,
        this.travelPersons,
        this.travelDate,
        this.email,
        this.mobileNumber,
        this.userId,
        this.holidayPackageId,
        this.amount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.holiday});

  HolidayBookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    travelPersons = json['travel_persons'];
    travelDate = json['travel_date'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    userId = json['user_id'];
    holidayPackageId = json['holiday_package_id'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    holiday =
    json['holiday'] != null ? Holiday.fromJson(json['holiday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['travel_persons'] = travelPersons;
    data['travel_date'] = travelDate;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['user_id'] = userId;
    data['holiday_package_id'] = holidayPackageId;
    data['amount'] = amount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (holiday != null) {
      data['holiday'] = holiday!.toJson();
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

class Holiday {
  int? id;
  int? agentId;
  String? title;
  String? slug;
  String? daysnight;
  String? location;
  String? city;
  String? price;
  String? packageMembers;
  String? packageImage;
  int? hotels;
  int? flight;
  int? activities;
  int? transfer;
  int? visa;
  String? pkgoverview;
  String? pkgitinerary;
  String? pkginclusion;
  String? pkgexclusion;
  String? pkgtermsocondition;
  String? status;
  int? isApproved;
  String? createdAt;
  String? updatedAt;
  int? breakfast;
  int? lunch;
  int? dinner;
  String? galleryImages;

  Holiday(
      {this.id,
        this.agentId,
        this.title,
        this.slug,
        this.daysnight,
        this.location,
        this.city,
        this.price,
        this.packageMembers,
        this.packageImage,
        this.hotels,
        this.flight,
        this.activities,
        this.transfer,
        this.visa,
        this.pkgoverview,
        this.pkgitinerary,
        this.pkginclusion,
        this.pkgexclusion,
        this.pkgtermsocondition,
        this.status,
        this.isApproved,
        this.createdAt,
        this.updatedAt,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.galleryImages});

  Holiday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    title = json['title'];
    slug = json['slug'];
    daysnight = json['daysnight'];
    location = json['location'];
    city = json['city'];
    price = json['price'];
    packageMembers = json['package_members'];
    packageImage = json['package_image'];
    hotels = json['hotels'];
    flight = json['flight'];
    activities = json['activities'];
    transfer = json['transfer'];
    visa = json['visa'];
    pkgoverview = json['pkgoverview'];
    pkgitinerary = json['pkgitinerary'];
    pkginclusion = json['pkginclusion'];
    pkgexclusion = json['pkgexclusion'];
    pkgtermsocondition = json['pkgtermsocondition'];
    status = json['status'];
    isApproved = json['is_approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    galleryImages = json['gallery_images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agent_id'] = agentId;
    data['title'] = title;
    data['slug'] = slug;
    data['daysnight'] = daysnight;
    data['location'] = location;
    data['city'] = city;
    data['price'] = price;
    data['package_members'] = packageMembers;
    data['package_image'] = packageImage;
    data['hotels'] = hotels;
    data['flight'] = flight;
    data['activities'] = activities;
    data['transfer'] = transfer;
    data['visa'] = visa;
    data['pkgoverview'] = pkgoverview;
    data['pkgitinerary'] = pkgitinerary;
    data['pkginclusion'] = pkginclusion;
    data['pkgexclusion'] = pkgexclusion;
    data['pkgtermsocondition'] = pkgtermsocondition;
    data['status'] = status;
    data['is_approved'] = isApproved;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['breakfast'] = breakfast;
    data['lunch'] = lunch;
    data['dinner'] = dinner;
    data['gallery_images'] = galleryImages;
    return data;
  }
}
