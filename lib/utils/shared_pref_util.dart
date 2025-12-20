import 'dart:async';
import 'dart:convert';
import 'package:hybridtravelagency/constants/appconstant.dart';
import 'package:flutter/material.dart';
import 'package:hybridtravelagency/data/responses/airports_response.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/data/responses/currencies_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_destinations_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_facilities_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_types_response.dart';
import 'package:hybridtravelagency/data/responses/get_visa_countries_response.dart';
import 'package:hybridtravelagency/data/responses/login_response.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static bool isLogin = false;
  static bool isFirstTime = true;
  static String authToken = '';
  static String userRole = '';
  static int userId = 0;
  static String deviceToken = '';
  static String deviceType = '';
  static String deviceName = '';
  static String deviceIdentifier = '';
  static String appVersion = '';
  static User? user;
  static CountryData? selectedCountry;
  static CurrencyData? selectedCurrency;
  static List<CityData>? cities;
  static List<CountryData>? countries;
  static List<AirportData>? airports;
  static List<CurrencyData>? currencies;
  static List<HotelType>? hotelsTypes;
  static List<HotelFacility>? hotelsFacilities;
  static Map<String, dynamic> sortSelections = {};
  static Offers? flightOffer;
  static List<String>? holidayCountries;
  // static EventBus eventBus = EventBus();
  // static String currentLanguage = StringConstants().arabic;

  static Future synchronizeSettingsFromPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString(AppConstant.userRole) ?? "";
    userId = prefs.getInt(AppConstant.userId) ?? 0;
    authToken = prefs.getString(AppConstant.authToken) ?? "";
    isLogin = prefs.getBool(AppConstant.isLogin) ?? false;
    isFirstTime = prefs.getBool(AppConstant.isFirstTime) ?? true;
    // currentLanguage = prefs.getString(AppConstant.localLang) ?? "";
    if (prefs.get(AppConstant.currentUser) != null) {
      user = User.fromJson(
          json.decode(prefs.get(AppConstant.currentUser) as String)
              as Map<String, dynamic>);
    }
  }

  static Future synchronizeSettingsToPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(AppConstant.userRole, userRole);
    await prefs.setInt(AppConstant.userId, userId);
    await prefs.setString(AppConstant.authToken, authToken);
    await prefs.setBool(AppConstant.isLogin, isLogin);
    await prefs.setBool(AppConstant.isFirstTime, isFirstTime);
    // await prefs.setString(AppConstant.localLang, currentLanguage);
  }

  static Future clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPrefUtil.authToken = "";
    SharedPrefUtil.isLogin = false;
    SharedPrefUtil.userId = 0;
    SharedPrefUtil.userRole = "";

    await prefs.clear();
  }

  static Future<void> setCurrentUser(User usr) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .setString(
      AppConstant.currentUser,
      json.encode(usr),
    )
        .then((value) async {
      user = User.fromJson(
          json.decode(prefs.get(AppConstant.currentUser) as String)
              as Map<String, dynamic>);
      debugPrint(
        user.toString(),
      );
    });
  }

  static Future<User?> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.currentUser)) {
      return user = User.fromJson(
          json.decode(prefs.get(AppConstant.currentUser) as String)
              as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  static Future<void> setCountries(List<CountryData> countries) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> countriesJson =
        countries.map((c) => c.toJson()).toList();
    await prefs.setString(AppConstant.countries, json.encode(countriesJson));
  }

  static Future<List<CountryData>?> getCountries() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.countries)) {
      final String? jsonStr = prefs.getString(AppConstant.countries);
      if (jsonStr != null) {
        final List<dynamic> jsonList = json.decode(jsonStr) as List<dynamic>;
        countries = jsonList.map((e) => CountryData.fromJson(e)).toList();
        return countries;
      }
    }
    return null;
  }

  static Future<void> setCities(List<CityData> listing) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cities =
        listing.map((c) => c.toJson()).toList();
    await prefs.setString(AppConstant.cities, json.encode(cities));
  }

  static Future<List<CityData>?> getCities() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.cities)) {
      final String? jsonStr = prefs.getString(AppConstant.cities);
      if (jsonStr != null) {
        final List<dynamic> jsonList = json.decode(jsonStr) as List<dynamic>;
        cities = jsonList.map((e) => CityData.fromJson(e)).toList();
        return cities;
      }
    }
    return null;
  }

  static Future<void> setAirports(List<AirportData> listing) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> airportsJson =
        listing.map((c) => c.toJson()).toList();
    await prefs.setString(AppConstant.airports, json.encode(airportsJson));
  }

  static Future<List<AirportData>?> getAirports() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.airports)) {
      final String? jsonStr = prefs.getString(AppConstant.airports);
      if (jsonStr != null) {
        final List<dynamic> jsonList = json.decode(jsonStr) as List<dynamic>;
        airports = jsonList.map((e) => AirportData.fromJson(e)).toList();
        return airports;
      }
    }
    return null;
  }

  static Future<void> setCurrencies(List<CurrencyData> listing) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> currenciesJson =
        listing.map((c) => c.toJson()).toList();
    await prefs.setString(AppConstant.currencies, json.encode(currenciesJson));
  }

  static Future<List<CurrencyData>?> getCurrencies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.currencies)) {
      final String? jsonStr = prefs.getString(AppConstant.currencies);
      if (jsonStr != null) {
        final List<dynamic> jsonList = json.decode(jsonStr) as List<dynamic>;
        currencies = jsonList.map((e) => CurrencyData.fromJson(e)).toList();
        return currencies;
      }
    }
    return null;
  }

  static Future<void> setVisaCountries(VisaCountriesData jsonData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.visaCountries, json.encode(jsonData));
  }

  static Future<VisaCountriesData?> getVisaCountries() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.visaCountries)) {
      final String? jsonStr = prefs.getString(AppConstant.visaCountries);
      if (jsonStr != null) {
        return VisaCountriesData.fromJson(
            json.decode(prefs.get(AppConstant.visaCountries) as String)
                as Map<String, dynamic>);
      } else {
        return null;
      }
    }
    return null;
  }

  static Future<void> setHotelsTypes(List<HotelType> listing) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> currenciesJson =
    listing.map((c) => c.toJson()).toList();
    hotelsTypes = listing;
    await prefs.setString(AppConstant.hotelsTypes, json.encode(currenciesJson));
  }

  static Future<List<HotelType>?> getHotelsTypes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.hotelsTypes)) {
      final String? jsonStr = prefs.getString(AppConstant.hotelsTypes);
      if (jsonStr != null) {
        final List<dynamic> jsonList = json.decode(jsonStr) as List<dynamic>;
        hotelsTypes = jsonList.map((e) => HotelType.fromJson(e)).toList();
        return hotelsTypes;
      }
    }
    return null;
  }

  static Future<void> setHotelsFacilities(List<HotelFacility> listing) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> currenciesJson =
    listing.map((c) => c.toJson()).toList();
    hotelsFacilities = listing;
    await prefs.setString(AppConstant.hotelsFacilities, json.encode(currenciesJson));
  }

  static Future<List<HotelFacility>?> getHotelsFacilities() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.hotelsFacilities)) {
      final String? jsonStr = prefs.getString(AppConstant.hotelsFacilities);
      if (jsonStr != null) {
        final List<dynamic> jsonList = json.decode(jsonStr) as List<dynamic>;
        hotelsFacilities = jsonList.map((e) => HotelFacility.fromJson(e)).toList();
        return hotelsFacilities;
      }
    }
    return null;
  }


  static Future<void> setSelectedCountry(CountryData country) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .setString(AppConstant.selectedCountry, json.encode(country.toJson()))
        .then((value) async {
      selectedCountry = CountryData.fromJson(
          json.decode(prefs.get(AppConstant.selectedCountry) as String)
              as Map<String, dynamic>);
    });
  }

  static Future<CountryData?> getSelectedCountry() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.selectedCountry)) {
      final String? jsonStr = prefs.getString(AppConstant.selectedCountry);
      if (jsonStr != null) {
        selectedCountry = CountryData.fromJson(json.decode(jsonStr));
        return selectedCountry;
      }
    }
    return null;
  }

  static Future<void> addAirportSearch(AirportData airport) async {
    final prefs = await SharedPreferences.getInstance();

    // get current list
    List<String> stored =
        prefs.getStringList(AppConstant.popularAirportSearches) ?? [];

    // convert to List<AirportData>
    List<AirportData> airports =
        stored.map((e) => AirportData.fromJson(jsonDecode(e))).toList();

    // check uniqueness by code (or name + country if needed)
    bool exists = airports.any((a) => a.code == airport.code);

    if (!exists) {
      stored.add(jsonEncode(airport.toJson()));
      await prefs.setStringList(AppConstant.popularAirportSearches, stored);
    }
  }

  /// Retrieve all saved popular airports
  static Future<List<AirportData>> getAirportsSearches() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stored =
        prefs.getStringList(AppConstant.popularAirportSearches) ?? [];

    return stored.map((e) => AirportData.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> setSelectedCurrency(CurrencyData country) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .setString(AppConstant.selectedCurrency, json.encode(country.toJson()))
        .then((value) async {
      selectedCurrency = CurrencyData.fromJson(
          json.decode(prefs.get(AppConstant.selectedCurrency) as String)
          as Map<String, dynamic>);
    });
  }

  static Future<CurrencyData?> getSelectedCurrency() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.selectedCurrency)) {
      final String? jsonStr = prefs.getString(AppConstant.selectedCurrency);
      if (jsonStr != null) {
        selectedCurrency = CurrencyData.fromJson(json.decode(jsonStr));
        return selectedCurrency;
      }
    }
    return null;
  }

  static Future<void> setSortSelection(String type, int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("sort_$type", index);
    sortSelections[type] = index;
  }

  static Future<int?> getSortSelection(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("sort_$type");
  }

  static Future<void> setAirlineSelections(List<String> airlines) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("sort_airlines", airlines);
    sortSelections["airlines"] = airlines;
  }

  static Future<List<String>> getAirlineSelections() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("sort_airlines") ?? [];
  }

  static Future<void> setRefundable(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("sort_refundable", value);
    sortSelections["refundable"] = value;
  }

  static Future<bool> getRefundable() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("sort_refundable") ?? false;
  }

  static Future<void> loadAllSortSelections(List<String> types) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var type in types) {
      final val = prefs.getInt("sort_$type");
      if (val != null) {
        sortSelections[type] = val;
      }
    }
  }

  static Future<void> addDestinationSearch(GetHotelDestinationsResponse destination) async {
    final prefs = await SharedPreferences.getInstance();

    // get current list
    List<String> stored =
        prefs.getStringList(AppConstant.popularDestinationSearches) ?? [];

    // convert to List<AirportData>
    List<GetHotelDestinationsResponse> airports =
    stored.map((e) => GetHotelDestinationsResponse.fromJson(jsonDecode(e))).toList();

    // check uniqueness by code (or name + country if needed)
    bool exists = airports.any((a) => a.id == destination.id);

    if (!exists) {
      stored.add(jsonEncode(destination.toJson()));
      await prefs.setStringList(AppConstant.popularDestinationSearches, stored);
    }
  }

  /// Retrieve all saved popular airports
  static Future<List<GetHotelDestinationsResponse>> getDestinationsSearches() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stored =
        prefs.getStringList(AppConstant.popularDestinationSearches) ?? [];

    return stored.map((e) => GetHotelDestinationsResponse.fromJson(jsonDecode(e))).toList();
  }


  static Future<void> setHolidayCountries(List<String> listing) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    holidayCountries = listing;
    await prefs.setStringList(AppConstant.holidayCounties, listing);
  }

  static Future<List<String>?> getHolidayCountries() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.holidayCounties)) {
      final List<String>? savedList =
      prefs.getStringList(AppConstant.holidayCounties);
      holidayCountries = savedList;
      return savedList;
    }
    return null;
  }

  static Future<void> setSearchedCity(CityData city) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .setString(AppConstant.searchedCity, json.encode(city.toJson()));
  }

  static Future<CityData?> getSearchedCity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.searchedCity)) {
      final String? jsonStr = prefs.getString(AppConstant.searchedCity);
      if (jsonStr != null) {
        return CityData.fromJson(json.decode(jsonStr));
      }
    }
    return null;
  }

  static Future<void> setSearchedCountry(CountryData country) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.searchedCountry, json.encode(country.toJson()));
  }

  static Future<CountryData?> getSearchedCountry() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstant.searchedCountry)) {
      final String? jsonStr = prefs.getString(AppConstant.searchedCountry);
      if (jsonStr != null) {
        var searchedCountry = CountryData.fromJson(json.decode(jsonStr));
        return searchedCountry;
      }
    }
    return null;
  }
}
