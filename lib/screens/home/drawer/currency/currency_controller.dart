import 'package:get/get.dart';

class CurrencyController extends GetxController{

  dynamic  selectedIndex;

  void onIndexChange(dynamic index){
    selectedIndex=index;
    update();
  }

}