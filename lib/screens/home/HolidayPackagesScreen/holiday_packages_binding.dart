
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/holidays_use_cases.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_packages_controller.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_packages_presenter.dart';


class HolidayPackagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  HolidayPackagesController(
      Get.put(
        HolidayPackagesPresenter(
          HolidaysUseCases(Get.find()),
        ),
      ),
    ),);
  }
}
