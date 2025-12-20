import 'dart:convert';

GetDashboardOverviewResponse getDashboardOverviewResponseFromJson(String str) =>
    GetDashboardOverviewResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getDashboardOverviewResponseToJson(GetDashboardOverviewResponse data) => json.encode(data.toJson());

class GetDashboardOverviewResponse {
  bool? success;
  String? message;
  Data? data;

  GetDashboardOverviewResponse({this.success, this.message, this.data});

  GetDashboardOverviewResponse.fromJson(Map<String, dynamic> json) {
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
  TotalBookings? totalBookings;
  int? totalApplications;
  UpcomingTrips? upcomingTrips;
  List<RecentActivity>? recentActivity;

  Data(
      {this.totalBookings,
      this.totalApplications,
      this.upcomingTrips,
      this.recentActivity});

  Data.fromJson(Map<String, dynamic> json) {
    totalBookings = json['total_bookings'] != null
        ? TotalBookings.fromJson(json['total_bookings'])
        : null;
    totalApplications = json['total_applications'];
    upcomingTrips = json['upcoming_trips'] != null
        ? UpcomingTrips.fromJson(json['upcoming_trips'])
        : null;
    if (json['recent_activity'] != null) {
      recentActivity = <RecentActivity>[];
      json['recent_activity'].forEach((v) {
        recentActivity!.add(RecentActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (totalBookings != null) {
      data['total_bookings'] = totalBookings!.toJson();
    }
    data['total_applications'] = totalApplications;
    if (upcomingTrips != null) {
      data['upcoming_trips'] = upcomingTrips!.toJson();
    }
    if (recentActivity != null) {
      data['recent_activity'] =
          recentActivity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class RecentActivity {
  String? name;

  RecentActivity({this.name});

  RecentActivity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class TotalBookings {
  int? flights;
  int? hotels;
  int? activities;
  int? holidays;

  TotalBookings({this.flights, this.hotels, this.activities, this.holidays});

  TotalBookings.fromJson(Map<String, dynamic> json) {
    flights = json['flights'];
    hotels = json['hotels'];
    activities = json['activities'];
    holidays = json['holidays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flights'] = flights;
    data['hotels'] = hotels;
    data['activities'] = activities;
    data['holidays'] = holidays;
    return data;
  }
}

class UpcomingTrips {
  Headers? headers;
  Original? original;
  String? exception;

  UpcomingTrips({this.headers, this.original, this.exception});

  UpcomingTrips.fromJson(Map<String, dynamic> json) {
    headers =
        json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    original = json['original'] != null
        ? Original.fromJson(json['original'])
        : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    if (original != null) {
      data['original'] = original!.toJson();
    }
    data['exception'] = exception;
    return data;
  }
}

class Headers {
  String? name;

  Headers({this.name});

  Headers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Original {
  bool? success;
  String? message;
  List<TripData>? data;

  Original({this.success, this.message, this.data});

  Original.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TripData>[];
      json['data'].forEach((v) {
        data!.add(TripData.fromJson(v));
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

class TripData {
  String? name;

  TripData({this.name});

  TripData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
