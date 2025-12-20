import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';

import 'package:hybridtravelagency/screens/MyAccountScreen/my_account_screen.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_screen.dart';
import 'package:hybridtravelagency/screens/Where2GoScreen/where_2_go_screen.dart';
import 'package:hybridtravelagency/screens/home/home_screen.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_presenter.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/data/responses/search_activities_response.dart';

class NavigationController extends GetxController {
  NavigationController(this._navigationPresenter);
  final NavigationPresenter _navigationPresenter;
  var pageIndex = 0.obs;
  bool isActivitiesLoading = false;
  bool isCitiesLoading = false;
  TextEditingController countryTextController = TextEditingController();
  List<ActivityData>? activitiesList;
  int countryId = -1;
  String countryName = '';
  int cityId = -1;
  String cityName = '';

  final pages = [
    HomeScreen(),
    MyTripScreen(),
    Where2GoScreen(),
    MyAccountScreen(),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCurrentUser();
      loadDefaultLocationActivities();
      getCommonData();
    });
  }

  dynamic getCommonData() async {
    try {
      await Future.wait([
        getHolidaysCountries(),
        getCountries(),
        // getCities(),
        getAirports(),
        getCurrencies(),
        getVisaCountries(),
        getHotelsTypes(),
        getHotelsFacilities(),
      ]);
    } catch (e) {
      debugPrint("Error loading common data: $e");
    }
  }

  dynamic setActivitiesLoading(dynamic value) {
    isActivitiesLoading = value;
    update();
  }

  dynamic setCitiesLoading(dynamic value) {
    isCitiesLoading = value;
    update();
  }

  Future<void> getCountries() async {
    try {
      final localCountries = await SharedPrefUtil.getCountries();

      if (localCountries != null && localCountries.isNotEmpty) {
        return;
      }

      final response =
          await _navigationPresenter.getCountries(isLoading: false);

      if (response != null &&
          response.success == true &&
          response.data != null) {
        await SharedPrefUtil.setCountries(response.data!);
      }
    } finally {}
  }

  // Future<void> getCities() async {
  //   try {
  //     final localCities = await SharedPrefUtil.getCities();
  //
  //     if (localCities != null && localCities.isNotEmpty) {
  //       return;
  //     }
  //
  //     final response =
  //     await _navigationPresenter.getCities(isLoading: false,countryId: 1);
  //
  //     if (response != null &&
  //         response.success == true &&
  //         response.data != null) {
  //       await SharedPrefUtil.setCities(response.data!);
  //     }
  //   } finally {}
  // }

  Future<void> getAirports() async {
    try {
      final localAirports = await SharedPrefUtil.getAirports();

      if (localAirports != null && localAirports.isNotEmpty) {
        return;
      }

      final response =
          await _navigationPresenter.getAirports(isLoading: false, query: '');

      if (response != null &&
          response.success == true &&
          response.data != null) {
        await SharedPrefUtil.setAirports(response.data!);
      }
    } finally {}
  }

  Future<void> getCurrencies() async {
    try {
      final localCurrencies = await SharedPrefUtil.getCurrencies();

      if (localCurrencies != null && localCurrencies.isNotEmpty) {
        return;
      }

      final response =
          await _navigationPresenter.getCurrencies(isLoading: false);

      if (response != null &&
          response.success == true &&
          response.data != null) {
        await SharedPrefUtil.setCurrencies(response.data!);
      }
    } finally {}
  }

  Future<void> getVisaCountries() async {
    try {
      final localVisaCountries = await SharedPrefUtil.getVisaCountries();

      if (localVisaCountries != null) {
        return;
      }

      final response =
          await _navigationPresenter.getVisaCountries(isLoading: false);

      if (response != null && response.data != null) {
        await SharedPrefUtil.setVisaCountries(response.data!);
      }
    } finally {}
  }

  Future<void> getHotelsTypes() async {
    try {
      final localHotelTypes = await SharedPrefUtil.getHotelsTypes();

      if (localHotelTypes != null) {
        return;
      }

      final response =
          await _navigationPresenter.getHotelsTypes(isLoading: false);

      if (response != null && response.data != null) {
        await SharedPrefUtil.setHotelsTypes(response.data!);
      }
    } finally {}
  }

  Future<void> getHotelsFacilities() async {
    try {
      final localHotelTypes = await SharedPrefUtil.getHotelsFacilities();

      if (localHotelTypes != null) {
        return;
      }

      final response =
          await _navigationPresenter.getHotelsFacilities(isLoading: false);

      if (response != null && response.data != null) {
        await SharedPrefUtil.setHotelsFacilities(response.data!);
      }
    } finally {}
  }

  Future<void> getHolidaysCountries() async {
    try {
      final response =
          await _navigationPresenter.getHolidayCountries(isLoading: false);

      if (response != null && response.data != null) {
        await SharedPrefUtil.setHolidayCountries(response.data!);
      }
    } finally {}
  }

  Future<void> getCurrentUser() async {
    try {
      final response =
          await _navigationPresenter.getCurrentUser(isLoading: false);

      if (response != null &&
          response.success == true &&
          response.data != null) {
        await SharedPrefUtil.setCurrentUser(response.data!);

        await SharedPrefUtil.synchronizeSettingsToPhone();
        await SharedPrefUtil.synchronizeSettingsFromPhone();
      }
    } finally {}
  }

  Future<void> loadDefaultLocationActivities() async {
    countryName = 'United Arab Emirates';
    cityName = 'Dubai City';
    countryId = 13063;
    cityId = 13668;
    setCountryTextController();
    await searchActivities();
  }

  setCountryTextController() {
    countryTextController.text = "$cityName, $countryName";
    update();
  }

  Future<void> loadSavedLocationActivities() async {
    final savedCountry = await SharedPrefUtil.getSearchedCountry();
    final savedCity = await SharedPrefUtil.getSearchedCity();

    if (savedCountry != null && savedCity != null) {
      // show in your UI
      countryName = savedCountry.countryName!;
      cityName = savedCity.cityName!;
      countryId = savedCountry.countryId!;
      cityId = savedCity.cityId!;
      // auto call your API if needed
      await searchActivities();
    }
  }

  Future<void> searchActivities() async {
    setActivitiesLoading(true);
    try {
      final response = await _navigationPresenter.activitiesSearch(
          isLoading: false, cityId: cityId, countryId: countryId);

      if (response != null && response.data != null) {
        activitiesList = response.data!.activities!.data;
      }
      // activitiesList = _getDummyActivities();
    } catch (e) {
      debugPrint("Search Flight error: $e");
    } finally {
      setActivitiesLoading(false);
    }
  }

  Future<void> setCountry(CountryData country) async {
    countryId = country.countryId!;
    countryName = country.countryName!;
    SharedPrefUtil.setSearchedCountry(country);
    update();
  }

  Future<void> setCity(CityData city) async {
    cityId = city.cityId!;
    cityName = city.cityName!;
    SharedPrefUtil.setSearchedCity(city);
    update();
  }

  Future<void> getCities(int countryId) async {
    setCitiesLoading(true);
    try {
      final response = await _navigationPresenter.getCities(
          isLoading: false, countryId: countryId);

      if (response != null && response.data != null) {
        var citiesList = response.data!;
        setCity(citiesList.first);
        setCountryTextController();
      }
    } catch (e) {
      debugPrint("Cities error: $e");
    } finally {
      setCitiesLoading(false);
      searchActivities();
      // Get.back(result: {
      //   'countryId':countryId,
      //   'cityId':cityId
      // });
    }
  }
}
