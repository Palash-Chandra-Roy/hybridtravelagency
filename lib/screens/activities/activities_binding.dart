
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/activities_use_cases.dart';
import 'package:hybridtravelagency/screens/activities/activities_controller.dart';
import 'package:hybridtravelagency/screens/activities/activities_presenter.dart';


class ActivitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  ActivitiesController(
      Get.put(
        ActivitiesPresenter(
          ActivitiesUseCases(Get.find()),
        ),
      ),
    ),);
  }
}
