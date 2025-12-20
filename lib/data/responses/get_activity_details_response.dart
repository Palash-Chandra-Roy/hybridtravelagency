class GetActivityDetailsResponse {
  bool? status;
  String? message;
  Data? data;

  GetActivityDetailsResponse({this.status, this.message, this.data});

  GetActivityDetailsResponse.fromJson(Map<String, dynamic> json) {
    // Handle direct object response (new API format)
    if (json.containsKey('tourId')) {
      // Direct object response - wrap it in Data structure for consistency
      data = Data(
          statuscode: 200,
          error: null,
          url: null,
          count: 1,
          result: [Result.fromJson(json)]);
      status = true;
      message = 'Success';
    } else {
      // Old format with wrapped data
      status = json['status'];
      message = json['message'];
      data = json['data'] != null ? Data.fromJson(json['data']) : null;
    }
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
  int? statuscode;
  Null error;
  String? url;
  int? count;
  List<Result>? result;

  Data({this.statuscode, this.error, this.url, this.count, this.result});

  Data.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    error = json['error'];
    url = json['url'];
    count = json['count'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statuscode'] = statuscode;
    data['error'] = error;
    data['url'] = url;
    data['count'] = count;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? tourId;
  int? countryId;
  String? countryName;
  int? cityId;
  String? cityName;
  String? tourName;
  int? reviewCount;
  int? rating;
  String? duration;
  String? departurePoint;
  String? reportingTime;
  String? tourLanguage;
  String? imagePath;
  String? imageCaptionName;
  String? cityTourTypeId;
  String? cityTourType;
  String? tourDescription;
  String? tourInclusion;
  String? tourShortDescription;
  Null toursAdvantage;
  String? whatsInThisTour;
  String? importantInformation;
  String? itenararyDescription;
  String? usefulInformation;
  String? faqDetails;
  String? termsAndConditions;
  String? cancellationPolicyName;
  String? cancellationPolicyDescription;
  String? childCancellationPolicyName;
  String? childCancellationPolicyDescription;
  String? childAge;
  String? infantAge;
  int? infantCount;
  bool? isSlot;
  bool? onlyChild;
  int? contractId;
  String? latitude;
  String? longitude;
  String? googleMapUrl;
  String? howToRedeem;
  String? startTime;
  Null meal;
  List<TourImages>? tourImages;
  List<TourReview>? tourReview;
  Null questions;

  Result(
      {this.tourId,
      this.countryId,
      this.countryName,
      this.cityId,
      this.cityName,
      this.tourName,
      this.reviewCount,
      this.rating,
      this.duration,
      this.departurePoint,
      this.reportingTime,
      this.tourLanguage,
      this.imagePath,
      this.imageCaptionName,
      this.cityTourTypeId,
      this.cityTourType,
      this.tourDescription,
      this.tourInclusion,
      this.tourShortDescription,
      this.toursAdvantage,
      this.whatsInThisTour,
      this.importantInformation,
      this.itenararyDescription,
      this.usefulInformation,
      this.faqDetails,
      this.termsAndConditions,
      this.cancellationPolicyName,
      this.cancellationPolicyDescription,
      this.childCancellationPolicyName,
      this.childCancellationPolicyDescription,
      this.childAge,
      this.infantAge,
      this.infantCount,
      this.isSlot,
      this.onlyChild,
      this.contractId,
      this.latitude,
      this.longitude,
      this.googleMapUrl,
      this.howToRedeem,
      this.startTime,
      this.meal,
      this.tourImages,
      this.tourReview,
      this.questions});

  Result.fromJson(Map<String, dynamic> json) {
    tourId = json['tourId'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    tourName = json['tourName'];
    reviewCount = json['reviewCount'];
    rating = json['rating'];
    duration = json['duration'];
    departurePoint = json['departurePoint'];
    reportingTime = json['reportingTime'];
    tourLanguage = json['tourLanguage'];
    imagePath = json['imagePath'];
    imageCaptionName = json['imageCaptionName'];
    cityTourTypeId = json['cityTourTypeId'];
    cityTourType = json['cityTourType'];
    tourDescription = json['tourDescription'];
    tourInclusion = json['tourInclusion'];
    tourShortDescription = json['tourShortDescription'];
    toursAdvantage = json['toursAdvantage'];
    whatsInThisTour = json['whatsInThisTour'];
    importantInformation = json['importantInformation'];
    itenararyDescription = json['itenararyDescription'];
    usefulInformation = json['usefulInformation'];
    faqDetails = json['faqDetails'];
    termsAndConditions = json['termsAndConditions'];
    cancellationPolicyName = json['cancellationPolicyName'];
    cancellationPolicyDescription = json['cancellationPolicyDescription'];
    childCancellationPolicyName = json['childCancellationPolicyName'];
    childCancellationPolicyDescription =
        json['childCancellationPolicyDescription'];
    childAge = json['childAge'];
    infantAge = json['infantAge'];
    infantCount = json['infantCount'];
    isSlot = json['isSlot'];
    onlyChild = json['onlyChild'];
    contractId = json['contractId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    googleMapUrl = json['googleMapUrl'];
    howToRedeem = json['howToRedeem'];
    startTime = json['startTime'];
    meal = json['meal'];
    if (json['tourImages'] != null) {
      tourImages = <TourImages>[];
      json['tourImages'].forEach((v) {
        tourImages!.add(TourImages.fromJson(v));
      });
    }
    if (json['tourReview'] != null) {
      tourReview = <TourReview>[];
      json['tourReview'].forEach((v) {
        tourReview!.add(TourReview.fromJson(v));
      });
    }
    questions = json['questions'];
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
    data['departurePoint'] = departurePoint;
    data['reportingTime'] = reportingTime;
    data['tourLanguage'] = tourLanguage;
    data['imagePath'] = imagePath;
    data['imageCaptionName'] = imageCaptionName;
    data['cityTourTypeId'] = cityTourTypeId;
    data['cityTourType'] = cityTourType;
    data['tourDescription'] = tourDescription;
    data['tourInclusion'] = tourInclusion;
    data['tourShortDescription'] = tourShortDescription;
    data['toursAdvantage'] = toursAdvantage;
    data['whatsInThisTour'] = whatsInThisTour;
    data['importantInformation'] = importantInformation;
    data['itenararyDescription'] = itenararyDescription;
    data['usefulInformation'] = usefulInformation;
    data['faqDetails'] = faqDetails;
    data['termsAndConditions'] = termsAndConditions;
    data['cancellationPolicyName'] = cancellationPolicyName;
    data['cancellationPolicyDescription'] = cancellationPolicyDescription;
    data['childCancellationPolicyName'] = childCancellationPolicyName;
    data['childCancellationPolicyDescription'] =
        childCancellationPolicyDescription;
    data['childAge'] = childAge;
    data['infantAge'] = infantAge;
    data['infantCount'] = infantCount;
    data['isSlot'] = isSlot;
    data['onlyChild'] = onlyChild;
    data['contractId'] = contractId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['googleMapUrl'] = googleMapUrl;
    data['howToRedeem'] = howToRedeem;
    data['startTime'] = startTime;
    data['meal'] = meal;
    if (tourImages != null) {
      data['tourImages'] = tourImages!.map((v) => v.toJson()).toList();
    }
    if (tourReview != null) {
      data['tourReview'] = tourReview!.map((v) => v.toJson()).toList();
    }
    data['questions'] = questions;
    return data;
  }
}

class TourImages {
  int? tourId;
  String? imagePath;
  String? imageCaptionName;
  int? isFrontImage;
  int? isBannerImage;
  int? isBannerRotateImage;

  TourImages(
      {this.tourId,
      this.imagePath,
      this.imageCaptionName,
      this.isFrontImage,
      this.isBannerImage,
      this.isBannerRotateImage});

  TourImages.fromJson(Map<String, dynamic> json) {
    tourId = json['tourId'];
    imagePath = json['imagePath'];
    imageCaptionName = json['imageCaptionName'];
    isFrontImage = json['isFrontImage'];
    isBannerImage = json['isBannerImage'];
    isBannerRotateImage = json['isBannerRotateImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tourId'] = tourId;
    data['imagePath'] = imagePath;
    data['imageCaptionName'] = imageCaptionName;
    data['isFrontImage'] = isFrontImage;
    data['isBannerImage'] = isBannerImage;
    data['isBannerRotateImage'] = isBannerRotateImage;
    return data;
  }
}

class TourReview {
  int? id;
  int? tourId;
  int? reviewId;
  String? reviewTitle;
  String? reviewContent;
  String? visitMonth;
  String? rating;
  String? imagePath;
  String? guestName;

  TourReview(
      {this.id,
      this.tourId,
      this.reviewId,
      this.reviewTitle,
      this.reviewContent,
      this.visitMonth,
      this.rating,
      this.imagePath,
      this.guestName});

  TourReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tourId = json['tourId'];
    reviewId = json['reviewId'];
    reviewTitle = json['reviewTitle'];
    reviewContent = json['reviewContent'];
    visitMonth = json['visitMonth'];
    rating = json['rating'];
    imagePath = json['imagePath'];
    guestName = json['guestName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tourId'] = tourId;
    data['reviewId'] = reviewId;
    data['reviewTitle'] = reviewTitle;
    data['reviewContent'] = reviewContent;
    data['visitMonth'] = visitMonth;
    data['rating'] = rating;
    data['imagePath'] = imagePath;
    data['guestName'] = guestName;
    return data;
  }
}
