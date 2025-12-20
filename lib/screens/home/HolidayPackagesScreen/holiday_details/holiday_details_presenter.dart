import 'package:hybridtravelagency/data/responses/search_holidays_response.dart';
import 'package:hybridtravelagency/data/usecases/holidays_use_cases.dart';

class HolidayDetailsPresenter {
  HolidayDetailsPresenter(this._holidaysUseCases);

  final HolidaysUseCases _holidaysUseCases;

  // Since we're using HolidayData from search results,
  // we can fetch fresh data if needed using the same search endpoint
  Future<SearchHolidaysResponse?> searchHolidays({
    required bool isLoading,
    required String city,
    required String country,
  }) async =>
      await _holidaysUseCases.holidaysSearch(
        isLoading: isLoading,
        city: city,
        country: country,
      );
}










