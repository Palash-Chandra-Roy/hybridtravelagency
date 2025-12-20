import 'dart:convert';

SearchHotelsResponse searchHotelsResponseFromJson(String str) =>
    SearchHotelsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String searchHotelsResponseToJson(SearchHotelsResponse data) =>
    json.encode(data.toJson());

class SearchHotelsResponse {
  bool? status;
  String? message;
  Data? data;
  RateMap? rateMap;
  int? offset;

  SearchHotelsResponse(
      {this.status, this.message, this.data, this.rateMap, this.offset});

  SearchHotelsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    rateMap =
    json['rateMap'] != null ? RateMap.fromJson(json['rateMap']) : null;
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (rateMap != null) {
      data['rateMap'] = rateMap!.toJson();
    }
    data['offset'] = offset;
    return data;
  }
}

class Data {
  int? currentPage;
  List<HotelData>? data;
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
      data = <HotelData>[];
      json['data'].forEach((v) {
        data!.add(HotelData.fromJson(v));
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

class HotelData {
  String? id;
  String? primaryHotelId;
  String? name;
  String? hotelDescription;
  int? hotelTypeId;
  int? chainId;
  String? chain;
  String? currency;
  String? country;
  String? city;
  double? latitude;
  double? longitude;
  String? address;
  String? zip;
  String? mainPhoto;
  String? thumbnail;
  int? stars;
  double? rating;
  int? reviewCount;
  List<int>? facilityIds;
  AccessibilityAttributes? accessibilityAttributes;
  String? deletedAt;
  double? price;
  int? availability;

  HotelData(
      {this.id,
        this.primaryHotelId,
        this.name,
        this.hotelDescription,
        this.hotelTypeId,
        this.chainId,
        this.chain,
        this.currency,
        this.country,
        this.city,
        this.latitude,
        this.longitude,
        this.address,
        this.zip,
        this.mainPhoto,
        this.thumbnail,
        this.stars,
        this.rating,
        this.reviewCount,
        this.facilityIds,
        this.accessibilityAttributes,
        this.deletedAt,
        this.price,
        this.availability});

  HotelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryHotelId = json['primaryHotelId'];
    name = json['name'];
    hotelDescription = json['hotelDescription'];
    hotelTypeId = json['hotelTypeId'];
    chainId = json['chainId'];
    chain = json['chain'];
    currency = json['currency'];
    country = json['country'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    zip = json['zip'];
    mainPhoto = json['main_photo'];
    thumbnail = json['thumbnail'];
    stars = json['stars'];
    rating = double.parse(json['rating'].toString());
    reviewCount = json['reviewCount'];
    facilityIds = json['facilityIds'].cast<int>();
    accessibilityAttributes = json['accessibilityAttributes'] != null
        ? AccessibilityAttributes.fromJson(json['accessibilityAttributes'])
        : null;
    deletedAt = json['deletedAt'];
    price = json['price'];
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['primaryHotelId'] = primaryHotelId;
    data['name'] = name;
    data['hotelDescription'] = hotelDescription;
    data['hotelTypeId'] = hotelTypeId;
    data['chainId'] = chainId;
    data['chain'] = chain;
    data['currency'] = currency;
    data['country'] = country;
    data['city'] = city;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['zip'] = zip;
    data['main_photo'] = mainPhoto;
    data['thumbnail'] = thumbnail;
    data['stars'] = stars;
    data['rating'] = rating;
    data['reviewCount'] = reviewCount;
    data['facilityIds'] = facilityIds;
    if (accessibilityAttributes != null) {
      data['accessibilityAttributes'] = accessibilityAttributes!.toJson();
    }
    data['deletedAt'] = deletedAt;
    data['price'] = price;
    data['availability'] = availability;
    return data;
  }
}

class AccessibilityAttributes {
  String? attributes;
  String? showerChair;
  String? entranceType;
  String? petFriendly;
  int? rampAngle;
  int? rampLength;
  int? entranceDoorWidth;
  int? roomMaxGuestsNumber;
  int? distanceFromTheElevatorToTheAccessibleRoom;

  AccessibilityAttributes(
      {this.attributes,
        this.showerChair,
        this.entranceType,
        this.petFriendly,
        this.rampAngle,
        this.rampLength,
        this.entranceDoorWidth,
        this.roomMaxGuestsNumber,
        this.distanceFromTheElevatorToTheAccessibleRoom});

  AccessibilityAttributes.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'];
    showerChair = json['showerChair'];
    entranceType = json['entranceType'];
    petFriendly = json['petFriendly'];
    rampAngle = json['rampAngle'];
    rampLength = json['rampLength'];
    entranceDoorWidth = json['entranceDoorWidth'];
    roomMaxGuestsNumber = json['roomMaxGuestsNumber'];
    distanceFromTheElevatorToTheAccessibleRoom =
    json['distanceFromTheElevatorToTheAccessibleRoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attributes'] = attributes;
    data['showerChair'] = showerChair;
    data['entranceType'] = entranceType;
    data['petFriendly'] = petFriendly;
    data['rampAngle'] = rampAngle;
    data['rampLength'] = rampLength;
    data['entranceDoorWidth'] = entranceDoorWidth;
    data['roomMaxGuestsNumber'] = roomMaxGuestsNumber;
    data['distanceFromTheElevatorToTheAccessibleRoom'] =
        distanceFromTheElevatorToTheAccessibleRoom;
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

class RateMap {
  Lp23303? lp23303;
  Lp23303? lp216cb;
  Lp23303? lp1c96c;
  Lp23303? lp1bf8c;
  Lp23303? lp232e4;
  Lp23303? lp1ccdc;
  Lp23303? lp1b3ee;
  Lp23303? lp19d4c;
  Lp23303? lp1f66c;
  Lp23303? lp19ef6;
  Lp23303? lp1b495;
  Lp23303? lp20eb9;
  Lp23303? lp22ad5;

  RateMap(
      {this.lp23303,
        this.lp216cb,
        this.lp1c96c,
        this.lp1bf8c,
        this.lp232e4,
        this.lp1ccdc,
        this.lp1b3ee,
        this.lp19d4c,
        this.lp1f66c,
        this.lp19ef6,
        this.lp1b495,
        this.lp20eb9,
        this.lp22ad5});

  RateMap.fromJson(Map<String, dynamic> json) {
    lp23303 =
    json['lp23303'] != null ? Lp23303.fromJson(json['lp23303']) : null;
    lp216cb =
    json['lp216cb'] != null ? Lp23303.fromJson(json['lp216cb']) : null;
    lp1c96c =
    json['lp1c96c'] != null ? Lp23303.fromJson(json['lp1c96c']) : null;
    lp1bf8c =
    json['lp1bf8c'] != null ? Lp23303.fromJson(json['lp1bf8c']) : null;
    lp232e4 =
    json['lp232e4'] != null ? Lp23303.fromJson(json['lp232e4']) : null;
    lp1ccdc =
    json['lp1ccdc'] != null ? Lp23303.fromJson(json['lp1ccdc']) : null;
    lp1b3ee =
    json['lp1b3ee'] != null ? Lp23303.fromJson(json['lp1b3ee']) : null;
    lp19d4c =
    json['lp19d4c'] != null ? Lp23303.fromJson(json['lp19d4c']) : null;
    lp1f66c =
    json['lp1f66c'] != null ? Lp23303.fromJson(json['lp1f66c']) : null;
    lp19ef6 =
    json['lp19ef6'] != null ? Lp23303.fromJson(json['lp19ef6']) : null;
    lp1b495 =
    json['lp1b495'] != null ? Lp23303.fromJson(json['lp1b495']) : null;
    lp20eb9 =
    json['lp20eb9'] != null ? Lp23303.fromJson(json['lp20eb9']) : null;
    lp22ad5 =
    json['lp22ad5'] != null ? Lp23303.fromJson(json['lp22ad5']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lp23303 != null) {
      data['lp23303'] = lp23303!.toJson();
    }
    if (lp216cb != null) {
      data['lp216cb'] = lp216cb!.toJson();
    }
    if (lp1c96c != null) {
      data['lp1c96c'] = lp1c96c!.toJson();
    }
    if (lp1bf8c != null) {
      data['lp1bf8c'] = lp1bf8c!.toJson();
    }
    if (lp232e4 != null) {
      data['lp232e4'] = lp232e4!.toJson();
    }
    if (lp1ccdc != null) {
      data['lp1ccdc'] = lp1ccdc!.toJson();
    }
    if (lp1b3ee != null) {
      data['lp1b3ee'] = lp1b3ee!.toJson();
    }
    if (lp19d4c != null) {
      data['lp19d4c'] = lp19d4c!.toJson();
    }
    if (lp1f66c != null) {
      data['lp1f66c'] = lp1f66c!.toJson();
    }
    if (lp19ef6 != null) {
      data['lp19ef6'] = lp19ef6!.toJson();
    }
    if (lp1b495 != null) {
      data['lp1b495'] = lp1b495!.toJson();
    }
    if (lp20eb9 != null) {
      data['lp20eb9'] = lp20eb9!.toJson();
    }
    if (lp22ad5 != null) {
      data['lp22ad5'] = lp22ad5!.toJson();
    }
    return data;
  }
}

class Lp23303 {
  double? total;
  int? rating;

  Lp23303({this.total, this.rating});

  Lp23303.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['rating'] = rating;
    return data;
  }
}
