import 'package:hybridtravelagency/data/responses/get_current_user_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';
import 'package:hybridtravelagency/data/usecases/auth_use_cases.dart';

class RegisterPresenter {
  RegisterPresenter(this._authUseCases);

  final AuthUseCases _authUseCases;

  Future<RegisterResponse?> register({
    required bool isLoading,
    required String name,
    required String password,
    required String email,
    required String passwordConfirmation,
    required String phone,
  }) async =>
      await _authUseCases.register(
          isLoading: isLoading,
          name: name,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          phone: phone);

  Future<GetCurrentUserResponse?> getCurrentUser({
    required bool isLoading,
  }) async =>
      await _authUseCases.getCurrentUser(
        isLoading: isLoading,
      );
}
