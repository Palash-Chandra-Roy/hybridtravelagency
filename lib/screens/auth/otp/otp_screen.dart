import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/font_family.dart';

import 'package:hybridtravelagency/screens/auth/otp/otp_controller.dart';
import 'package:hybridtravelagency/screens/auth/register_screen/register_screen.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final OtpController otpController = Get.put(OtpController());

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: black2E2, size: 20),
            ),
            SizedBox(height: 30),
            CommonTextWidget.PoppinsSemiBold(
              text: "Verify your Mobile Number",
              color: black2E2,
              fontSize: 20,
            ),
            CommonTextWidget.PoppinsRegular(
              text: "OTP has been send to MOBILE",
              color: black2E2,
              fontSize: 16,
            ),
            SizedBox(height: 35),
            CommonTextWidget.PoppinsMedium(
              text: "Enter OTP",
              color: redCA0,
              fontSize: 17,
            ),
            SizedBox(height: 15),
            Container(
              color: white,
              child: Pinput(
                length: 5,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    // Assuming otpController.isTextEmpty is a boolean
                    otpController.isTextEmpty.value = true;
                  } else {
                    otpController.isTextEmpty.value = false;
                  }
                },
                controller: _pinPutController,
                focusNode: _pinPutFocusNode,
                // Define the default theme for all PIN fields
                defaultPinTheme: PinTheme(
                  width: 56, // Example width
                  height: 56, // Example height
                  textStyle: TextStyle(
                    fontFamily: FontFamily.PoppinsSemiBold,
                    fontSize: 18,
                    color: black2E2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyC7C, width: 1.5),
                    borderRadius: BorderRadius.circular(8), // Example border radius
                  ),
                ),
                // Override the theme for the currently selected PIN field
                focusedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    border: Border.all(color: redCA0, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // Override the theme for the submitted PIN field
                submittedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    border: Border.all(color: redCA0, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // You can also use other themes like focusedPinTheme, disabledPinTheme, etc.
                // The 'cursorColor' is now part of the default PinTheme's textStyle
                // which is implicitly handled.
              )
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget.PoppinsRegular(
                  text: "Auto fetching OTP send via SMS",
                  color: grey717,
                  fontSize: 14,
                ),
                CommonTextWidget.PoppinsRegular(
                  text: "29s",
                  color: black2E2,
                  fontSize: 14,
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: CommonTextWidget.PoppinsMedium(
                text: "Resend OTP",
                color: redCA0.withValues(alpha: 0.6),
                fontSize: 16,
              ),
            ),
            Spacer(),
            CommonButtonWidget.button(
              onTap: () {
                Get.to(() => RegisterScreen());
              },
              buttonColor: otpController.isTextEmpty.isFalse ? greyD8D : redCA0,
              text: "SUBMIT",
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
