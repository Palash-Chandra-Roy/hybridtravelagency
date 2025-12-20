import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/auth_use_cases.dart';
import 'package:hybridtravelagency/data/usecases/user_dashboard_use_cases.dart';
import 'package:hybridtravelagency/screens/MyAccountScreen/edit_profile_controller.dart';
import 'package:hybridtravelagency/screens/MyAccountScreen/edit_profile_presenter.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController(
          Get.put(
            EditProfilePresenter(
              AuthUseCases(Get.find()),
              UserDashboardUseCases(Get.find()),
            ),
          ),
        ));
  }
}
