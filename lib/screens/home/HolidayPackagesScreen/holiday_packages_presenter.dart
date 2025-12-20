

import 'package:hybridtravelagency/data/responses/get_holiday_cities_response.dart';
import 'package:hybridtravelagency/data/responses/search_holidays_response.dart';
import 'package:hybridtravelagency/data/usecases/holidays_use_cases.dart';

class HolidayPackagesPresenter {
  HolidayPackagesPresenter(this._holidaysUseCases);

  final HolidaysUseCases _holidaysUseCases;

  Future<GetHolidayCitiesResponse?> getHolidayCities(
      {required bool isLoading,
        required String country}) async =>
      await _holidaysUseCases.getHolidayCities(
          isLoading: isLoading,
          country: country
      );

  Future<SearchHolidaysResponse?> holidaysSearch({
    required bool isLoading,
    required city,
    required country
  }) async =>
      await _holidaysUseCases.holidaysSearch(
        isLoading: isLoading,
        city: city,
        country: country,);

}
