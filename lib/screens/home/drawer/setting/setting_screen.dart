import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/screens/home/drawer/country/country_screen.dart';
import 'package:hybridtravelagency/screens/home/drawer/currency/currency_screen.dart';
import 'package:hybridtravelagency/screens/home/drawer/dialogs/country_selection_dialog.dart';
import 'package:hybridtravelagency/screens/home/drawer/setting/setting_controller.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) {
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
          text: "Settings",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget.PoppinsMedium(
                  text: "Country/Region",
                  color: black2E2,
                  fontSize: 16,
                ),
               GestureDetector(
                          onTap: () {
                            Get.to(() => CountryScreen(
                              onCountrySelected: (country){
                                controller.updateSelectedCountry(country);
                              },
                            ));
                            // showCountryDialog(
                            //     context, SharedPrefUtil.countries!,controller);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: redF9E,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.175,
                                    child: Text(
                                      maxLines: 2,
                                      controller.selectedCountry!=null?
                                      controller.selectedCountry!.countryName!:
                                          "Select Country",
                                      style: TextStyle(
                                          color: redCA0, fontSize: 14),
                                    )),
                                Icon(Icons.keyboard_arrow_down, color: redCA0)
                              ],
                            ),
                          )),
                // Image.asset(settingImage1, height: 31, width: 109),
                // FutureBuilder<CountryData?>(
                //   future: SharedPrefUtil.getSelectedCountry(),
                //   builder: (context, snapshot) {
                //     final selectedCountry = snapshot.data;
                //
                //     return DropdownButton<int>(
                //       value: selectedCountry?.countryId,
                //       hint: const Text("Select Country"),
                //       underline: const SizedBox(),
                //       isDense: true, // reduces vertical space
                //       isExpanded: false, // prevents unnecessary stretching
                //       items: (SharedPrefUtil.countries ?? []).map((country) {
                //         return DropdownMenuItem<int>(
                //           value: country.countryId,
                //           child: Row(
                //             mainAxisSize: MainAxisSize.min, // shrink to content
                //             children: [
                //               Text(country.countryName ?? ""),
                //             ],
                //           ),
                //         );
                //       }).toList(),
                //       onChanged: (value) async {
                //         final chosenCountry = SharedPrefUtil.countries!
                //             .firstWhere((c) => c.countryId == value);
                //         await SharedPrefUtil.setSelectedCountry(chosenCountry);
                //       },
                //     );
                //   },
                // )
              ],
            ),
            SizedBox(height: 35),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CommonTextWidget.PoppinsMedium(
            //       text: "Language",
            //       color: black2E2,
            //       fontSize: 16,
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Get.to(() => LanguageScreen());
            //       },
            //       child:
            //       Image.asset(settingImage2, height: 31, width: 109),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget.PoppinsMedium(
                  text: "Currency",
                  color: black2E2,
                  fontSize: 16,
                ),
                // CommonTextWidget.PoppinsMedium(
                //   text: "Indian Rupee (₹)",
                //   color: greyBCB,
                //   fontSize: 14,
                // ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => CurrencyScreen(
                        onCurrencySelected: (currency){
                          controller.updateSelectedCurrency(currency);
                        },
                      ));
                      // showCountryDialog(
                      //     context, SharedPrefUtil.countries!,controller);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: redF9E,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.175,
                              child: Text(
                                maxLines: 2,
                                controller.selectedCurrency!=null?
                                controller.selectedCurrency!.text??'':
                                "Select Currency",
                                style: TextStyle(
                                    color: redCA0, fontSize: 14),
                              )),
                          Icon(Icons.keyboard_arrow_down, color: redCA0)
                        ],
                      ),
                    )),
              ],
            ),
            Spacer(),
            CommonButtonWidget.button(
              buttonColor: primary,
              onTap: () {},
              text: "APPLY CHANGES",
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );});
  }

  void showCountryDialog(BuildContext context, List<CountryData> countries, SettingController controller) {
    showDialog(
      context: context,
      builder: (_) => CountrySelectionDialog(
        countries: countries,
        onCountrySelected: (country) async {
          controller.updateSelectedCountry(country);
        },
      ),
    );
  }
}
