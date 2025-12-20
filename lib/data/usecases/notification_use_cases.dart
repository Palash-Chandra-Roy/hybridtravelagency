import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';

class NotificationUseCases {
  NotificationUseCases(this._repository);

  final Repository _repository;

  Future<GetArtsResponse?> getNotification({
    required bool isLoading,
  }) async =>
      await _repository.getNotification(
        isLoading: isLoading,
      );
  Future<GetArtsResponse?> updateNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async =>
      await _repository.updateNotifcation(
        isLoading: isLoading,
        notifcationId: notifcationId,
      );

 Future<GetArtsResponse?> deleteNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async =>
      await _repository.deleteNotifcation(
        isLoading: isLoading,
        notifcationId: notifcationId,
      );


}