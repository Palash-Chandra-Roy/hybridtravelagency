import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_flight_booking_details_response.dart';
import 'package:hybridtravelagency/screens/my_flight_details/my_flight_details_presenter.dart';

class MyFlightDetailsController extends GetxController
    with GetTickerProviderStateMixin {
  MyFlightDetailsController(this._myflightDetailsPresenter);
  final MyFlightDetailsPresenter _myflightDetailsPresenter;
  bool isLoading = false;
  GetFlightBookingDetailsResponse? booking;
  // Assuming total booking amount is passed separately or calculated
  // Helper to safely access nested data for a single flight (first slice, first segment)
  Segments? get firstSegment {
    return booking!.data?.data?.slices?.first.segments?.first;
  }

  Slices? get firstSlice {
    return booking!.data?.data?.slices?.first;
  }

  Passengers? get firstPassenger {
    return booking!.data?.data?.passengers?.first;
  }

  // Helper for round trip - second slice (return flight)
  Segments? get secondSegment {
    if (booking!.data?.data?.slices != null &&
        booking!.data!.data!.slices!.length > 1) {
      return booking!.data!.data!.slices![1].segments?.first;
    }
    return null;
  }

  Slices? get secondSlice {
    if (booking!.data?.data?.slices != null &&
        booking!.data!.data!.slices!.length > 1) {
      return booking!.data!.data!.slices![1];
    }
    return null;
  }

  bool get isRoundTrip {
    return booking?.flight?.tripType == 'R' ||
        (booking!.data?.data?.slices != null &&
            booking!.data!.data!.slices!.length > 1);
  }

  int bookingId = -1;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (Get.arguments != null) {
        bookingId = Get.arguments['bookingId'] ?? '';
        getUserFlightBookingDetail(bookingId);
      }
    });
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getUserFlightBookingDetail(int bookingId) async {
    setLoading(true);
    try {
      final response = await _myflightDetailsPresenter
          .getUserFlightBookingDetail(isLoading: false, bookingId: bookingId);

      if (response != null && response.data != null) {
        booking = response;
      }
    } catch (e) {
      debugPrint("Flight Details error: $e");
    } finally {
      setLoading(false);
    }
  }
}
