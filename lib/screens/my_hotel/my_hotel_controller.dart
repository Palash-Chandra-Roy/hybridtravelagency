import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_user_hotel_bookings_response.dart';
import 'package:hybridtravelagency/screens/my_hotel/my_hotel_presenter.dart';

class MyHotelController extends GetxController
    with GetTickerProviderStateMixin {
  MyHotelController(this._myHotelPresenter);
  final MyHotelPresenter _myHotelPresenter;
  bool isLoading = false;
  List<HotelBookingData>? bookings;

  @override
  void onInit() {
    super.onInit();
    getHotelsBookings();
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getHotelsBookings() async {
    setLoading(true);
    try {
      final response = await _myHotelPresenter.getHotelsBookings(
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
