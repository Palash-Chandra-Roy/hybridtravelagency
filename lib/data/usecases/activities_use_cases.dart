import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/get_activities_time_slots_response.dart';
import 'package:hybridtravelagency/data/responses/get_activity_details_response.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';
import 'package:hybridtravelagency/data/responses/search_activities_response.dart';

class ActivitiesUseCases {
  ActivitiesUseCases(this._repository);

  final Repository _repository;

  Future<SearchActivitiesResponse?> activitiesSearch({
    required bool isLoading,
    required int countryId,
    required int cityId,
  }) async =>
      await _repository.activitiesSearch(
          isLoading: isLoading, countryId: countryId, cityId: cityId);

  Future<GetActivityDetailsResponse?> getActivitiesDetail({
    required bool isLoading,
    required int activitieId,
    int? contractId,
    String? travelDate,
  }) async =>
      await _repository.getActivitiesDetail(
        isLoading: isLoading,
        activitieId: activitieId,
        contractId: contractId,
        travelDate: travelDate,
      );
  Future<GetArtsResponse?> getActivitiesOption({
    required bool isLoading,
    required int tourId,
    required int contractId,
  }) async =>
      await _repository.getActivitiesOption(
        isLoading: isLoading,
        tourId: tourId,
        contractId: contractId,
      );

  Future<RegisterResponse?> activitiesPrice({
    required bool isLoading,
    required int tourId,
    required int contractId,
    required String optionId,
    required String adults,
    required String children,
    required String date,
  }) async =>
      await _repository.activitiesPrice(
        isLoading: isLoading,
        tourId: tourId,
        contractId: contractId,
        optionId: optionId,
        adults: adults,
        children: children,
        date: date,
      );
  Future<GetActivitiesTimeSlotsResponse?> activitiesTimeSlots({
    required bool isLoading,
    required int activityId,
    required int date,
  }) async =>
      await _repository.activitiesTimeSlots(
          isLoading: isLoading, activityId: activityId, date: date);

  Future<RegisterResponse?> activitiesBook({
    required bool isLoading,
    required int activityId,
    required int optionId,
    required String date,
    required String timeSlot,
    required String adults,
    required String children,
    required String paymentMethod,
  }) async =>
      await _repository.activitiesBook(
        isLoading: isLoading,
        activityId: activityId,
        optionId: optionId,
        date: date,
        timeSlot: timeSlot,
        adults: adults,
        children: children,
        paymentMethod: paymentMethod,
      );

  Future<GetUserActivityBookingsResponse?> getUserActivitiesBookings({
    required bool isLoading,
  }) async =>
      await _repository.getUserActivitiesBookings(
        isLoading: isLoading,
      );
  Future<GetArtsResponse?> getUserActivitiesBookingsDetail({
    required bool isLoading,
    required int bookingId,
  }) async =>
      await _repository.getUserActivitiesBookingsDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
  Future<GetArtsResponse?> cancelActivitiesBookings({
    required bool isLoading,
    required int bookingId,
  }) async =>
      await _repository.cancelActivitiesBookings(
        isLoading: isLoading,
        bookingId: bookingId,
      );

  Future<CitiesResponse?> getCities({
    required bool isLoading,
    required int countryId,
  }) async =>
      await _repository.getCities(isLoading: isLoading, countryId: countryId);
}
