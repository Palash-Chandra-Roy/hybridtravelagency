
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/auth_use_cases.dart';
import 'package:hybridtravelagency/screens/auth/login_screen/login_controller.dart';
import 'package:hybridtravelagency/screens/auth/login_screen/login_presenter.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
      Get.put(
        LoginPresenter(
          AuthUseCases(
            Get.find(),
          ),
        ),
      ),
    ),);
  }
}
