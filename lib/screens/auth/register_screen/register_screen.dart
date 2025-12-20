import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/auth/register_screen/register_controller.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/common_textfield_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: false,
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
                text: "Welcome Aboard!",
                color: black2E2,
                fontSize: 20,
              ),
              CommonTextWidget.PoppinsRegular(
                text: "Complete your profile to make your booking faster.",
                color: black2E2,
                fontSize: 16,
              ),
              SizedBox(height: 35),
              CommonTextFieldWidget.TextFormField5(
                controller: controller.nameController,
                hintText: "Enter Name",
                keyboardType: TextInputType.text,
                // controller: numberController,
                prefixIcon: Icon(Icons.person),
                onChange: (value) {},
              ),
              SizedBox(height: 10),
              CommonTextFieldWidget.TextFormField5(
                controller: controller.emailController,
                hintText: "Enter Email",
                keyboardType: TextInputType.text,
                // controller: numberController,
                prefixIcon: Icon(Icons.email),
                onChange: (value) {},
              ),
              SizedBox(height: 10),
              CommonTextFieldWidget.TextFormField5(
                controller: controller.phoneController,
                hintText: "Enter Number",
                keyboardType: TextInputType.number,
                //controller: numberController,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: white,
                          textStyle: TextStyle(fontSize: 16, color: black2E2),
                          bottomSheetHeight: 500,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greyD8D,
                              ),
                            ),
                          ),
                        ),
                        onSelect: (Country country) {
                          controller.setSelectedCountry(
                            countryCode: '+${country.phoneCode}',
                            countryFlag: country.flagEmoji,
                            countryName: country.name,
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          controller.selectedCountryFlag,
                          style: TextStyle(fontSize: 23),
                        ),
                        SizedBox(width: 4),
                        CommonTextWidget.PoppinsMedium(
                          text: controller.selectedCountryCode,
                          color: grey929,
                          fontSize: 16,
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          height: 30,
                          child: VerticalDivider(
                            color: grey929,
                            thickness: 1.5,
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                  ),
                ),
                onChange: (value) {},
              ),
              SizedBox(height: 10),
              CommonTextFieldWidget.TextFormField10(
                controller: controller.passwordController,
                hintText: "Enter Password",
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.password),
                obscureText: controller.passwordVisibility,
                onChange: (value) {},
                suffixIcon: IconButton(
                  onPressed: () => controller.togglePasswordVisibility(),
                  icon: Icon(controller.passwordVisibility
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
              SizedBox(height: 10),
              CommonTextFieldWidget.TextFormField10(
                controller: controller.confirmPasswordController,
                hintText: "Confirm Password",
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.password),
                obscureText: controller.confirmPasswordVisibility,
                onChange: (value) {},
                suffixIcon: IconButton(
                  onPressed: () => controller.toggleConfirmPasswordVisibility(),
                  icon: Icon(controller.confirmPasswordVisibility
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
              Spacer(),
              CommonButtonWidget.button(
                isLoading: controller.isLoading,
                onTap: () {
                  controller.register();
                },
                buttonColor: primary,
                // fullNameController.isTextEmpty.isFalse ? greyD8D : redCA0,
                text: "SUBMIT",
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      );
    });
  }
}
