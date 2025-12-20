import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/screens/MyAccountScreen/edit_profile_presenter.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';

class EditProfileController extends GetxController {
  EditProfileController(this._editProfilePresenter);
  final EditProfilePresenter _editProfilePresenter;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Phone country selection - default to US (+1)
  String selectedPhoneCountryCode = "+1";
  String selectedPhoneCountryFlag = "🇺🇸"; // US flag emoji
  String selectedPhoneCountryName = "United States";

  // Dropdown fields
  CountryData? selectedCountry;
  CityData? selectedCity;
  List<CityData> availableCities = [];
  bool isLoadingCities = false;

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    // Pre-populate fields with current user data
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (SharedPrefUtil.user != null) {
      nameController.text = SharedPrefUtil.user!.name ?? '';
      emailController.text = SharedPrefUtil.user!.email ?? '';

      // Try to load phone from multiple possible fields
      String phoneNumber = '';
      if (SharedPrefUtil.user!.mobile != null &&
          SharedPrefUtil.user!.mobile!.isNotEmpty) {
        phoneNumber = SharedPrefUtil.user!.mobile!;
      } else if (SharedPrefUtil.user!.phone != null &&
          SharedPrefUtil.user!.phone!.isNotEmpty) {
        phoneNumber = SharedPrefUtil.user!.phone!;
      }
      phoneController.text = phoneNumber;

      addressController.text = SharedPrefUtil.user!.address ?? '';

      // Load country from saved data
      if (SharedPrefUtil.user!.country != null &&
          SharedPrefUtil.user!.country!.isNotEmpty) {
        // Try to find matching country from available countries
        selectedCountry = SharedPrefUtil.countries?.firstWhere(
          (country) =>
              country.countryName?.toLowerCase() ==
              SharedPrefUtil.user!.country?.toLowerCase(),
          orElse: () => CountryData(countryName: SharedPrefUtil.user!.country),
        );

        // If we found a country with an ID, load cities
        if (selectedCountry?.countryId != null) {
          await loadCities(selectedCountry!.countryId!);

          // Try to match the city from user data with loaded cities
          if (SharedPrefUtil.user!.city != null &&
              SharedPrefUtil.user!.city!.isNotEmpty) {
            selectedCity = availableCities.firstWhere(
              (city) =>
                  city.cityName?.toLowerCase() ==
                  SharedPrefUtil.user!.city?.toLowerCase(),
              orElse: () => CityData(cityName: SharedPrefUtil.user!.city),
            );
          }
        }
      }
    }
  }

  Future<void> onCountrySelected(CountryData? country) async {
    selectedCountry = country;
    selectedCity = null; // Reset city when country changes
    availableCities = [];
    update();

    if (country?.countryId != null) {
      await loadCities(country!.countryId!);
    }
  }

  Future<void> loadCities(int countryId) async {
    isLoadingCities = true;
    update();

    try {
      final response = await _editProfilePresenter.getCities(
        isLoading: false,
        countryId: countryId,
      );

      if (response != null && response.data != null) {
        availableCities = response.data!;
        // Save to SharedPrefUtil
        await SharedPrefUtil.setCities(response.data!);
      } else {
        availableCities = [];
      }
    } catch (e) {
      debugPrint("Error loading cities: $e");
      availableCities = [];
    } finally {
      isLoadingCities = false;
      update();
    }
  }

  void onCitySelected(CityData? city) {
    selectedCity = city;
    update();
  }

  void setSelectedPhoneCountry({
    required String countryCode,
    required String countryFlag,
    required String countryName,
  }) {
    selectedPhoneCountryCode = countryCode;
    selectedPhoneCountryFlag = countryFlag;
    selectedPhoneCountryName = countryName;
    update();
  }

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> updateProfile() async {
    // Validate fields
    if (nameController.text.trim().isEmpty) {
      showError("Please enter your name.");
      return;
    }

    if (phoneController.text.trim().isEmpty) {
      showError("Please enter your phone number.");
      return;
    }

    setLoading(true);

    try {
      // Combine country code with phone number
      final fullPhoneNumber =
          '$selectedPhoneCountryCode${phoneController.text.trim()}';

      final response = await _editProfilePresenter.updateProfile(
        isLoading: false,
        name: nameController.text.trim(),
        phone: fullPhoneNumber,
        address: addressController.text.trim(),
        city: selectedCity?.cityName ?? '',
        country: selectedCountry?.countryName ?? '',
      );

      debugPrint("Update profile raw response: ${response?.toJson()}");

      if (response != null && response.success == true) {
        // Update user data in SharedPreferences
        if (SharedPrefUtil.user != null) {
          SharedPrefUtil.user!.name = nameController.text.trim();
          SharedPrefUtil.user!.phone = fullPhoneNumber;
          SharedPrefUtil.user!.mobile = fullPhoneNumber; // Update both fields
          SharedPrefUtil.user!.address = addressController.text.trim();
          SharedPrefUtil.user!.city = selectedCity?.cityName ?? '';
          SharedPrefUtil.user!.country = selectedCountry?.countryName ?? '';

          await SharedPrefUtil.setCurrentUser(SharedPrefUtil.user!);
        }

        Get.snackbar(
          "Success",
          response.message ?? "Profile updated successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Go back after successful update
        Get.back();
      } else {
        showError(response?.message ?? "Failed to update profile.");
      }
    } catch (e) {
      debugPrint("Update profile error: $e");
      showError("An error occurred. Please try again.");
    } finally {
      setLoading(false);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
