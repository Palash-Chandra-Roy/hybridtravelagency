
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/hotels_controller.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/hotels_presenter.dart';


class HotelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<HotelsController>(() =>  HotelsController(
      Get.put(
        HotelsPresenter(
          HotelsUseCases(Get.find()),
        ),
      ),
    ),);
  }
}
