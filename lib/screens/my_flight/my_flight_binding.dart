
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';
import 'package:hybridtravelagency/screens/my_flight/my_flight_controller.dart';
import 'package:hybridtravelagency/screens/my_flight/my_flight_presenter.dart';
class MyFlightBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => MyFlightController(
      Get.put(
        MyFlightPresenter(
          FlightUseCases(
            Get.find(),
          ),
        ),
      ),
    ),);
  }
}
