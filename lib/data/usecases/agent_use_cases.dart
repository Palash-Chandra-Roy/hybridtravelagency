import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';

class AgentUseCases {
  AgentUseCases(this._repository);

  final Repository _repository;

  Future<GetArtsResponse?> getAgentDashboard({
    required bool isLoading,
  }) async =>
      await _repository.getAgentDashboard(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getAgentCustomers({
    required bool isLoading,
  }) async =>
      await _repository.getAgentCustomers(
        isLoading: isLoading,
      );

  Future<GetArtsResponse?> getAgentBookings({
    required bool isLoading,
  }) async =>
      await _repository.getAgentBookings(
        isLoading: isLoading,
      );
}