import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_controller.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SortAndFilterTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Sort by'),
    Tab(text: 'Filters'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class SortAndFilterController extends GetxController{
  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex;

  dynamic onIndexChange(dynamic index){
    selectedIndex=index;
    update();
  }

  // ignore: prefer_typing_uninitialized_variables
  dynamic  selectedIndex1;

  dynamic onIndexChange1(dynamic index){
    selectedIndex1=index;
    update();
  }

  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex2;

  dynamic onIndexChange2(dynamic index){
    selectedIndex2=index;
    update();
  }

  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex3;

  dynamic onIndexChange3(dynamic index){
    selectedIndex3=index;
    update();
  }

  var selectedAttributes = <int, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initSelections();
  }


  Future<void> initSelections() async {
    final types = Lists.sortList.map((e) => e["text1"] as String).toList();
    await SharedPrefUtil.loadAllSortSelections(types);

    for (int i = 0; i < types.length; i++) {
      if (SharedPrefUtil.sortSelections.containsKey(types[i])) {
        selectedAttributes[i] = SharedPrefUtil.sortSelections[types[i]]!;
      }
    }
    update();
  }

  Future<void> onAttributeChange(int sortIndex, int attributeIndex, String type) async {
    selectedAttributes[sortIndex] = attributeIndex;
    update();
    await SharedPrefUtil.setSortSelection(type, attributeIndex);
  }

  int? getSelectedAttribute(int sortIndex) {
    return selectedAttributes[sortIndex];
  }

  var select = false.obs;
  var isSelected = false.obs;


  Future<void> saveSortSelection(String type, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPrefUtil.sortSelections[type] = value;

    if (value is int) {
      await prefs.setInt("sort_$type", value);
    } else if (value is bool) {
      await prefs.setBool("sort_$type", value);
    } else if (value is String) {
      await prefs.setString("sort_$type", value);
    } else if (value is List<String>) {
      await prefs.setStringList("sort_$type", value);
    }
  }

  dynamic apply(){
    Get.find<FlightBookController>().applySort(Get.find<FlightBookController>().allOffers, SharedPrefUtil.sortSelections);
    Get.back();
  }

}