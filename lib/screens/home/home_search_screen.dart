import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class HomeSearchSCreen extends StatelessWidget {
  HomeSearchSCreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            Container(
              width: Get.width,
              color: redCA0,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back, color: white, size: 20),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: white, width: 0)),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Autocomplete<CountryData>(
                          optionsBuilder: (TextEditingValue value) {
                            if (value.text.isEmpty) {
                              return const Iterable<CountryData>.empty();
                            }
                            return SharedPrefUtil.countries!.where((country) =>
                                country.countryName!
                                    .toLowerCase()
                                    .contains(value.text.toLowerCase()));
                          },
                          displayStringForOption: (CountryData option) =>
                              option.countryName ?? '',
                          onSelected: (selected) async {
                            controller.setCountry(selected);
                            await controller.getCities(selected.countryId!);
                          },
                          fieldViewBuilder: (context, textController, focusNode,
                              onFieldSubmitted) {
                            return TextField(
                              controller: textController,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                hintText: "Type country name...",
                                border: InputBorder.none,
                                suffixIcon: controller.isCitiesLoading
                                    ? Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      )
                                    : null,
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
                                  width: MediaQuery.of(context).size.width - 32,
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

                      // CommonTextFieldWidget.TextFormField2(
                      //   prefixIcon: Icon(CupertinoIcons.search, color: grey717),
                      //   keyboardType: TextInputType.text,
                      //   controller: searchController,
                      //   hintText: "Try ‘Activities’",
                      //   onFieldSubmitted: (value){
                      //     Get.back(result: searchController.text);
                      //   }
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        color: greyEEE,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: CommonTextWidget.PoppinsSemiBold(
                            text: "TOP SERVICES",
                            color: black2E2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        width: Get.width,
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.builder(
                            itemCount: Lists.homeSearchList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                                top: 13, bottom: 13, left: 24, right: 12),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grey323.withValues(alpha: 0.25),
                                      blurRadius: 6,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: CommonTextWidget.PoppinsMedium(
                                      text: Lists.homeSearchList[index],
                                      color: grey5F5,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        color: greyEEE,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: CommonTextWidget.PoppinsSemiBold(
                            text: "RECENT SEARCHES",
                            color: black2E2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: -5,
                          leading: SvgPicture.asset(recentSearchesIcon),
                          title: CommonTextWidget.PoppinsRegular(
                            text: "New Delhi to Mumbai flights for 24th Sep",
                            color: grey717,
                            fontSize: 14,
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: redCA0),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: Get.width,
                        color: greyEEE,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: CommonTextWidget.PoppinsSemiBold(
                            text: "WHAT’S INDIA SEARCHING FOR",
                            color: black2E2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: -5,
                              leading: SvgPicture.asset(trendArrow,
                                  colorFilter: ColorFilter.mode(
                                      grey969, BlendMode.srcIn)),
                              title: CommonTextWidget.PoppinsRegular(
                                text: "Cheapest flight from Delhi to Dharmsala",
                                color: grey717,
                                fontSize: 14,
                              ),
                              trailing:
                                  Icon(Icons.arrow_forward_ios, color: redCA0),
                            ),
                            SizedBox(height: 12),
                            index == 5
                                ? SizedBox.shrink()
                                : Divider(thickness: 1, color: greyDED),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
