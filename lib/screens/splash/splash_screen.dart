import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (splashController) {
        return Scaffold(
          backgroundColor: white,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Image.asset(appLogo),
            ),
          ),
        );
      },
    );
  }
}
