import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_flight_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_hotel_bookings_response.dart';
import 'package:hybridtravelagency/data/usecases/my_trip_use_cases.dart';

class MyTripPresenter {
  MyTripPresenter(this._myTripUseCases);

  final MyTripUseCases _myTripUseCases;

  // Flight Bookings
  Future<GetUserFlightBookingsResponse?> getUserFlightBookings({
    required bool isLoading,
  }) async =>
      await _myTripUseCases.getUserFlightBookings(
        isLoading: isLoading,
      );

  // Activities Bookings
  Future<GetUserActivityBookingsResponse?> getUserActivitiesBookings({
    required bool isLoading,
  }) async =>
      await _myTripUseCases.getUserActivitiesBookings(
        isLoading: isLoading,
      );

  // Hotels Bookings
  Future<GetUserHotelBookingsResponse?> getHotelsBookings({
    required bool isLoading,
  }) async =>
      await _myTripUseCases.getHotelsBookings(
        isLoading: isLoading,
      );

  // Holidays Bookings
  Future<GetUserHolidayBookingsResponse?> getUserHolidaysBookings({
    required bool isLoading,
  }) async =>
      await _myTripUseCases.getUserHolidaysBookings(
        isLoading: isLoading,
      );
}
