import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/screens/my_activity/my_activity_presenter.dart';

class MyActivityController extends GetxController
    with GetTickerProviderStateMixin {
  MyActivityController(this._myActivityPresenter);
  final MyActivityPresenter _myActivityPresenter;
  bool isLoading = false;
  List<ActivityData>? bookings;

  @override
  void onInit() {
    super.onInit();
    getUserActivitiesBookings();
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getUserActivitiesBookings() async {
    setLoading(true);
    try {
      final response = await _myActivityPresenter.getUserActivitiesBookings(
        isLoading: false,
      );

      if (response != null && response.data != null) {
        bookings = response.data!;
      }
    } catch (e) {
      debugPrint("Holidays Booking error: $e");
    } finally {
      setLoading(false);
    }
  }
}
