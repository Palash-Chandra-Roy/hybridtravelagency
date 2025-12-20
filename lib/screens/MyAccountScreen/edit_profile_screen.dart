import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/screens/MyAccountScreen/edit_profile_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/common_textfield_widget.dart';
import 'package:hybridtravelagency/main.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: primary,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: white, size: 20),
          ),
          title: CommonTextWidget.PoppinsSemiBold(
            text: "Edit Profile",
            color: white,
            fontSize: 18,
          ),
          actions: [
            InkWell(
              onTap: controller.isLoading
                  ? null
                  : () {
                      controller.updateProfile();
                    },
              child: Padding(
                padding: EdgeInsets.only(right: 24, top: 20),
                child: controller.isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(white),
                        ),
                      )
                    : CommonTextWidget.PoppinsMedium(
                        text: "Save",
                        color: white,
                        fontSize: 13,
                      ),
              ),
            ),
          ],
        ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        radius: 4,
                        backgroundColor: white,
                        title: "",
                        contentPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 13),
                              child: CommonTextWidget.PoppinsMedium(
                                text: "Select Photo",
                                color: black2E2,
                                fontSize: 14,
                              ),
                            ),
                            Divider(color: greyE2E, thickness: 1),
                            ListTile(
                              horizontalTitleGap: 16,
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: SvgPicture.asset(cameraIcon),
                              ),
                              title: CommonTextWidget.PoppinsMedium(
                                text: "Camera",
                                color: grey717,
                                fontSize: 14,
                              ),
                              subtitle: CommonTextWidget.PoppinsRegular(
                                text: "Take a beautiful picture",
                                color: greyAFA,
                                fontSize: 12,
                              ),
                            ),
                            Divider(color: greyE2E, thickness: 1),
                            ListTile(
                              horizontalTitleGap: 16,
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: SvgPicture.asset(galleryIcon),
                              ),
                              title: CommonTextWidget.PoppinsMedium(
                                text: "Gallery",
                                color: grey717,
                                fontSize: 14,
                              ),
                              subtitle: CommonTextWidget.PoppinsRegular(
                                text: "Choose an existing photo",
                                color: greyAFA,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.asset(myAccountImage, height: 90, width: 90),
                          SvgPicture.asset(editIcon),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  CommonTextWidget.PoppinsMedium(
                    text: "Full Name",
                    color: black2E2,
                    fontSize: 14,
                  ),
                  SizedBox(height: 10),
                  CommonTextFieldWidget.TextFormField8(
                    keyboardType: TextInputType.name,
                    controller: controller.nameController,
                    hintText: "Enter your full name",
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: SvgPicture.asset(profileIcon),
                    ),
                  ),
                  SizedBox(height: 22),
                  CommonTextWidget.PoppinsMedium(
                    text: "Email ID (Read-only)",
                    color: black2E2,
                    fontSize: 14,
                  ),
                  SizedBox(height: 10),
                  AbsorbPointer(
                    child: Opacity(
                      opacity: 0.6,
                      child: CommonTextFieldWidget.TextFormField8(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        hintText: "Email address",
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(16),
                          child: SvgPicture.asset(emailIcon),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  CommonTextWidget.PoppinsMedium(
                    text: "Mobile No.",
                    color: black2E2,
                    fontSize: 14,
                  ),
                  SizedBox(height: 10),
                  CommonTextFieldWidget.TextFormField5(
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                    hintText: "Enter Number",
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
                              textStyle:
                                  TextStyle(fontSize: 16, color: black2E2),
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
                              controller.setSelectedPhoneCountry(
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
                              controller.selectedPhoneCountryFlag,
                              style: TextStyle(fontSize: 23),
                            ),
                            SizedBox(width: 4),
                            CommonTextWidget.PoppinsMedium(
                              text: controller.selectedPhoneCountryCode,
                              color: grey929,
                              fontSize: 16,
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, color: grey929),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  CommonTextWidget.PoppinsMedium(
                    text: "Address",
                    color: black2E2,
                    fontSize: 14,
                  ),
                  SizedBox(height: 10),
                  CommonTextFieldWidget.TextFormField8(
                    keyboardType: TextInputType.streetAddress,
                    controller: controller.addressController,
                    hintText: "Enter your address",
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.location_on, color: grey717),
                    ),
                  ),
                  SizedBox(height: 22),
                  CommonTextWidget.PoppinsMedium(
                    text: "Country",
                    color: black2E2,
                    fontSize: 14,
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: greyD8D, width: 1),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Autocomplete<CountryData>(
                      optionsBuilder: (TextEditingValue value) {
                        if (value.text.isEmpty) {
                          return const Iterable<CountryData>.empty();
                        }
                        return (SharedPrefUtil.countries ?? []).where(
                            (country) => country.countryName!
                                .toLowerCase()
                                .contains(value.text.toLowerCase()));
                      },
                      displayStringForOption: (CountryData option) =>
                          option.countryName ?? '',
                      onSelected: (selected) async {
                        await controller.onCountrySelected(selected);
                      },
                      fieldViewBuilder: (context, textController, focusNode,
                          onFieldSubmitted) {
                        return TextField(
                          controller: textController,
                          focusNode: focusNode,
                          decoration: const InputDecoration(
                            hintText: "Type country name...",
                            border: InputBorder.none,
                          ),
                        );
                      },
                      optionsViewBuilder: (context, onSelected, options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (context, index) {
                                  final option = options.elementAt(index);
                                  return ListTile(
                                    title: Text(option.countryName ?? ''),
                                    onTap: () => onSelected(option),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  if (controller.isLoadingCities)
                    const Center(child: CircularProgressIndicator())
                  else if (controller.availableCities.isNotEmpty) ...[
                    SizedBox(height: 7),
                    CommonTextWidget.PoppinsMedium(
                      text: "City",
                      color: black2E2,
                      fontSize: 14,
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: greyD8D, width: 1),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Autocomplete<CityData>(
                        optionsBuilder: (TextEditingValue value) {
                          if (value.text.isEmpty) {
                            return const Iterable<CityData>.empty();
                          }
                          return controller.availableCities.where((city) => city
                              .cityName!
                              .toLowerCase()
                              .contains(value.text.toLowerCase()));
                        },
                        displayStringForOption: (CityData option) =>
                            option.cityName ?? '',
                        onSelected: (selected) async {
                          controller.onCitySelected(selected);
                        },
                        fieldViewBuilder: (context, textController, focusNode,
                            onFieldSubmitted) {
                          return TextField(
                            controller: textController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: controller.availableCities.isEmpty
                                  ? "Select a country first..."
                                  : "Type city name...",
                              border: InputBorder.none,
                            ),
                          );
                        },
                        optionsViewBuilder: (context, onSelected, options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: options.length,
                                  itemBuilder: (context, index) {
                                    final option = options.elementAt(index);
                                    return ListTile(
                                      title: Text(option.cityName ?? ''),
                                      onTap: () => onSelected(option),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
