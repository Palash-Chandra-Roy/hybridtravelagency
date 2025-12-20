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
import 'package:hybridtravelagency/data/usecases/user_dashboard_use_cases.dart';

class NavigationPresenter {
  NavigationPresenter(this._userDashboardUseCases);

  final UserDashboardUseCases _userDashboardUseCases;

  Future<GetCurrentUserResponse?> getCurrentUser({
    required bool isLoading,
  }) async =>
      await _userDashboardUseCases.getCurrentUser(isLoading: isLoading);

  Future<GetArtsResponse?> getDashboardOverview({
    required bool isLoading,
  }) async =>
      await _userDashboardUseCases.getDashboardOverview(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getDashboardRecentBooking({
    required bool isLoading,
  }) async =>
      await _userDashboardUseCases.getDashboardRecentBooking(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getDashboardUpcomingTrips({
    required bool isLoading,
  }) async =>
      await _userDashboardUseCases.getDashboardUpcomingTrips(
        isLoading: isLoading,
      );

  Future<CountriesResponse?> getCountries({
    required bool isLoading,
  }) async =>
      await _userDashboardUseCases.getCountries(
        isLoading: isLoading,
      );
  Future<CitiesResponse?> getCities({
    required bool isLoading,
    required int countryId,
  }) async =>
      await _userDashboardUseCases.getCities(
          isLoading: isLoading, countryId: countryId);

  Future<AirportsResponse?> getAirports({
    required bool isLoading,
    required String query
  }) async =>
      await _userDashboardUseCases.getAirports(
        isLoading: isLoading,
        query: query
      );
  Future<CurrenciesResponse?> getCurrencies({
    required bool isLoading,
  }) async =>
      await _userDashboardUseCases.getCurrencies(
        isLoading: isLoading,
      );

  Future<GetVisaCountriesResponse?> getVisaCountries({
    required bool isLoading,
  }) async =>
      await _userDashboardUseCases.getVisaCountries(
        isLoading: isLoading,
      );

  Future<GetHotelTypesResponse?> getHotelsTypes(
      {required bool isLoading}) async =>
      await _userDashboardUseCases.getHotelsTypes(
        isLoading: isLoading,

      );

  Future<GetHotelFacilitiesResponse?> getHotelsFacilities(
      {required bool isLoading,}) async =>
      await _userDashboardUseCases.getHotelsFacilities(
        isLoading: isLoading,

      );

  Future<GetHolidayCountriesResponse?> getHolidayCountries(
      {required bool isLoading,}) async =>
      await _userDashboardUseCases.getHolidayCountries(
        isLoading: isLoading,
      );

  Future<SearchActivitiesResponse?> activitiesSearch({
    required bool isLoading,
    required int countryId,
    required int cityId,

  }) async =>
      await _userDashboardUseCases.activitiesSearch(
          isLoading: isLoading,
          countryId: countryId,
          cityId:cityId
      );
}
