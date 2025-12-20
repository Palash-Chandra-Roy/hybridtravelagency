import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/search_holidays_response.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_details/holiday_details_presenter.dart';

class HolidayDetailsController extends GetxController {
  HolidayDetailsController(this._holidayDetailsPresenter);

  // ignore: unused_field
  final HolidayDetailsPresenter _holidayDetailsPresenter;

  bool isLoading = false;
  HolidayData? holidayDetails;

  // Expandable sections state
  RxBool isOverviewExpanded = false.obs;
  RxBool isItineraryExpanded = false.obs;
  RxBool isInclusionExpanded = false.obs;
  RxBool isExclusionExpanded = false.obs;
  RxBool isTermsExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (Get.arguments != null && Get.arguments is HolidayData) {
        holidayDetails = Get.arguments as HolidayData;
        update();
      }
    });
  }

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  void toggleOverview() {
    isOverviewExpanded.value = !isOverviewExpanded.value;
  }

  void toggleItinerary() {
    isItineraryExpanded.value = !isItineraryExpanded.value;
  }

  void toggleInclusion() {
    isInclusionExpanded.value = !isInclusionExpanded.value;
  }

  void toggleExclusion() {
    isExclusionExpanded.value = !isExclusionExpanded.value;
  }

  void toggleTerms() {
    isTermsExpanded.value = !isTermsExpanded.value;
  }

  List<String> getGalleryImages() {
    if (holidayDetails?.galleryImages == null ||
        holidayDetails!.galleryImages!.isEmpty) {
      return [];
    }
    // Gallery images might be comma-separated or JSON array
    try {
      return holidayDetails!.galleryImages!
          .split(',')
          .map((e) => e.trim())
          .toList();
    } catch (e) {
      return [holidayDetails!.galleryImages!];
    }
  }
}
