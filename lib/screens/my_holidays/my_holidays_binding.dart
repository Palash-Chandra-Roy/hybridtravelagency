
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/holidays_use_cases.dart';
import 'package:hybridtravelagency/screens/my_holidays/my_holidays_controller.dart';
import 'package:hybridtravelagency/screens/my_holidays/my_holidays_presenter.dart';
class MyHolidaysBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => MyHolidaysController(
      Get.put(
        MyHolidaysPresenter(
          HolidaysUseCases(
            Get.find(),
          ),
        ),
      ),
    ),);
  }
}
