
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_controller.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_presenter.dart';


class HotelAndHomeStayBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() =>
        HotelAndHomeStayController(
          Get.put(
            HotelAndHomeStayPresenter(
              HotelsUseCases(
                Get.find(),
              ),
            ),
          ),
        ),);
  }
}
