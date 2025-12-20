import 'package:get/get.dart';

class CabSearchController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex;

  dynamic onIndexChange(dynamic index) {
    selectedIndex = index;
    update();
  }

  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex1;

  dynamic onIndexChange1(dynamic index) {
    selectedIndex1 = index;
    update();
  }
}
