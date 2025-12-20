import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/models/traveller_model.dart';

class FlightDetailController extends GetxController{

  dynamic selectedIndex;
  List<Traveller>travellers = [];
  final TextEditingController firstAndMiddleNameController =
  TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  String selectedGender = "MALE";
  void addTraveller(Traveller traveller) {
    travellers.add(traveller);
    update();
  }

  void updateGender(String gender){
    selectedGender = gender;
    update();
  }


  dynamic onIndexChange(dynamic index){
    selectedIndex=index;
    update();
  }
}