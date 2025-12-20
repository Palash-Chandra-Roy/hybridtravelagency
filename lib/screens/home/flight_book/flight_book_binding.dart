
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_presenter.dart';


class FlightBookBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() =>
        FlightBookController(
          Get.put(
            FlightBookPresenter(
              FlightUseCases(
                Get.find(),
              ),
            ),
          ),
        ),);
  }
}
