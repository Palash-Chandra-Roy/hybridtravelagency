import 'package:get/get.dart';

class CabTerminalController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex;

  void onIndexChange(dynamic index) {
    selectedIndex = index;
    update();
  }

  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex1;

  void onIndexChange1(dynamic index) {
    selectedIndex1 = index;
    update();
  }
}
