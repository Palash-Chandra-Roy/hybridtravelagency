import 'package:get/get.dart';

class TrainAndBusDetailController extends GetxController{
  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex;

  dynamic onIndexChange(dynamic index) {
    selectedIndex = index;
    update();
  }
}