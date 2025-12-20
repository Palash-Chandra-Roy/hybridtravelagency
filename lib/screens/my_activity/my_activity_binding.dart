
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/activities_use_cases.dart';
import 'package:hybridtravelagency/screens/my_activity/my_activity_controller.dart';
import 'package:hybridtravelagency/screens/my_activity/my_activity_presenter.dart';
class MyActivityBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => MyActivityController(
      Get.put(
        MyActivityPresenter(
          ActivitiesUseCases(
            Get.find(),
          ),
        ),
      ),
    ),);
  }
}
