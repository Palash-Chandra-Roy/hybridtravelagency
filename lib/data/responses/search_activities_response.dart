import 'dart:convert';

SearchActivitiesResponse searchActivitiesResponseFromJson(String str) =>
    SearchActivitiesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String searchActivitiesResponseToJson(SearchActivitiesResponse data) =>
    json.encode(data.toJson());

class SearchActivitiesResponse {
  bool? status;
  String? message;
  Data? data;

  SearchActivitiesResponse({this.status, this.message, this.data});

  SearchActivitiesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  Activities? activities;

  Data({this.activities});

  Data.fromJson(Map<String, dynamic> json) {
    activities = json['activities'] != null
        ? Activities.fromJson(json['activities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (activities != null) {
      data['activities'] = activities!.toJson();
    }
    return data;
  }
}

class Activities {
  int? currentPage;
  List<ActivityData>? data;
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

  Activities(
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

  Activities.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ActivityData>[];
      json['data'].forEach((v) {
        data!.add(ActivityData.fromJson(v));
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

class ActivityData {
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
  String? price;
  double? actualActivityPrice;

  ActivityData(
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
        this.updatedAt,
        this.price,
        this.actualActivityPrice});

  ActivityData.fromJson(Map<String, dynamic> json) {
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
    price = json['price'];
    actualActivityPrice = json['actualActivityPrice'];
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
    data['price'] = price;
    data['actualActivityPrice'] = actualActivityPrice;
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
