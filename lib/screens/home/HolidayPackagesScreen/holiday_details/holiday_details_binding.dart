import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/holidays_use_cases.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_details/holiday_details_controller.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_details/holiday_details_presenter.dart';

class HolidayDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HolidayDetailsController(
          Get.put(
            HolidayDetailsPresenter(
              HolidaysUseCases(Get.find()),
            ),
          ),
        ));
  }
}










