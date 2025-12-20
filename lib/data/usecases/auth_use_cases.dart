import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_current_user_response.dart';
import 'package:hybridtravelagency/data/responses/login_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';

/// Use case for getting the data from the API
class AuthUseCases {
  AuthUseCases(this._repository);

  final Repository _repository;

  Future<LoginResponse?> login({
    required bool isLoading,
    required String email,
    required password,
  }) async =>
      await _repository.login(
          isLoading: isLoading, email: email, password: password);

  Future<RegisterResponse?> register({
    required bool isLoading,
    required String name,
    required String password,
    required String email,
    required String passwordConfirmation,
    required String phone,
  }) async =>
      await _repository.register(
          isLoading: isLoading,
          name: name,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          phone: phone);

  Future<GetCurrentUserResponse?> getCurrentUser({
    required bool isLoading,
  }) async =>
      await _repository.getCurrentUser(
        isLoading: isLoading,
      );

  Future<RegisterResponse?> updateProfile({
    required bool isLoading,
    required String name,
    required String phone,
    required String address,
    required String city,
    required String country,
  }) async =>
      await _repository.updateProfile(
          isLoading: isLoading,
          name: name,
          phone: phone,
          address: address,
          city: city,
          country: country);

  Future<RegisterResponse?> logout({
    required bool isLoading,
  }) async =>
      await _repository.logout(
        isLoading: isLoading,
      );
}
