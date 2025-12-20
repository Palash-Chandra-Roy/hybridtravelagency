import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_flight_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_hotel_bookings_response.dart';

class MyTripUseCases {
  MyTripUseCases(this._repository);

  final Repository _repository;

  // Flight Bookings
  Future<GetUserFlightBookingsResponse?> getUserFlightBookings({
    required bool isLoading,
  }) async =>
      await _repository.getUserFlightBookings(
        isLoading: isLoading,
      );

  // Activities Bookings
  Future<GetUserActivityBookingsResponse?> getUserActivitiesBookings({
    required bool isLoading,
  }) async =>
      await _repository.getUserActivitiesBookings(
        isLoading: isLoading,
      );

  // Hotels Bookings
  Future<GetUserHotelBookingsResponse?> getHotelsBookings({
    required bool isLoading,
  }) async =>
      await _repository.getHotelsBookings(
        isLoading: isLoading,
      );

  // Holidays Bookings
  Future<GetUserHolidayBookingsResponse?> getUserHolidaysBookings({
    required bool isLoading,
  }) async =>
      await _repository.userHolidaysBooking(
        isLoading: isLoading,
      );
}
