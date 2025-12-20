import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/navigators/routes_management.dart';
import 'package:hybridtravelagency/screens/auth/register_screen/register_presenter.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';

class RegisterController extends GetxController {
  RegisterController(this._registerPresenter);
  final RegisterPresenter _registerPresenter;
  var isTextEmpty = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  // Country selection - default to US (+1)
  String selectedCountryCode = "+1";
  String selectedCountryFlag = "🇺🇸"; // US flag emoji
  String selectedCountryName = "United States";

  void setSelectedCountry({
    required String countryCode,
    required String countryFlag,
    required String countryName,
  }) {
    selectedCountryCode = countryCode;
    selectedCountryFlag = countryFlag;
    selectedCountryName = countryName;
    update();
  }

  bool passwordVisibility = true;
  void togglePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    update();
  }

  bool confirmPasswordVisibility = true;
  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisibility = !confirmPasswordVisibility;
    update();
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  Future<void> register() async {
    // Validate fields
    if (nameController.text.trim().isEmpty) {
      showError("Please enter your name.");
      return;
    }

    if (emailController.text.trim().isEmpty) {
      showError("Please enter your email.");
      return;
    }

    if (!_isValidEmail(emailController.text.trim())) {
      showError("Please enter a valid email address.");
      return;
    }

    if (phoneController.text.trim().isEmpty) {
      showError("Please enter your phone number.");
      return;
    }

    if (passwordController.text.trim().isEmpty) {
      showError("Please enter a password.");
      return;
    }

    if (passwordController.text.trim().length < 6) {
      showError("Password must be at least 6 characters.");
      return;
    }

    if (confirmPasswordController.text.trim().isEmpty) {
      showError("Please confirm your password.");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      showError("Passwords do not match.");
      return;
    }

    setLoading(true);

    try {
      final response = await _registerPresenter.register(
          isLoading: false,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone:
              "${selectedCountryCode}${phoneController.text.trim()}", // Include country code
          password: passwordController.text.trim(),
          passwordConfirmation: confirmPasswordController.text.trim());

      debugPrint("Register raw response: ${response?.toJson()}");

      if (response != null && response.success == true) {
        // Do not use response.data.token here because it's a List
        SharedPrefUtil.isLogin = true;
        SharedPrefUtil.authToken =
            response.data?.token ?? ""; // leave empty if no token returned

        // Fetch complete user profile with phone number and other details
        try {
          final userResponse =
              await _registerPresenter.getCurrentUser(isLoading: false);
          if (userResponse != null && userResponse.data != null) {
            await SharedPrefUtil.setCurrentUser(userResponse.data!);
          }
        } catch (e) {
          debugPrint("Error fetching user profile after registration: $e");
        }

        await SharedPrefUtil.synchronizeSettingsToPhone();
        RouteManagement.goToNavigationScreen();
        Get.snackbar(
          "Success",
          response.message ?? "Registration successful",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        showError(response?.message ?? "Registration failed.");
      }
    } catch (e) {
      debugPrint("Registration error: $e");
      showError("An error occurred. Please try again.");
    } finally {
      setLoading(false);
    }
  }
}
