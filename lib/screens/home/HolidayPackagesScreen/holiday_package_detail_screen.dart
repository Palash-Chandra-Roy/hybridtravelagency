import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_packages_controller.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/widgets/holiday_card.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';

import '../../../widgets/common_text_widget.dart';

class HolidayPackageDetailScreen extends StatelessWidget {
  HolidayPackageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HolidayPackagesController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        // appBar: AppBar(
        //   backgroundColor: white,
        //   automaticallyImplyLeading: false,
        //   elevation: 0,
        //   centerTitle: true,
        //   leading: InkWell(
        //     onTap: () {
        //       Get.back();
        //     },
        //     child: Icon(Icons.arrow_back, color: black2E2, size: 20),
        //   ),
        //   title: CommonTextWidget.PoppinsSemiBold(
        //     text: "My Holidays",
        //     color: black2E2,
        //     fontSize: 18,
        //   ),

        // ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(holidayPackageDetailImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back, color: white, size: 20),
                        ),
                        CommonTextWidget.PoppinsSemiBold(
                          text: controller.country,
                          color: white,
                          fontSize: 18,
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  width: Get.width,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      itemCount: Lists.holidayPackagesDetailList1.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                          top: 13, bottom: 13, left: 24, right: 12),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: InkWell(
                          onTap: Lists.holidayPackagesDetailList1[index]
                              ["onTap"],
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: white,
                                border: Border.all(color: greyB3B, width: 1)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: CommonTextWidget.PoppinsMedium(
                                  text: Lists.holidayPackagesDetailList1[index]
                                      ["text"],
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
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: grey9B9.withValues(alpha: 0.15),
                      border: Border.all(color: greyE2E, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CommonTextWidget.PoppinsMedium(
                                text: controller.city,
                                color: grey717,
                                fontSize: 14,
                              ),
                              CommonTextWidget.PoppinsSemiBold(
                                text: "- ${controller.country}",
                                color: black2E2,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          // CommonTextWidget.PoppinsRegular(
                          //   text: "Add Travel date",
                          //   color: grey717,
                          //   fontSize: 12,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     Get.to(() => EditYourSearchScreen());
                          //   },
                          //   child: CommonTextWidget.PoppinsMedium(
                          //     text: "Edit",
                          //     color: redCA0,
                          //     fontSize: 12,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24),
                //   child: CommonTextWidget.PoppinsSemiBold(
                //     text: "Deal-Wothy Thailand Holidays!",
                //     color: black2E2,
                //     fontSize: 16,
                //   ),
                // ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: Get.width,
                    child: controller.isLoading
                        ? ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: holidaysShimmer(),
                              );
                            })
                        : controller.holidaysList.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller.holidaysList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                itemBuilder: (context, index) {
                                  return HolidayCard(
                                      data: controller.holidaysList[index]);
                                },
                              )
                            : SizedBox(
                                child: Center(
                                  child: Text('No Holidays Found'),
                                ),
                              )),
                // SizedBox(
                //   height: 255,
                //   width: Get.width,
                //   child: ScrollConfiguration(
                //     behavior: MyBehavior(),
                //     child: ListView.builder(
                //       itemCount: Lists.holidayPackagesDetailList2.length,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       padding: EdgeInsets.only(
                //           top: 13, bottom: 13, left: 24, right: 12),
                //       itemBuilder: (context, index) => Padding(
                //         padding: EdgeInsets.only(right: 12),
                //         child: InkWell(
                //           onTap: () {
                //             Get.to(() => PackageDetailScreen());
                //           },
                //           child: Image.asset(
                //             Lists.holidayPackagesDetailList2[index],
                //             height: 255,
                //             width: 215,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 10),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24),
                //   child: CommonTextWidget.PoppinsSemiBold(
                //     text: "A Treat gor the Honeymoons!",
                //     color: black2E2,
                //     fontSize: 16,
                //   ),
                // ),
                // SizedBox(
                //   height: 255,
                //   width: Get.width,
                //   child: ScrollConfiguration(
                //     behavior: MyBehavior(),
                //     child: ListView.builder(
                //       itemCount: Lists.holidayPackagesDetailList3.length,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       padding: EdgeInsets.only(
                //           top: 13, bottom: 13, left: 24, right: 12),
                //       itemBuilder: (context, index) => Padding(
                //         padding: EdgeInsets.only(right: 12),
                //         child: InkWell(
                //           onTap: () {
                //             // Get.to(() => ExploreScreen());
                //           },
                //           child: Image.asset(
                //             Lists.holidayPackagesDetailList3[index],
                //             height: 255,
                //             width: 215,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
