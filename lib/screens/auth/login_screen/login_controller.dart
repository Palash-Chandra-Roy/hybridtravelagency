import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/navigators/routes_management.dart';
import 'package:hybridtravelagency/screens/auth/login_screen/login_presenter.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';

class LoginController extends GetxController{
  LoginController(this._loginPresenter);
  final LoginPresenter _loginPresenter;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;

  void togglePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    update();
  }
  var isTextEmpty = false;
  var isLoading = false;


  dynamic setLoading(dynamic value){
    isLoading = value;
    update();
  }
  Future<void> login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      showError("Please enter email and password.");
      return;
    }

    setLoading(true);
    FocusScope.of(Get.context!).unfocus();

    try {
      final response = await _loginPresenter.login(
        isLoading: false,
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response != null &&
          response.success == true &&
          response.data?.user != null) {
        setLoading(false);
        SharedPrefUtil.isLogin = true;
        SharedPrefUtil.authToken = response.data?.token ?? "";
        await SharedPrefUtil.setCurrentUser(response.data!.user!);

        await SharedPrefUtil.synchronizeSettingsToPhone();
        await SharedPrefUtil.synchronizeSettingsFromPhone();

        Get.snackbar("Success", response.message ?? "Login successful",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white);

        RouteManagement.goToNavigationScreen();
      } else {

        showError(response?.message ?? "Invalid credentials, Login failed");

      }
    } catch (e) {
      showError("An error occurred. Please try again.");
    } finally {
      setLoading(false);
    }
  }
}