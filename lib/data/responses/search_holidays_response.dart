import 'dart:convert';

SearchHolidaysResponse searchHolidaysResponseFromJson(String str) =>
    SearchHolidaysResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String searchHolidaysResponseToJson(SearchHolidaysResponse data) =>
    json.encode(data.toJson());

class SearchHolidaysResponse {
  bool? status;
  String? message;
  Data? data;
  String? maxPrice;

  SearchHolidaysResponse({this.status, this.message, this.data, this.maxPrice});

  SearchHolidaysResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    maxPrice = json['maxPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['maxPrice'] = maxPrice;
    return data;
  }
}

class Data {
  int? currentPage;
  List<HolidayData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <HolidayData>[];
      json['data'].forEach((v) {
        data!.add(HolidayData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class HolidayData {
  int? id;
  int? agentId;
  String? title;
  String? slug;
  String? daysnight;
  String? location;
  List<String>? city;
  int? price;
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

  HolidayData(
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

  HolidayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    title = json['title'];
    slug = json['slug'];
    daysnight = json['daysnight'];
    location = json['location'];
    city = json['city'].cast<String>();
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
