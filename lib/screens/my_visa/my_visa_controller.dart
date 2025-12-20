import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_user_visa_applications_response.dart';
import 'package:hybridtravelagency/screens/my_visa/my_visa_presenter.dart';

class MyVisaController extends GetxController with GetTickerProviderStateMixin {
  MyVisaController(this._myVisaPresenter);
  final MyVisaPresenter _myVisaPresenter;
  bool isLoading = false;
  List<VisaApplicationData>? bookings;

  @override
  void onInit() {
    super.onInit();
    getVisaApplications();
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getVisaApplications() async {
    setLoading(true);
    try {
      final response = await _myVisaPresenter.getVisaApplications(
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
