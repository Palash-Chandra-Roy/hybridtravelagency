import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/screens/my_holidays/my_holidays_presenter.dart';

class MyHolidaysController extends GetxController
    with GetTickerProviderStateMixin {
  MyHolidaysController(this._myHolidaysPresenter);
  final MyHolidaysPresenter _myHolidaysPresenter;
  bool isLoading = false;
  List<HolidayBookingData>? bookings;
  @override
  void onInit() {
    super.onInit();
    getUserHolidaysBooking();
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getUserHolidaysBooking() async {
    setLoading(true);
    try {
      final response = await _myHolidaysPresenter.userHolidaysBooking(
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
