import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';

class AdminUseCases {
  AdminUseCases(this._repository);

  final Repository _repository;

  Future<GetArtsResponse?> getAllUser({
    required bool isLoading,
  }) async =>
      await _repository.getAllUser(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getAllBookings({
    required bool isLoading,
  }) async =>
      await _repository.getAllBookings(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getAllStatistics({
    required bool isLoading,
  }) async =>
      await _repository.getAllStatistics(
        isLoading: isLoading,
      );
}