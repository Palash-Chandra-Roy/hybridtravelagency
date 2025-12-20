import 'package:hybridtravelagency/data/responses/airports_response.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/data/responses/currencies_response.dart';
import 'package:hybridtravelagency/data/repositories/repository.dart';

class CommonDataUseCases {
  CommonDataUseCases(this._repository);
  final Repository _repository;

  Future<CountriesResponse?> getCountries({
    required bool isLoading,
    required String sort,
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
}
