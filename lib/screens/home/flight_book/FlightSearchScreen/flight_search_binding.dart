
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_presenter.dart';


class FlightSearchBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() =>
        FlightSearchController(
          Get.put(
            FlightSearchPresenter(
              FlightUseCases(
                Get.find(),
              ),
            ),
          ),
        ),);
  }
}
