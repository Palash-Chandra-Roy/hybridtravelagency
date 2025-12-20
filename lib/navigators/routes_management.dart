import 'package:get/get.dart';

import 'app_pages.dart';

/// A chunk of routes taken in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class RouteManagement {
  static void goToSplashScreen() {
    Get.offAllNamed<void>(
      Routes.splashScreen,
    );
  }

  static void goToLoginScreen() {
    Get.offAllNamed<void>(
      Routes.loginScreen,
    );
  }

  static void goToRegisterScreen() {
    Get.toNamed<void>(
      Routes.registerScreen,
    );
  }

  static void goToNavigationScreen() {
    Get.offAllNamed<void>(
      Routes.navigationScreen,
    );
  }

  static void goToSettingScreen() {
    Get.toNamed<void>(
      Routes.settingScreen,
    );
  }

  static void goToFlightSearchScreen() {
    Get.toNamed<void>(
      Routes.flightSearchScreen,
    );
  }

  static void goToFlightBookScreen({
    required String origin,
    required String destination,
    required String departureDate,
    required String returnDate,
    required int adults,
    required int children,
    required int infants,
    required String cabinClass,
    required String tripType,
  }) {
    Get.toNamed<void>(
      Routes.flightBookScreen,
      arguments: {
        'origin': origin,
        'destination': destination,
        'departureDate': departureDate,
        'returnDate': returnDate,
        'adults': adults,
        'children': children,
        'infants': infants,
        'cabinClass': cabinClass,
        'tripType': tripType
      },
    );
  }

  static void goToFlightDetailScreen() {
    Get.toNamed<void>(
      Routes.flightDetailScreen,
    );
  }

  static void goToHotelAndHomeStayScreen() {
    Get.toNamed<void>(
      Routes.hotelAndHomeStayScreen,
    );
  }

  static void goToSearchCityScreen() {
    Get.toNamed<void>(
      Routes.searchCityScreen,
    );
  }

  static void goToHotelsScreen(
      {required String destination,
      required String checkIn,
      required String checkOut,
      required int adults,
      required int children,
      required int rooms,
      required List<int> hotelTypesIds}) {
    Get.toNamed<void>(
      Routes.hotelsScreen,
      arguments: {
        'destination': destination,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'adults': adults,
        'children': children,
        'rooms': rooms,
        'hotelTypesIds': hotelTypesIds
      },
    );
  }

  static void goToHolidayPackagesScreen() {
    Get.toNamed<void>(
      Routes.holidayPackagesScreen,
    );
  }

  static void goToActivitiesScreen() {
    Get.toNamed<void>(
      Routes.activitiesScreen,
    );
  }

  static void goToMyFlightScreen() {
    Get.toNamed<void>(
      Routes.myFlightScreen,
    );
  }

  static void goToMyHolidaysScreen() {
    Get.toNamed<void>(
      Routes.myHolidaysScreen,
    );
  }

  static void goToMyHotelScreen() {
    Get.toNamed<void>(
      Routes.myHotelScreen,
    );
  }

  static void goToMyActivityScreen() {
    Get.toNamed<void>(
      Routes.myActivitiesScreen,
    );
  }

  static void goToMyVisaScreen() {
    Get.toNamed<void>(
      Routes.myVisaScreen,
    );
  }

  static void goToMyFlightDetailsScreen({
    required int bookingId,
  }) {
    Get.toNamed<void>(
      Routes.myFlightDetailsScreen,
      arguments: {
        'bookingId': bookingId,
      },
    );
  }

  static void goToActivityDetailsScreen({
    required int activityId,
    required int contractId,
  }) {
    Get.toNamed<void>(
      Routes.activityDetailsScreen,
      arguments: {
        'activityId': activityId,
        'contractId': contractId,
      },
    );
  }

  static void goToEditProfileScreen() {
    Get.toNamed<void>(
      Routes.editProfileScreen,
    );
  }
}
