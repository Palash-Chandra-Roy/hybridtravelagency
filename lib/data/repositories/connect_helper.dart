// coverage:ignore-file

import 'package:hybridtravelagency/data/data_constant.dart';
import 'package:hybridtravelagency/data/models/response_model.dart';
import 'package:hybridtravelagency/data/repositories/api_wrapper.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../entities/enums.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  // late Dio dio;
  late dio_package.Dio dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    if (GetPlatform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
    dio = dio_package.Dio();
  }

  // coverage:ignore-end

  /// Device id
  String? get deviceId => GetPlatform.isAndroid
      ? androidDeviceInfo?.id
      : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel =>
      GetPlatform.isAndroid ? androidDeviceInfo?.model : iosDeviceInfo?.model;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => GetPlatform.isAndroid ? 'ANDROID' : 'IOS';

  Future<ResponseModel> login({
    required bool isLoading,
    required String email,
    required String password,
  }) async {
    var data = {
      'email': email,
      'password': password,
    };
    var res = await apiWrapper.makeRequest(DataConstants.login, Request.post,
        data, isLoading, {'Content-type': 'Application/json'});
    return res;
  }

  Future<ResponseModel> register({
    required bool isLoading,
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
  }) async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      'phone': phone,
    };
    var res = await apiWrapper.makeRequest(DataConstants.register, Request.post,
        data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("Register response ${res.data}");
    return res;
  }

  Future<ResponseModel> logout({
    required bool isLoading,
  }) async {
    var res = await apiWrapper.makeRequest(
        DataConstants.logout,
        Request.post,
        {},
        isLoading,
        {
          'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
          'Content-type': 'Application/json'
        });
    return res;
  }

  Future<ResponseModel> updateProfile({
    required bool isLoading,
    required String name,
    required String phone,
    required String address,
    required String city,
    required String country,
  }) async {
    var data = {
      "name": name,
      "phone": phone,
      "address": address,
      "city": city,
      'country': country,
    };
    var res = await apiWrapper.makeRequest(
        DataConstants.updateProfile, Request.put, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    debugPrint("Update Profile response ${res.data}");
    return res;
  }

  Future<ResponseModel> getCurrentUser({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper
        .makeRequest(DataConstants.currentUser, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    //
    return res;
  }

  Future<ResponseModel> getCountries({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper
        .makeRequest(DataConstants.countries, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getCities({
    required bool isLoading,
    required int countryId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        '${DataConstants.cities}/$countryId', Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getAirports(
      {required bool isLoading, required String query}) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        '${DataConstants.airports}?query=$query',
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getCurrencies({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper
        .makeRequest(DataConstants.currencies, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> searchFlight({
    required bool isLoading,
    required String origin,
    required String destination,
    required String departureDate,
    required String returnDate,
    required int adults,
    required int children,
    required int infants,
    required String cabinClass,
    required String tripType,
  }) async {
    var data = {
      "TripType": tripType, // R for RoundTrip or O for OneWay
      "Origin": origin, // Airport code
      "Destination": destination,
      "TravelDate": departureDate,
      "ReturnFlightDate": returnDate,
      "NoOfAdults": adults,
      "NoOfChilds": children,
      "NoOfInfants": infants,
      "cabin_class": cabinClass,
      "Currency": "USD",
    };
    var res = await apiWrapper.makeRequest(DataConstants.flightSearch,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("Search Flights response ${res.data}");
    return res;
  }

  Future<ResponseModel> flightOffer({
    required bool isLoading,
    required String searchId,
    required String offerId,
  }) async {
    var data = {"search_id": searchId, "offer_id": offerId};
    var res = await apiWrapper.makeRequest(DataConstants.flightOffer,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("Search Flight response ${res.data}");
    return res;
  }

  Future<ResponseModel> flightBook({
    required bool isLoading,
    required Map<dynamic, dynamic> body,
  }) async {
    var data = body;
    var res = await apiWrapper.makeRequest(DataConstants.flightBook,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("FlightOffer response ${res.data}");
    return res;
  }

  Future<ResponseModel> getUserFlightBookings({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.userFlightBookings, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getUserFlightBookingDetail(
      {required bool isLoading, required int bookingId}) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.userFlightBookings}/$bookingId",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> cancelFlightBookingDetail(
      {required bool isLoading, required int userId}) async {
    var res = await apiWrapper.makeRequest(
        "${DataConstants.userFlightBookings}/order_$userId",
        Request.delete,
        {},
        isLoading,
        {
          'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
          'Content-type': 'Application/json'
        });
    return res;
  }

  Future<ResponseModel> hotelsSearch(
      {required bool isLoading,
      required String destination,
      required String checkIn,
      required String checkOut,
      required String adults,
      required String children,
      required String rooms,
      required String countryCode,
      required String currency,
      required List<int> hotelTypesIds}) async {
    var data = {
      "check-in": checkIn, // check-in date, from $request->input('check-in')
      "check-out": checkOut, // checkout date, from $request->input('check-out')
      "currency":
          currency, // currency (optional in your code, but included from $request->input('currency'))
      "countryCode":
          countryCode, // This comes from the city, defaulting to 'AE' if no country found
      "destination":
          destination, // destination, from $request->input('destination')
      "NoOfChilds": children,
      "NoOfAdults": adults,
      'rooms': rooms,
      "offset": 0, // pagination offset, from $request->input('page')
      "limit": 15, // number of items per page, from $request->input('per_page')
      "facilityIds":
          [], // facilities selected, from $request->input('facility_ids')
      "hotelTypesIds":
          hotelTypesIds, // hotel types selected, from $request->input('types')
      "starRating": [] // ratings selected, from $request->input('ratings')
    };

    var res = await apiWrapper.makeRequest(DataConstants.hotelsSearch,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("HotelSearch response ${res.data}");
    return res;
  }

  Future<ResponseModel> getHotelsTypes({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper
        .makeRequest(DataConstants.hotelsTypes, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });
    return res;
  }

  Future<ResponseModel> getHotelsFacilities({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.hotelsFacilities, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });
    return res;
  }

  Future<ResponseModel> getHotelsDestinations(
      {required bool isLoading, required String search}) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.hotelsDestinations}?q=$search",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });
    return res;
  }

  Future<ResponseModel> getHotelsDetail({
    required bool isLoading,
    required int hotelId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.hotelsDetail}/hotel_$hotelId",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> hotelsBook({
    required bool isLoading,
    required String hotelId,
    required String roomId,
    required String checkIn,
    required String checkOut,
    required List guests,
    required String paymentMethod,
  }) async {
    var data = {
      "hotel_id": hotelId,
      "room_id": roomId,
      "check_in": checkIn,
      "check_out": checkOut,
      "passengers": guests,
      "payment_method": paymentMethod
    };
    var res = await apiWrapper.makeRequest(DataConstants.hotelsBook,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("HotelsBook response ${res.data}");
    return res;
  }

  Future<ResponseModel> getHotelsBookings({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.hotelsBookings, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getHotelsBookingsDetail({
    required bool isLoading,
    required int hotelId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.hotelsBookings}booking_$hotelId",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> cancelHotelsBooking({
    required bool isLoading,
    required int hotelId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.hotelsBookings}booking_$hotelId",
        Request.delete,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> activitiesSearch({
    required bool isLoading,
    required int countryId,
    required int cityId,
  }) async {
    var data = {
      "countryId": countryId,
      "cityId": cityId,
    };
    var res = await apiWrapper.makeRequest(DataConstants.activitiesSearch,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("ActivitySearch response ${res.data}");
    return res;
  }

  Future<ResponseModel> getActivitiesDetail({
    required bool isLoading,
    required int activitieId,
    int? contractId,
    String? travelDate,
  }) async {
    var data = {};

    // Build query parameters
    String queryParams = '';
    if (contractId != null) {
      queryParams += 'contractId=$contractId';
    }
    if (travelDate != null && travelDate.isNotEmpty) {
      if (queryParams.isNotEmpty) queryParams += '&';
      queryParams += 'travelDate=$travelDate';
    }

    // Build the URL with query params if they exist
    String url = '/api/v1/activities/$activitieId';
    if (queryParams.isNotEmpty) {
      url += '?$queryParams';
    }

    var res = await apiWrapper.makeRequest(url, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getActivitiesOption({
    required bool isLoading,
    required int tourId,
    required int contractId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.activitiesOption}/tour_$tourId/contract_$contractId/options",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> activitiesPrice({
    required bool isLoading,
    required int tourId,
    required int contractId,
    required String optionId,
    required String adults,
    required String children,
    required String date,
  }) async {
    var data = {
      "option_id": optionId,
      "adults": adults,
      "children": children,
      'date': date,
    };
    var res = await apiWrapper.makeRequest(
        "${DataConstants.activitiesPrice}/tour_$tourId/contract_$contractId/price",
        Request.post,
        data,
        isLoading,
        {'Content-type': 'Application/json'});

    debugPrint("ActivitiesPrice response ${res.data}");
    return res;
  }

  Future<ResponseModel> activitiesTimeSlots({
    required bool isLoading,
    required int activityId,
    required int date,
  }) async {
    var data = {
      "activity_id": activityId,
      "date": date,
    };
    var res = await apiWrapper.makeRequest(DataConstants.activitiesTimeSlots,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("ActivitiesTimeSlots response ${res.data}");
    return res;
  }

  Future<ResponseModel> activitiesBook({
    required bool isLoading,
    required int activityId,
    required int optionId,
    required String date,
    required String timeSlot,
    required String adults,
    required String children,
    required String paymentMethod,
  }) async {
    var data = {
      "activity_id": activityId,
      "option_id": optionId,
      "date": date,
      "time_slot": timeSlot,
      "adults": adults,
      "children": children,
      "payment_method": paymentMethod,
    };
    var res = await apiWrapper.makeRequest(DataConstants.activitiesBook,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("ActivitiesBook response ${res.data}");
    return res;
  }

  Future<ResponseModel> getUserActivitiesBookings({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.userActivitiesBookings, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getUserActivitiesBookingsDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.userActivitiesBookings}/booking$bookingId",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> cancelActivitiesBookings({
    required bool isLoading,
    required int bookingId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.userActivitiesBookings}/booking$bookingId",
        Request.delete,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getHolidayCountries({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.holidaysCountries, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getHolidayCities({
    required bool isLoading,
    required String country,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.holidaysCities}?country=$country",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> holidaysSearch(
      {required bool isLoading, required city, required country}) async {
    var data = {
      "city": city,
      "country": country,
    };
    var res = await apiWrapper.makeRequest(DataConstants.holidaysSearch,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("GetHolidaysCities response ${res.data}");
    return res;
  }

  Future<ResponseModel> getHolidaysDetail({
    required bool isLoading,
    required int holidayId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.holidaysSearch}holiday$holidayId",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> holidaysBook({
    required bool isLoading,
    required String holidayId,
    required String departureDate,
    required String adults,
    required String children,
    required List passengers,
    required String paymentMethod,
  }) async {
    var data = {
      "holiday_id": holidayId,
      "departure_date": departureDate,
      "adults": adults,
      "children": children,
      "passengers": passengers,
      "payment_method": paymentMethod
    };
    var res = await apiWrapper.makeRequest(DataConstants.hotelsBook,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("HolidaysBook response ${res.data}");
    return res;
  }

  Future<ResponseModel> userHolidaysBooking({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.holidaysBookings, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> userHolidaysBookingDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.holidaysSearch}booking_$bookingId",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> cancelHolidaysBookingDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.holidaysSearch}booking_$bookingId",
        Request.delete,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getVisaCountries({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.visaCountries, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getVisaTypes({
    required bool isLoading,
    required int visaType,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.visaCountries}/$visaType",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> visaApply({
    required bool isLoading,
    required String countryId,
    required String visaTypeId,
    required String purpose,
    required String entryDate,
    required String exitDate,
    required List applicant,
    required List documents,
  }) async {
    var data = {
      "country_id": countryId,
      "visa_type_id": visaTypeId,
      "purpose": purpose,
      "entry_date": entryDate,
      "exit_date": exitDate,
      "applicant": applicant,
      "documents": documents,
    };
    var res = await apiWrapper.makeRequest(DataConstants.visaApply,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("VisaApply response ${res.data}");
    return res;
  }

  Future<ResponseModel> getVisaApplications({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.visaApplications, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getVisaApplicationsDetail({
    required bool isLoading,
    required int applicationId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.visaApplications}app_$applicationId",
        Request.get,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> cancelVisaApplications({
    required bool isLoading,
    required int applicationId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.visaApplications}app_$applicationId",
        Request.delete,
        data,
        isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getDashboardOverview({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.dashboardOverview, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getDashboardRecentBooking({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.dashboardRecentBooking, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getDashboardUpcomingTrips({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.dashboardUpcomingTrips, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getNotification({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.notifications, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> updateNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.updateProfile}/notif_$notifcationId/read",
        Request.put,
        data,
        isLoading,
        {'Content-type': 'Application/json'});

    debugPrint("UpdateNotification response ${res.data}");
    return res;
  }

  Future<ResponseModel> deleteNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        "${DataConstants.updateProfile}/notif_$notifcationId",
        Request.delete,
        data,
        isLoading,
        {'Content-type': 'Application/json'});

    debugPrint("DeleteNotification response ${res.data}");
    return res;
  }

  Future<ResponseModel> getAllUser({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper
        .makeRequest(DataConstants.adminUser, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getAllBookings({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.adminBookings, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getAllStatistics({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.adminStatistics, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getAgentDashboard({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.agentDashboard, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getAgentCustomers({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.agentCustomers, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> getAgentBookings({
    required bool isLoading,
  }) async {
    var data = {};
    var res = await apiWrapper.makeRequest(
        DataConstants.agentBookings, Request.get, data, isLoading, {
      'Authorization': 'Bearer ${SharedPrefUtil.authToken}',
      'Content-type': 'Application/json'
    });

    return res;
  }

  Future<ResponseModel> fcmToken({
    required bool isLoading,
    required String token,
  }) async {
    var data = {
      "token": token,
    };
    var res = await apiWrapper.makeRequest(DataConstants.visaApply,
        Request.post, data, isLoading, {'Content-type': 'Application/json'});

    debugPrint("Fcm Token response ${res.data}");
    return res;
  }
}
