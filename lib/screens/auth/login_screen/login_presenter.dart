
import 'package:hybridtravelagency/data/responses/login_response.dart';
import 'package:hybridtravelagency/data/usecases/auth_use_cases.dart';

class LoginPresenter {
  LoginPresenter(this._authUseCases);

  final AuthUseCases _authUseCases;

  Future<LoginResponse?> login(
          {required bool isLoading,
          required String password,
          required String email}) async =>
      await _authUseCases.login(isLoading: isLoading, password: password, email: email);

  // Future<LoginResponse?>  register({
  //   required bool isLoading,
  //   required String name,
  //   required String password,
  //   required String email,
  //   required String nameIdentifier,
  //   required int registrationTypeId,
  //   required String countryCode,
  // })
  // async =>
  //     await _authUseCases.register(
  //       isLoading: isLoading,
  //       name: name,
  //       email: email,
  //       password: password,
  //       nameIdentifier: nameIdentifier,
  //       registrationTypeId: registrationTypeId,
  //       countryCode: countryCode,
  //     );
  // Future<LoginResponse?>  socialLogin({
  //   required bool isLoading,
  //   required String name,
  //   required String email,
  //   required String nameIdentifier,
  //   required int registrationTypeId,
  //   required String countryCode,
  // })
  // async =>
  //     await _authUseCases.socialLogin(
  //       isLoading: isLoading,
  //       name: name,
  //       email: email,
  //       nameIdentifier: nameIdentifier,
  //       registrationTypeId: registrationTypeId,
  //       countryCode: countryCode,
  //     );
}
