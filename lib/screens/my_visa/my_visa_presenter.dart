import 'package:hybridtravelagency/data/responses/get_user_visa_applications_response.dart';
import 'package:hybridtravelagency/data/usecases/visa_use_cases.dart';

class MyVisaPresenter {
  MyVisaPresenter(this._visaUseCases);

  final VisaUseCases _visaUseCases;

  Future<GetUserVisaApplicationsResponse?> getVisaApplications({
    required bool isLoading,
  }) async =>
      await _visaUseCases.getVisaApplications(
        isLoading: isLoading,
      );
}
