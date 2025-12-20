import 'package:get/get.dart';

class CountryController extends GetxController{

  dynamic  selectedIndex;

  dynamic onIndexChange(dynamic index){
    selectedIndex=index;
    update();
  }

}