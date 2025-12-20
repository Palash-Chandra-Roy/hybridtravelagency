import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:hybridtravelagency/data/responses/search_holidays_response.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_package_detail_screen.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_packages_presenter.dart';

class HolidayPackagesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HolidayPackagesController(this._holidaysPackagesPresenter);
  final HolidayPackagesPresenter _holidaysPackagesPresenter;
  dynamic selectedIndex;
  final TextEditingController searchController = TextEditingController();
  RxInt sliderIndex = 0.obs;

  bool isLoading = false;
  bool isBookingLoading = false;
  List<Offers> sortedOffers = [];
  List<Offers> allOffers = [];
  List<HolidayData> holidaysList = [];
  List<String> citiesList = [];
  String country = '';
  String city = '';
  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> setLocation(String location) async {
    if (location.contains(',')) {
      final parts = location.split(',');
      city = parts.first.trim();
      country = parts.last.trim();
    } else {
      // If there's no comma, treat the same string as both
      city = location;
      country = "";
    }
    searchHolidays();
    update();
    // Navigate to detail screen after search completes
    Get.to(() => HolidayPackageDetailScreen());
  }

  Future<void> holidaysCities(String country) async {
    setLoading(true);
    try {
      final response = await _holidaysPackagesPresenter.getHolidayCities(
          isLoading: false, country: country);

      if (response != null && response.data != null) {
        citiesList = response.data!;
      }
    } catch (e) {
      debugPrint("Cities error: $e");
    } finally {
      setLoading(false);
    }
  }

  Future<void> searchHolidays() async {
    setLoading(true);
    try {
      final response = await _holidaysPackagesPresenter.holidaysSearch(
          isLoading: false, city: city, country: country);

      if (response != null && response.data != null) {
        holidaysList = response.data!.data!;
      }
    } catch (e) {
      debugPrint("Search Flight error: $e");
    } finally {
      setLoading(false);
    }
  }
}
