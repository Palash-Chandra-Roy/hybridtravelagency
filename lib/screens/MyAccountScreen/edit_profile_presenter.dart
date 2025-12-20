import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/usecases/auth_use_cases.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';
import 'package:hybridtravelagency/data/usecases/user_dashboard_use_cases.dart';

class EditProfilePresenter {
  EditProfilePresenter(this._authUseCases, this._userDashboardUseCases);

  final AuthUseCases _authUseCases;
  final UserDashboardUseCases _userDashboardUseCases;

  Future<RegisterResponse?> updateProfile({
    required bool isLoading,
    required String name,
    required String phone,
    required String address,
    required String city,
    required String country,
  }) async =>
      await _authUseCases.updateProfile(
        isLoading: isLoading,
        name: name,
        phone: phone,
        address: address,
        city: city,
        country: country,
      );

  Future<CitiesResponse?> getCities({
    required bool isLoading,
    required int countryId,
  }) async =>
      await _userDashboardUseCases.getCities(
        isLoading: isLoading,
        countryId: countryId,
      );
}
