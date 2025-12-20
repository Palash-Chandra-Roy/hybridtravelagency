import 'package:hybridtravelagency/data/responses/get_activity_details_response.dart';
import 'package:hybridtravelagency/data/usecases/activities_use_cases.dart';

class ActivityDetailsPresenter {
  ActivityDetailsPresenter(this._activitiesUseCases);

  final ActivitiesUseCases _activitiesUseCases;

  Future<GetActivityDetailsResponse?> getActivityDetails({
    required bool isLoading,
    required int activityId,
    int? contractId,
    String? travelDate,
  }) async =>
      await _activitiesUseCases.getActivitiesDetail(
        isLoading: isLoading,
        activitieId: activityId,
        contractId: contractId,
        travelDate: travelDate,
      );
}
