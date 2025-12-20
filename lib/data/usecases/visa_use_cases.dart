import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_visa_applications_response.dart';
import 'package:hybridtravelagency/data/responses/get_visa_countries_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';

class VisaUseCases {
  VisaUseCases(this._repository);

  final Repository _repository;

  Future<GetVisaCountriesResponse?> getVisaCountries({
    required bool isLoading,
  }) async =>
      await _repository.getVisaCountries(
        isLoading: isLoading,
      );
  Future<GetArtsResponse?> getVisaTypes(
          {required bool isLoading, required int visaType}) async =>
      await _repository.getVisaTypes(
        isLoading: isLoading,
        visaType: visaType,
      );

  Future<RegisterResponse?> visaApply({
    required bool isLoading,
    required String countryId,
    required String visaTypeId,
    required String purpose,
    required String entryDate,
    required String exitDate,
    required List applicant,
    required List documents,
  }) async =>
      await _repository.visaApply(
          isLoading: isLoading,
          countryId: countryId,
          visaTypeId: visaTypeId,
          purpose: purpose,
          entryDate: entryDate,
          exitDate: exitDate,
          applicant: applicant,
          documents: documents);

  Future<GetUserVisaApplicationsResponse?> getVisaApplications({
    required bool isLoading,
  }) async =>
      await _repository.getVisaApplications(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getVisaApplicationsDetail(
          {required bool isLoading, required int applicationId}) async =>
      await _repository.getVisaApplicationsDetail(
        isLoading: isLoading,
        applicationId: applicationId,
      );
  Future<GetArtsResponse?> cancelVisaApplications(
          {required bool isLoading, required int applicationId}) async =>
      await _repository.cancelVisaApplications(
        isLoading: isLoading,
        applicationId: applicationId,
      );
}
