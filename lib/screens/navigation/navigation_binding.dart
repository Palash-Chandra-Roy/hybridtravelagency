import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/my_trip_use_cases.dart';
import 'package:hybridtravelagency/data/usecases/user_dashboard_use_cases.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_controller.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_presenter.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_controller.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_presenter.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    // Navigation dependencies
    Get.lazyPut(
      () => NavigationController(
        Get.put(
          NavigationPresenter(
            UserDashboardUseCases(
              Get.find(),
            ),
          ),
        ),
      ),
    );

    // MyTrip dependencies (since MyTripScreen is accessed from bottom nav)
    // Using Get.put instead of lazyPut to ensure immediate initialization
    Get.put<MyTripUseCases>(MyTripUseCases(Get.find()));
    Get.put<MyTripPresenter>(MyTripPresenter(Get.find()));
    Get.put<MyTripController>(MyTripController(Get.find()));
  }
}
