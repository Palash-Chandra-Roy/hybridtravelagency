import 'package:get/get.dart';

class NetBankingController extends GetxController{
  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex;

  dynamic onIndexChange(dynamic index){
    selectedIndex=index;
    update();
  }

  var isClick = false.obs;
}