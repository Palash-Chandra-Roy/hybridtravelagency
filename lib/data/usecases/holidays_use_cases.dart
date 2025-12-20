import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';
import 'package:hybridtravelagency/data/responses/get_holiday_cities_response.dart';
import 'package:hybridtravelagency/data/responses/get_holiday_countries_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';
import 'package:hybridtravelagency/data/responses/search_holidays_response.dart';

class HolidaysUseCases {
  HolidaysUseCases(this._repository);

  final Repository _repository;

  Future<GetHolidayCountriesResponse?> getHolidayCountries({
    required bool isLoading,
  }) async =>
      await _repository.getHolidayCountries(
        isLoading: isLoading,
      );

  Future<GetHolidayCitiesResponse?> getHolidayCities(
          {required bool isLoading, required String country}) async =>
      await _repository.getHolidayCities(
          isLoading: isLoading, country: country);

  Future<SearchHolidaysResponse?> holidaysSearch(
          {required bool isLoading, required city, required country}) async =>
      await _repository.holidaysSearch(
        isLoading: isLoading,
        city: city,
        country: country,
      );

  Future<GetArtsResponse?> getHolidaysDetail(
          {required bool isLoading, required int holidayId}) async =>
      await _repository.getHolidaysDetail(
        isLoading: isLoading,
        holidayId: holidayId,
      );

  Future<RegisterResponse?> holidaysBook({
    required bool isLoading,
    required String holidayId,
    required String departureDate,
    required String adults,
    required String children,
    required List passengers,
    required String paymentMethod,
  }) async =>
      await _repository.holidaysBook(
        isLoading: isLoading,
        holidayId: holidayId,
        departureDate: departureDate,
        adults: adults,
        children: children,
        passengers: passengers,
        paymentMethod: paymentMethod,
      );

  Future<GetUserHolidayBookingsResponse?> userHolidaysBooking({
    required bool isLoading,
  }) async =>
      await _repository.userHolidaysBooking(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> userHolidaysBookingDetail(
          {required bool isLoading, required int bookingId}) async =>
      await _repository.userHolidaysBookingDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
  Future<GetArtsResponse?> cancelHolidaysBookingDetail(
          {required bool isLoading, required int bookingId}) async =>
      await _repository.cancelHolidaysBookingDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
}
