
import 'package:get/get.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_controller.dart';


class FlightDetailBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() =>
        FlightDetailController(

        ),);
  }
}
