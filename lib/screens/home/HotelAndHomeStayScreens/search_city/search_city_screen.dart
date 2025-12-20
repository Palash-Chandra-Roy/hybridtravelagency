import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/main.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/allow_location_access_screen.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_controller.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/search_city/search_city_controller.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/search_city/widgets/destinations_shimmer.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/common_textfield_widget.dart';

class SearchCityScreen extends StatelessWidget {
  SearchCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchCityController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: redFAE.withValues(alpha: 0.6),
                  border: Border.all(color: redCA0, width: 1),
                ),
                child: ListTile(
                  horizontalTitleGap: -7,
                  leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back, color: black2E2, size: 20),
                  ),
                  title: CommonTextWidget.PoppinsMedium(
                    text: "City/Area/Landmark/Property/Name",
                    color: redCA0,
                    fontSize: 12,
                  ),

                  subtitle: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.625,
                      height: 30,
                      child: CommonTextFieldWidget.TextFormField11(
                          controller: controller.destinationController,
                          hintText:
                              "Enter any City/Area/Landmark/Property/Name",
                          onChange: (val) {
                            // controller.setOrigin(val);
                          },
                          onFieldSubmit: (val) {
                            controller.getDestinations(val);
                          })),
                  // CommonTextWidget.PoppinsRegular(
                  //   text: "Enter City/Area/Property Name",
                  //   color: grey717,
                  //   fontSize: 14,
                  // ),
                ),
              ),
            ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: controller.isLoading
              ? ScrollConfiguration(
            behavior: MyBehavior(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => destinationsShimmer(),
              ),
            ),
          )
              : controller.destinationsList.isNotEmpty
              ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.destinationsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var destination = controller.destinationsList[index];
                  return ListTile(
                    onTap: () {
                      controller.setDestination(destination);
                      Get.find<HotelAndHomeStayController>()
                          .setDestination(destination);
                      SharedPrefUtil.addDestinationSearch(destination);
                      controller.clearDestinationList();
                      Get.back();
                    },
                    contentPadding: EdgeInsets.zero,
                    title: CommonTextWidget.PoppinsRegular(
                      text: destination.id,
                      color: black2E2,
                      fontSize: 16,
                    ),
                    subtitle: CommonTextWidget.PoppinsRegular(
                      text: destination.text,
                      color: grey717,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
          )
              : SizedBox.shrink(),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: Center(
                //     child: Text('No Destinations Found'),
                //   ),
                // )
                ),
            SizedBox(height: 32),
            ListTile(
              onTap: () {
                Get.bottomSheet(
                  AllowLocationAccessScreen(),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                );
              },
              horizontalTitleGap: 0,
              leading: SvgPicture.asset(crosshair),
              title: CommonTextWidget.PoppinsMedium(
                text: "USE CURRENT LOCATION",
                color: grey717,
                fontSize: 14,
              ),
              subtitle: CommonTextWidget.PoppinsRegular(
                text: "Using GPS",
                color: black2E2,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              horizontalTitleGap: 0,
              leading: SvgPicture.asset(recentSearchesIcon),
              title: CommonTextWidget.PoppinsMedium(
                text: "Recent Searches",
                color: grey717,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 24, right: 9),
                shrinkWrap: true,
                itemCount: controller.recentDestinationsList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var recentDestination = controller.recentDestinationsList[index];
                  return

                    GestureDetector(
                      onTap: (){
                        controller.setDestination(recentDestination);
                        Get.find<HotelAndHomeStayController>().setDestination(recentDestination);
                        SharedPrefUtil.addDestinationSearch(recentDestination);
                        controller.clearDestinationList();
                        controller.getRecentSearches();
                        Get.back();
                      },
                  child:
                    Padding(
                    padding: EdgeInsets.only(right: 15, top: 5, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: grey515.withValues(alpha: 0.25),
                            blurRadius: 16,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Column(
                          children: [
                            CommonTextWidget.PoppinsRegular(
                              text: recentDestination.id,
                              color: black2E2,
                              fontSize: 14,
                            ),
                            CommonTextWidget.PoppinsRegular(
                              text: recentDestination.text,
                              color: grey717,
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24),
            //   child: InkWell(
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: white,
            //         borderRadius: BorderRadius.circular(5),
            //         boxShadow: [
            //           BoxShadow(
            //             color: grey515.withValues(alpha: 0.25),
            //             blurRadius: 16,
            //             offset: Offset(0, 1),
            //           ),
            //         ],
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            //         child: Column(
            //           children: [
            //             CommonTextWidget.PoppinsRegular(
            //               text: "Goa",
            //               color: black2E2,
            //               fontSize: 14,
            //             ),
            //             CommonTextWidget.PoppinsRegular(
            //               text: "India",
            //               color: grey717,
            //               fontSize: 10,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 30),
            // ListTile(
            //   horizontalTitleGap: -7,
            //   leading: SvgPicture.asset(trendArrow, colorFilter: ColorFilter.mode(grey717, BlendMode.srcIn)),
            //   title: CommonTextWidget.PoppinsMedium(
            //     text: "Recent Searches",
            //     color: grey717,
            //     fontSize: 14,
            //   ),
            // ),
            // SizedBox(
            //   height: 65,
            //   child: ListView.builder(
            //     padding: EdgeInsets.only(left: 24, right: 9),
            //     shrinkWrap: true,
            //     itemCount: Lists.citySearchRecentSearchesList.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) => Padding(
            //       padding: EdgeInsets.only(right: 15, top: 5, bottom: 5),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: white,
            //           borderRadius: BorderRadius.circular(5),
            //           boxShadow: [
            //             BoxShadow(
            //               color: grey515.withValues(alpha: 0.25),
            //               blurRadius: 16,
            //               offset: Offset(0, 1),
            //             ),
            //           ],
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            //           child: Column(
            //             children: [
            //               CommonTextWidget.PoppinsRegular(
            //                 text: Lists.citySearchRecentSearchesList[index],
            //                 color: black2E2,
            //                 fontSize: 14,
            //               ),
            //               CommonTextWidget.PoppinsRegular(
            //                 text: "India",
            //                 color: grey717,
            //                 fontSize: 10,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ));
    });
  }
}
