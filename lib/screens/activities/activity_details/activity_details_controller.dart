import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_activity_details_response.dart';
import 'package:hybridtravelagency/screens/activities/activity_details/activity_details_presenter.dart';

class ActivityDetailsController extends GetxController {
  ActivityDetailsController(this._activityDetailsPresenter);

  final ActivityDetailsPresenter _activityDetailsPresenter;

  bool isLoading = false;
  Result? activityDetails;
  int activityId = -1;

  // Expandable sections state
  RxBool isHighlightsExpanded = false.obs;
  RxBool isImportantInfoExpanded = false.obs;
  RxBool isKnowBeforeYouGoExpanded = false.obs;
  RxBool isItineraryExpanded = false.obs;
  RxBool isHowToRedeemExpanded = false.obs;
  RxBool isInclusionsExpanded = false.obs;
  RxBool isFaqExpanded = false.obs;
  RxBool isTermsExpanded = false.obs;
  RxBool isCancellationPolicyExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (Get.arguments != null) {
        activityId = Get.arguments['activityId'] ?? -1;
        final contractId = Get.arguments['contractId'] as int?;
        final travelDate = Get.arguments['travelDate'] as String?;
        if (activityId != -1) {
          await getActivityDetails(
            activityId,
            contractId: contractId,
            travelDate: travelDate,
          );
        }
      }
    });
  }

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> getActivityDetails(int id,
      {int? contractId, String? travelDate}) async {
    setLoading(true);
    try {
      final defaultTravelDate =
          travelDate ?? DateTime.now().toString().split(' ')[0];

      final response = await _activityDetailsPresenter.getActivityDetails(
        isLoading: false,
        activityId: id,
        contractId: contractId,
        travelDate: defaultTravelDate,
      );

      if (response != null &&
          response.data != null &&
          response.data!.result != null &&
          response.data!.result!.isNotEmpty) {
        activityDetails = response.data!.result!.first;
      }
    } catch (e) {
      debugPrint("Activity Details error: $e");
    } finally {
      setLoading(false);
    }
  }

  void toggleHighlights() {
    isHighlightsExpanded.value = !isHighlightsExpanded.value;
  }

  void toggleImportantInfo() {
    isImportantInfoExpanded.value = !isImportantInfoExpanded.value;
  }

  void toggleKnowBeforeYouGo() {
    isKnowBeforeYouGoExpanded.value = !isKnowBeforeYouGoExpanded.value;
  }

  void toggleItinerary() {
    isItineraryExpanded.value = !isItineraryExpanded.value;
  }

  void toggleHowToRedeem() {
    isHowToRedeemExpanded.value = !isHowToRedeemExpanded.value;
  }

  void toggleInclusions() {
    isInclusionsExpanded.value = !isInclusionsExpanded.value;
  }

  void toggleFaq() {
    isFaqExpanded.value = !isFaqExpanded.value;
  }

  void toggleTerms() {
    isTermsExpanded.value = !isTermsExpanded.value;
  }

  void toggleCancellationPolicy() {
    isCancellationPolicyExpanded.value = !isCancellationPolicyExpanded.value;
  }
}
