import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/airports_response.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/data/responses/currencies_response.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';
import 'package:hybridtravelagency/data/responses/get_current_user_response.dart';
import 'package:hybridtravelagency/data/responses/get_holiday_countries_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_facilities_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_types_response.dart';
import 'package:hybridtravelagency/data/responses/get_visa_countries_response.dart';
import 'package:hybridtravelagency/data/responses/search_activities_response.dart';

class UserDashboardUseCases {
  UserDashboardUseCases(this._repository);

  final Repository _repository;

  Future<GetCurrentUserResponse?> getCurrentUser({
    required bool isLoading,
  }) async =>
      await _repository.getCurrentUser(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getDashboardOverview({
    required bool isLoading,
  }) async =>
      await _repository.getDashboardOverview(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getDashboardRecentBooking({
    required bool isLoading,
  }) async =>
      await _repository.getDashboardRecentBooking(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getDashboardUpcomingTrips({
    required bool isLoading,
  }) async =>
      await _repository.getDashboardUpcomingTrips(
        isLoading: isLoading,
      );

  Future<CountriesResponse?> getCountries({
    required bool isLoading,
  }) async =>
      await _repository.getCountries(
        isLoading: isLoading,
      );
  Future<CitiesResponse?> getCities({
    required bool isLoading,
    required int countryId,

  }) async =>
      await _repository.getCities(
        isLoading: isLoading,
          countryId: countryId
      );

  Future<AirportsResponse?> getAirports({
    required bool isLoading,
    required String query
  }) async =>
      await _repository.getAirports(
        isLoading: isLoading,
          query: query
      );
  Future<CurrenciesResponse?> getCurrencies({
    required bool isLoading,
  }) async =>
      await _repository.getCurrencies(
        isLoading: isLoading,
      );

  Future<GetVisaCountriesResponse?> getVisaCountries({
    required bool isLoading,
  }) async =>
      await _repository.getVisaCountries(
        isLoading: isLoading,
      );

  Future<GetHotelTypesResponse?> getHotelsTypes(
      {required bool isLoading}) async =>
      await _repository.getHotelsTypes(
        isLoading: isLoading,

      );

  Future<GetHotelFacilitiesResponse?> getHotelsFacilities(
      {required bool isLoading,}) async =>
      await _repository.getHotelsFacilities(
        isLoading: isLoading,

      );

  Future<GetHolidayCountriesResponse?> getHolidayCountries(
      {required bool isLoading,}) async =>
      await _repository.getHolidayCountries(
        isLoading: isLoading,
      );

  Future<SearchActivitiesResponse?> activitiesSearch({
    required bool isLoading,
    required int countryId,
    required int cityId,

  }) async =>
      await _repository.activitiesSearch(
          isLoading: isLoading,
          countryId: countryId,
          cityId:cityId
      );
}
