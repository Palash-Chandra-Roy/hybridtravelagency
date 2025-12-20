import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool? success;
  String? message;
  Data? data;

  LoginResponse({this.success, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;
  String? tokenType;

  Data({this.user, this.token, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
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
      this.fcmToken
      });

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

