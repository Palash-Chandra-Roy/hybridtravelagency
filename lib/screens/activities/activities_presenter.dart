

import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/search_activities_response.dart';
import 'package:hybridtravelagency/data/usecases/activities_use_cases.dart';

class ActivitiesPresenter {
  ActivitiesPresenter(this._activitiesUseCases);

  final ActivitiesUseCases _activitiesUseCases;

  Future<SearchActivitiesResponse?> activitiesSearch({
    required bool isLoading,
    required int countryId,
    required int cityId,

  }) async =>
      await _activitiesUseCases.activitiesSearch(
          isLoading: isLoading,
          countryId: countryId,
          cityId:cityId
      );

  Future<CitiesResponse?> getCities({
    required bool isLoading,
    required int countryId,

  }) async =>
      await _activitiesUseCases.getCities(
          isLoading: isLoading,
          countryId: countryId
      );

}
