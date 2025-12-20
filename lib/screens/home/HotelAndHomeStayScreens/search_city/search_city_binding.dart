
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/search_city/search_city_controller.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/search_city/search_city_presenter.dart';


class SearchCityBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() =>
        SearchCityController(
          Get.put(
            SearchCityPresenter(
              HotelsUseCases(
                Get.find(),
              ),
            ),
          ),
        ),);
  }
}
