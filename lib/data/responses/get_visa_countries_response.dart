import 'dart:convert';

GetVisaCountriesResponse getVisaCountriesResponseFromJson(String str) =>
    GetVisaCountriesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getVisaCountriesResponseToJson(GetVisaCountriesResponse data) => json.encode(data.toJson());

class GetVisaCountriesResponse {
  bool? status;
  String? message;
  VisaCountriesData? data;

  GetVisaCountriesResponse({this.status, this.message, this.data});

  GetVisaCountriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? VisaCountriesData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VisaCountriesData {
  List<Visa>? visa;
  Countries? countries;

  VisaCountriesData({this.visa, this.countries});

  VisaCountriesData.fromJson(Map<String, dynamic> json) {
    if (json['visa'] != null) {
      visa = <Visa>[];
      json['visa'].forEach((v) {
        visa!.add(Visa.fromJson(v));
      });
    }
    countries = json['countries'] != null
        ? Countries.fromJson(json['countries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (visa != null) {
      data['visa'] = visa!.map((v) => v.toJson()).toList();
    }
    if (countries != null) {
      data['countries'] = countries!.toJson();
    }
    return data;
  }
}

class Visa {
  int? id;
  String? country;
  String? noOfDays;
  String? visaType;
  String? entryType;
  String? regularProcessingTime;
  String? expressProcessingTime;
  int? regularAmount;
  int? expressAmount;
  String? validity;
  String? stayPeriod;
  String? createdAt;
  String? updatedAt;

  Visa(
      {this.id,
        this.country,
        this.noOfDays,
        this.visaType,
        this.entryType,
        this.regularProcessingTime,
        this.expressProcessingTime,
        this.regularAmount,
        this.expressAmount,
        this.validity,
        this.stayPeriod,
        this.createdAt,
        this.updatedAt});

  Visa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    noOfDays = json['no_of_days'];
    visaType = json['visa_type'];
    entryType = json['entry_type'];
    regularProcessingTime = json['regular_processing_time'];
    expressProcessingTime = json['express_processing_time'];
    regularAmount = json['regular_amount'];
    expressAmount = json['express_amount'];
    validity = json['validity'];
    stayPeriod = json['stay_period'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['no_of_days'] = noOfDays;
    data['visa_type'] = visaType;
    data['entry_type'] = entryType;
    data['regular_processing_time'] = regularProcessingTime;
    data['express_processing_time'] = expressProcessingTime;
    data['regular_amount'] = regularAmount;
    data['express_amount'] = expressAmount;
    data['validity'] = validity;
    data['stay_period'] = stayPeriod;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Countries {
  List<String>? africa;
  List<String>? asia;
  List<String>? europe;
  List<String>? northAmerica;
  List<String>? oceania;

  Countries(
      {this.africa, this.asia, this.europe, this.northAmerica, this.oceania});

  Countries.fromJson(Map<String, dynamic> json) {
    africa = json['Africa'].cast<String>();
    asia = json['Asia'].cast<String>();
    europe = json['Europe'].cast<String>();
    northAmerica = json['North America'].cast<String>();
    oceania = json['Oceania'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Africa'] = africa;
    data['Asia'] = asia;
    data['Europe'] = europe;
    data['North America'] = northAmerica;
    data['Oceania'] = oceania;
    return data;
  }
}
