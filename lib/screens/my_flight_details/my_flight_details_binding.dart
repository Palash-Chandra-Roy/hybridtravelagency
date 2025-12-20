
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';
import 'package:hybridtravelagency/screens/my_flight_details/my_flight_details_controller.dart';
import 'package:hybridtravelagency/screens/my_flight_details/my_flight_details_presenter.dart';
class MyFlightDetailsBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => MyFlightDetailsController(
      Get.put(
        MyFlightDetailsPresenter(
          FlightUseCases(
            Get.find(),
          ),
        ),
      ),
    ),);
  }
}
