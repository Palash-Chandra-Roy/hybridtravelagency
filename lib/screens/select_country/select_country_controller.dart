import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

class DefaultThemeSelectLanguageController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  dynamic selectedIndex;

  List<Country> allCountries = [];
  List<Country> filteredCountries = [];

  @override
  void onInit() {
    super.onInit();
    // Get all countries from the country_picker package
    allCountries = CountryService().getAll();
    filteredCountries = allCountries;
  }

  dynamic onIndexChange(dynamic index) {
    selectedIndex = index;
    update();
  }

  void searchCountries(String query) {
    if (query.isEmpty) {
      filteredCountries = allCountries;
    } else {
      filteredCountries = allCountries.where((country) {
        final lowerQuery = query.toLowerCase();
        return country.name.toLowerCase().contains(lowerQuery) ||
            country.phoneCode.contains(query) ||
            country.countryCode.toLowerCase().contains(lowerQuery);
      }).toList();
    }
    selectedIndex = null; // Reset selection when searching
    update();
  }
}
