import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/activities_use_cases.dart';
import 'package:hybridtravelagency/screens/activities/activity_details/activity_details_controller.dart';
import 'package:hybridtravelagency/screens/activities/activity_details/activity_details_presenter.dart';

class ActivityDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityDetailsController(
          Get.put(
            ActivityDetailsPresenter(
              ActivitiesUseCases(Get.find()),
            ),
          ),
        ));
  }
}


