import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/screens/home/drawer/country/country_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class CountryScreen extends StatelessWidget {
  final Function(CountryData) onCountrySelected;
  CountryScreen({super.key, required this.onCountrySelected});

  @override
  Widget build(BuildContext context) {
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
          text: "Country",
          color: white,
          fontSize: 18,
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                CommonTextWidget.PoppinsSemiBold(
                  text: "Select Country",
                  color: black2E2,
                  fontSize: 16,
                ),
                SizedBox(height: 30),
                GetBuilder<CountryController>(
                  init: CountryController(),
                  builder: (controller) => ListView.builder(
                    itemCount: SharedPrefUtil.countries!.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var country = SharedPrefUtil.countries![index];
                      return Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: country.countryName,
                            color: grey717,
                            fontSize: 14,
                          ),
                          InkWell(
                            onTap: () {
                              controller.onIndexChange(index);
                              onCountrySelected(country);
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                                border: Border.all(color: redCA0),
                              ),
                              alignment: Alignment.center,
                              child: controller.selectedIndex == index
                                  ? Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: redCA0,
                                          shape: BoxShape.circle),
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    );},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
