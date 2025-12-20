import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/data/responses/currencies_response.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';

class SettingController extends GetxController {
  CountryData? selectedCountry;
  CurrencyData? selectedCurrency;
  @override
  void onInit() {
    super.onInit();
    loadSelectedCountry();
  }

  Future<void> loadSelectedCountry() async {
    final country = await SharedPrefUtil.getSelectedCountry();
    selectedCountry = country;
    update();
  }

  Future<void> loadSelectedCurrency() async {
    final currency = await SharedPrefUtil.getSelectedCurrency();
    selectedCurrency = currency;
    update();
  }

  Future<void> updateSelectedCountry(CountryData country) async {
    await SharedPrefUtil.setSelectedCountry(country);
    selectedCountry = country;
    update();
  }

  Future<void> updateSelectedCurrency(CurrencyData currency) async {
    await SharedPrefUtil.setSelectedCurrency(currency);
    selectedCurrency = currency;
    update();
  }
}