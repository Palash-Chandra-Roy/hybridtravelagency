import 'package:get/get.dart';

class Welcome2Controller extends GetxController{
  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex;

  dynamic onIndexChange(dynamic index){
    selectedIndex=index;
    update();
  }
}