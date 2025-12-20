import 'dart:convert';

GetArtsResponse getArtsResponseFromJson(String str) =>
    GetArtsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getArtsResponseToJson(GetArtsResponse data) =>
    json.encode(data.toJson());

class GetArtsResponse {
  List<DataByArt>? data;
  bool? success;
  String? message;

  GetArtsResponse({this.data, this.success, this.message});

  GetArtsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataByArt>[];
      json['data'].forEach((v) {
        data!.add(DataByArt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataByArt {
  int? id;
  CategoryData? category;
  ArtistData? artist;
  String? name;
  bool? liked;
  int? totalLikes;
  String? image;
  String? createdAt;

  DataByArt({
    this.id,
    this.category,
    this.artist,
    this.name,
    this.liked,
    this.totalLikes,
    this.image,
    this.createdAt,
  });

  DataByArt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? CategoryData.fromJson(json['category'])
        : null;
    artist =
        json['artist'] != null ? ArtistData.fromJson(json['artist']) : null;
    name = json['name'];
    liked = json['liked'];
    totalLikes = json['total_likes'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    if (category != null) map['category'] = category!.toJson();
    if (artist != null) {
      map['artist'] = artist!.toJson();
    }
    map['name'] = name;
    map['liked'] = liked;
    map['total_likes'] = totalLikes;
    map['image'] = image;
    map['created_at'] = createdAt;
    return map;
  }
}

class CategoryData {
  int? id;
  String? name;
  int? status;
  String? profilePicture;
  String? createdAt;

  CategoryData({
    this.id,
    this.name,
    this.status,
    this.profilePicture,
    this.createdAt,
  });

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    profilePicture = json['profile_picture'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['profile_picture'] = profilePicture;
    map['created_at'] = createdAt;
    return map;
  }
}

class ArtistData {
  int? id;
  String? name;

  ArtistData({this.id, this.name});

  ArtistData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
