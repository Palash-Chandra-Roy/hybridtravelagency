import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/font_family.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/navigators/navigators.dart';
import 'package:hybridtravelagency/screens/auth/login_screen/login_controller.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/common_textfield_widget.dart';
import 'package:hybridtravelagency/main.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Container(
            height: 280,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(logInImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Image.asset(welcome2Canvas,
                    width: Get.width, fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 40),
                      // Expanded(
                      //   child: Align(
                      //     alignment: Alignment.topRight,
                      //     child: InkWell(
                      //       onTap: () {
                      //         Get.to(() => NavigationScreen());
                      //       },
                      //       child: CommonTextWidget.PoppinsSemiBold(
                      //         text: "SKIP",
                      //         color: white,
                      //         fontSize: 16,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget.PoppinsSemiBold(
                            text: "Join the club of 10 crore+ "
                                "happy travellers",
                            color: white,
                            fontSize: 22,
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 245),
            child: Container(
              // height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: white,
              ),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        CommonTextWidget.PoppinsMedium(
                          text: "Use Email to Login/Signup",
                          color: grey929,
                          fontSize: 14,
                        ),
                        SizedBox(height: 35),
                        CommonTextFieldWidget.TextFormField5(
                          hintText: "Enter Email",
                          keyboardType: TextInputType.text,
                          controller: controller.emailController,
                          prefixIcon: Icon(Icons.email),
                          onChange: (value) {

                          },
                        ),  
                        // CommonTextFieldWidget.TextFormField1(
                        //   hintText: "Enter Number",
                        //   keyboardType: TextInputType.text,
                        //   controller: numberController,
                        //   // prefixIcon: Padding(
                        //   //   padding: EdgeInsets.only(left: 15),
                        //   //   child: InkWell(
                        //   //     onTap: () {
                        //   //       Get.to(() => SelectCountryScreen());
                        //   //     },
                        //   //     child: Row(
                        //   //       mainAxisSize: MainAxisSize.min,
                        //   //       children: [
                        //   //         Image.asset(indianFlagImage,
                        //   //             height: 23, width: 23),
                        //   //         SizedBox(width: 4),
                        //   //         CommonTextWidget.PoppinsMedium(
                        //   //           text: "+91",
                        //   //           color: grey929,
                        //   //           fontSize: 16,
                        //   //         ),
                        //   //         SizedBox(width: 8),
                        //   //         SizedBox(
                        //   //           height: 30,
                        //   //           child: VerticalDivider(
                        //   //             color: grey929,
                        //   //             thickness: 1.5,
                        //   //           ),
                        //   //         ),
                        //   //         SizedBox(width: 12),
                        //   //       ],
                        //   //     ),
                        //   //   ),
                        //   // ),
                        //   onChange: (value) {
                        //
                        //   },
                        // ),
                        SizedBox(height: 14),
                        CommonTextFieldWidget.TextFormField10(
                          hintText: "Enter Password",
                          keyboardType: TextInputType.text,
                          controller: controller.passwordController,
                          prefixIcon: Icon(Icons.password),
                          obscureText: controller.passwordVisibility,
                          onChange: (value) {

                          },
                          suffixIcon: IconButton(
                            onPressed: () => controller.togglePasswordVisibility(),
                            icon: Icon(controller.passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined)
                          ),
                        ),
                        SizedBox(height: 35),
                        CommonButtonWidget.button(
                          isLoading: controller.isLoading,
                          onTap: () {
                            controller.login();
                            // Get.to(() => OtpScreen());
                          },
                          // buttonColor: loginController.isTextEmpty.isFalse
                          //     ? greyD8D
                          //     : redCA0,
                           buttonColor: primary,
                          text: "CONTINUE",
                        ),
                        SizedBox(height: 55),
                        GestureDetector(
                          onTap: () {
                            RouteManagement.goToRegisterScreen();
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: greyD8D, width: 1),
                              color: white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: CommonTextWidget.PoppinsMedium(
                                text: "Register Now",
                                color: grey717,
                                fontSize: 16,
                              ),
                            )
                          ),
                        ),
                        SizedBox(height: 25),
                        // InkWell(
                        //   onTap: () {
                        //     Get.to(() => ReferralScreen());
                        //   },
                        //   child: RichText(
                        //     textAlign: TextAlign.center,
                        //     text: TextSpan(
                        //       text: "Have a ",
                        //       style: TextStyle(
                        //         fontFamily: FontFamily.PoppinsMedium,
                        //         fontSize: 14,
                        //         color: grey929,
                        //       ),
                        //       children: <TextSpan>[
                        //         TextSpan(
                        //           text: "Referral Code?",
                        //           style: TextStyle(
                        //               fontSize: 14,
                        //               fontFamily: FontFamily.PoppinsSemiBold,
                        //               color: redCA0),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 25),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "By proceeding, you agree to Hybrid Travel Agency ",
                            style: TextStyle(
                              fontFamily: FontFamily.PoppinsRegular,
                              fontSize: 10,
                              color: grey929,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Privacy Policy. User Agreement. T&Cs ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: FontFamily.PoppinsMedium,
                                    color: primary),
                              ),
                              TextSpan(
                                text: "as well Mobile connect’s ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: FontFamily.PoppinsRegular,
                                    color: grey929),
                              ),
                              TextSpan(
                                text: "T&Cs",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: FontFamily.PoppinsMedium,
                                    color: primary),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );});
  }
}
