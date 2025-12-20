import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/data/usecases/activities_use_cases.dart';

class MyActivityPresenter {
  MyActivityPresenter(this._activitiesUseCases);

  final ActivitiesUseCases _activitiesUseCases;

  Future<GetUserActivityBookingsResponse?> getUserActivitiesBookings({
    required bool isLoading,
  }) async =>
      await _activitiesUseCases.getUserActivitiesBookings(
        isLoading: isLoading,
      );

}
