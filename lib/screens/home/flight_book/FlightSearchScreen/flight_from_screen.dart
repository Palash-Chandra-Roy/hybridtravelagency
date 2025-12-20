import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/font_family.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_controller.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';
import 'package:hybridtravelagency/widgets/common_textfield_widget.dart';

class FlightFromScreen extends StatelessWidget {
  FlightFromScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightSearchController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: redF8E,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: greyE8E, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child:
                            Icon(Icons.arrow_back, color: black2E2, size: 20),
                      ),
                      SizedBox(width: 21),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: "From",
                            color: redCA0,
                            fontSize: 14,
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 130, left: 24, right: 24),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: white,
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: grey515.withValues(alpha: 0.25),
                          //           blurRadius: 6,
                          //           offset: Offset(0, 1),
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(5),
                          //     ),
                          //     child: CommonTextFieldWidget.TextFormField2(
                          //       keyboardType: TextInputType.text,
                          //       controller: searchController,
                          //       hintText: "Search for an Area,Address...",
                          //       prefixIcon: Icon(CupertinoIcons.search),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.625,
                              height: 30,
                              child: CommonTextFieldWidget.TextFormField11(
                                  controller: controller.originController,
                                  hintText: "Enter any City/Airport Name",
                                  onChange: (val) {
                                    // controller.setOrigin(val);
                                  },
                                  onFieldSubmit: (val) {
                                    controller.getAirports(val);
                                  })),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: greyE8E, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        toFlightImage,
                        width: 22.94,
                        fit: BoxFit.scaleDown,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: "To",
                            color: black2E2,
                            fontSize: 14,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "",
                              style: TextStyle(
                                fontFamily: FontFamily.PoppinsMedium,
                                fontSize: 14,
                                color: black2E2,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: FontFamily.PoppinsMedium,
                                      color: grey717),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              CommonTextWidget.PoppinsMedium(
                text: "Popular Searches",
                color: grey717,
                fontSize: 12,
              ),
              controller.isLoading
                  ? Expanded(
                      child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.builder(
                              // padding: EdgeInsets.symmetric(horizontal: 24),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return airportsShimmer();
                              })))
                  : controller.airportsList.isNotEmpty
                      ? Expanded(
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: controller.airportsList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var airport = controller.airportsList[index];
                                  return ListTile(
                                    onTap: () {
                                      controller.setOrigin(airport);
                                      SharedPrefUtil.addAirportSearch(airport);
                                      controller.clearAirportList();
                                      Get.back();
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    title: CommonTextWidget.PoppinsRegular(
                                      text: airport.countryName,
                                      color: black2E2,
                                      fontSize: 16,
                                    ),
                                    subtitle: CommonTextWidget.PoppinsRegular(
                                      text: airport.name,
                                      color: grey717,
                                      fontSize: 12,
                                    ),
                                    trailing: CommonTextWidget.PoppinsMedium(
                                      text: airport.code,
                                      color: grey717,
                                      fontSize: 16,
                                    ),
                                  );
                                }),
                          ),
                        )
                      : controller.popularAirports.isNotEmpty
                          ? Expanded(
                              child: ScrollConfiguration(
                                  behavior: MyBehavior(),
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount:
                                          controller.popularAirports.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var airport =
                                            controller.popularAirports[index];
                                        return ListTile(
                                          onTap: () {
                                            controller.setOrigin(airport);
                                            SharedPrefUtil.addAirportSearch(
                                                airport);
                                            controller.clearAirportList();
                                            controller.getPopularSearches();
                                            Get.back();
                                          },
                                          contentPadding: EdgeInsets.zero,
                                          title:
                                              CommonTextWidget.PoppinsRegular(
                                            text: airport.countryName,
                                            color: black2E2,
                                            fontSize: 16,
                                          ),
                                          subtitle:
                                              CommonTextWidget.PoppinsRegular(
                                            text: airport.name,
                                            color: grey717,
                                            fontSize: 12,
                                          ),
                                          trailing:
                                              CommonTextWidget.PoppinsMedium(
                                            text: airport.code,
                                            color: grey717,
                                            fontSize: 16,
                                          ),
                                        );
                                      })),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Center(
                                child: Text('No Airport Found'),
                              ),
                            ),
            ],
          ),
        ),
      );
    });
  }
}
