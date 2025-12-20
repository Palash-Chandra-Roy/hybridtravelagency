import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_user_flight_bookings_response.dart';
import 'package:hybridtravelagency/screens/my_flight/my_flight_presenter.dart';

class MyFlightController extends GetxController
    with GetTickerProviderStateMixin {
  MyFlightController(this._myflightPresenter);
  final MyFlightPresenter _myflightPresenter;
  bool isLoading = false;
  List<FlightBookingData>? bookings;

  @override
  void onInit() {
    super.onInit();
    getUserFlightsBooking();
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getUserFlightsBooking() async {
    setLoading(true);
    try {
      final response = await _myflightPresenter.getUserFlightBookings(
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
