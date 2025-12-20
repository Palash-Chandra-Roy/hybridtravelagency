import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/navigators/navigators.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    SharedPrefUtil.synchronizeSettingsFromPhone().then((value) async {
      debugPrint('AccessToken: ${SharedPrefUtil.authToken}');
      await SharedPrefUtil.getSelectedCountry();
      await SharedPrefUtil.getSelectedCurrency();
      final types = Lists.sortList.map((e) => e["text1"] as String).toList();
      await SharedPrefUtil.loadAllSortSelections(types);
      await SharedPrefUtil.getHotelsFacilities();
      await SharedPrefUtil.getHotelsTypes();
      await SharedPrefUtil.getHolidayCountries();
      await Future.delayed(const Duration(seconds: 4));

      if (SharedPrefUtil.isLogin) {
        RouteManagement.goToNavigationScreen();
      } else {
        
        //change update code 
        
        RouteManagement.goToNavigationScreen();
       // RouteManagement.goToLoginScreen();


      }
    });
  }
}
