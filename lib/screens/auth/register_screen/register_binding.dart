
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/auth_use_cases.dart';
import 'package:hybridtravelagency/screens/auth/register_screen/register_controller.dart';
import 'package:hybridtravelagency/screens/auth/register_screen/register_presenter.dart';


class RegisterBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() =>
        RegisterController(
          Get.put(
            RegisterPresenter(
              AuthUseCases(
                Get.find(),
              ),
            ),
          ),
        ),);
  }
}
