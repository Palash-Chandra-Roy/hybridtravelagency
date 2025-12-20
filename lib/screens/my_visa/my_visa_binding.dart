
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/usecases/visa_use_cases.dart';
import 'package:hybridtravelagency/screens/my_visa/my_visa_controller.dart';
import 'package:hybridtravelagency/screens/my_visa/my_visa_presenter.dart';
class MyVisaBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => MyVisaController(
      Get.put(
        MyVisaPresenter(
          VisaUseCases(
            Get.find(),
          ),
        ),
      ),
    ),);
  }
}
