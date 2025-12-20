import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';

class FcmTokenUseCases {
  FcmTokenUseCases(this._repository);

  final Repository _repository;

  Future<RegisterResponse?> fcmToken({
    required bool isLoading,
    required String token,
  }) async =>
      await _repository.fcmToken(
        isLoading: isLoading,
        token: token,);



}