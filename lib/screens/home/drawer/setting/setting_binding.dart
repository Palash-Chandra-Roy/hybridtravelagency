
import 'package:get/get.dart';
import 'package:hybridtravelagency/screens/home/drawer/setting/setting_controller.dart';


class SettingBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() =>
        SettingController(
        ));
  }
}
