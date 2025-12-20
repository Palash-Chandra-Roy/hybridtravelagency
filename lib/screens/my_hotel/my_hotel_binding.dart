
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';
import 'package:hybridtravelagency/screens/my_hotel/my_hotel_controller.dart';
import 'package:hybridtravelagency/screens/my_hotel/my_hotel_presenter.dart';
class MyHotelBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => MyHotelController(
      Get.put(
        MyHotelPresenter(
          HotelsUseCases(
            Get.find(),
          ),
        ),
      ),
    ),);
  }
}
