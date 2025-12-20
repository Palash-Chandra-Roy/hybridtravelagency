import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/navigators/navigators.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_controller.dart';

import 'package:hybridtravelagency/screens/notification/notification_screen.dart';
import 'package:hybridtravelagency/screens/home/drawer/drawer_screen.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        key: _key,
        drawer: Drawer(
          backgroundColor: white,
          child: DrawerScreen(),
        ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 250,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(homeTopBgImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 24, right: 24, top: 60, bottom: 75),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            // InkWell(
                            //   onTap: () {
                            //     _key.currentState!.openDrawer();
                            //   },
                            //   child: Image.asset(menuIcon, height: 42, width: 42),
                            // ),
                            Column(
                              children: [
                                CommonTextWidget.PoppinsRegular(
                                  text: "Good Morning",
                                  color: white,
                                  fontSize: 14,
                                ),
                                CommonTextWidget.PoppinsMedium(
                                  text: SharedPrefUtil.user!.name ?? '',
                                  color: white,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => NotificationScreen());
                              },
                              child: Image.asset(notificationIcon,
                                  height: 42, width: 42),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () async {
                            // var result = await Get.to(() => HomeSearchSCreen());
                            // if(result!=null){
                            //   controller.searchActivities();
                            // }
                          },
                          child: Container(
                            height: 44,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                child: Autocomplete<CountryData>(
                                  optionsBuilder: (TextEditingValue value) {
                                    if (value.text.isEmpty) {
                                      return const Iterable<
                                          CountryData>.empty();
                                    }
                                    return SharedPrefUtil.countries!.where(
                                        (country) => country.countryName!
                                            .toLowerCase()
                                            .contains(
                                                value.text.toLowerCase()));
                                  },
                                  displayStringForOption:
                                      (CountryData option) =>
                                          option.countryName ?? '',
                                  onSelected: (selected) async {
                                    if (selected.countryId == 13063) {
                                      controller
                                          .loadDefaultLocationActivities();
                                    } else {
                                      controller.setCountry(selected);
                                      await controller
                                          .getCities(selected.countryId!);
                                    }
                                  },
                                  fieldViewBuilder: (context, textController,
                                      focusNode, onFieldSubmitted) {
                                    controller.countryTextController =
                                        textController;
                                    return TextField(
                                      controller:
                                          controller.countryTextController,
                                      focusNode: focusNode,
                                      decoration: InputDecoration(
                                        hintText: controller
                                                    .countryName.isNotEmpty &&
                                                controller.cityName.isNotEmpty
                                            ? "${controller.cityName}, ${controller.countryName}"
                                            : "Search...",
                                        // "Search..."
                                        border: InputBorder.none,
                                        prefixIcon: Icon(CupertinoIcons.search,
                                            color: grey717),
                                        suffixIconConstraints: BoxConstraints(
                                            minHeight: 15, minWidth: 15),
                                        suffixIcon: controller.isCitiesLoading
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: SizedBox(
                                                  height: 15,
                                                  width: 15,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                              )
                                            : null,
                                      ),
                                    );
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        elevation: 4,
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              32,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount: options.length,
                                            itemBuilder: (context, index) {
                                              final option =
                                                  options.elementAt(index);
                                              return ListTile(
                                                title: Text(
                                                    option.countryName ?? ''),
                                                onTap: () => onSelected(option),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                                // CommonTextWidget.PoppinsRegular(
                                //   text:
                                //   controller.countryName.isNotEmpty && controller.cityName.isNotEmpty?
                                //       "${controller.cityName}, ${controller.countryName}":
                                //   "Search...",
                                //   color: grey717,
                                //   fontSize: 13,
                                //
                                // ),

                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Container(
                    width: Get.width,
                    color: white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 24),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           Get.to(() => CabSearchScreen());
                        //         },
                        //         child: Column(
                        //           children: [
                        //             SizedBox(height: 70),
                        //             Image.asset(airportAndCabs,
                        //                 height: 55, width: 55),
                        //             SizedBox(height: 8),
                        //             CommonTextWidget.PoppinsMedium(
                        //               text: "Airport & \nCabs",
                        //               color: black2E2,
                        //               fontSize: 12,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Get.to(() => HomeStayScreen());
                        //         },
                        //         child: Column(
                        //           children: [
                        //             SizedBox(height: 70),
                        //             Image.asset(homeStays, height: 55, width: 55),
                        //             SizedBox(height: 8),
                        //             CommonTextWidget.PoppinsMedium(
                        //               text: "Home\nStays",
                        //               color: black2E2,
                        //               fontSize: 12,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Get.to(() => OutStationCabScreen());
                        //         },
                        //         child: Column(
                        //           children: [
                        //             SizedBox(height: 70),
                        //             Image.asset(outstationCabs,
                        //                 height: 55, width: 55),
                        //             SizedBox(height: 8),
                        //             CommonTextWidget.PoppinsMedium(
                        //               text: "Outstation\nCabs",
                        //               color: black2E2,
                        //               fontSize: 12,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Get.to(() => OutStationCabScreen());
                        //         },
                        //         child: Column(
                        //           children: [
                        //             SizedBox(height: 70),
                        //             Image.asset(hourlyStays,
                        //                 height: 55, width: 55),
                        //             SizedBox(height: 8),
                        //             CommonTextWidget.PoppinsMedium(
                        //               text: "Hourly\nStays",
                        //               color: black2E2,
                        //               fontSize: 12,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 70),
                        Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: grey656.withValues(alpha: 0.25),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 35, right: 15),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: Lists.homeList1.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 9),
                                child: InkWell(
                                  onTap: Lists.homeList1[index]["onTap"],
                                  child: Row(
                                    children: [
                                      Lists.homeList1[index]["image"]
                                              .toString()
                                              .contains('png')
                                          ? Image.asset(
                                              Lists.homeList1[index]["image"],
                                              height: 30,
                                              width: 30,
                                            )
                                          : SvgPicture.asset(
                                              Lists.homeList1[index]["image"]),
                                      SizedBox(width: 6),
                                      CommonTextWidget.PoppinsMedium(
                                        text: Lists.homeList1[index]["text"],
                                        color: black2E2,
                                        fontSize: 12,
                                      ),
                                      SizedBox(width: 9),
                                      index == 3
                                          ? SizedBox.shrink()
                                          : SizedBox(
                                              height: 30,
                                              child: VerticalDivider(
                                                color: greyD9D,
                                                thickness: 1,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: CommonTextWidget.PoppinsSemiBold(
                            text: "Welcome Offers for you!",
                            color: black2E2,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            height: 170,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(welcomeOfferImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10, right: 10),
                                child: Image.asset(arrowButtonImage,
                                    height: 32, width: 32),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 24),
                        //   child: CommonTextWidget.PoppinsSemiBold(
                        //     text: "Tourism Flagship stores",
                        //     color: black2E2,
                        //     fontSize: 16,
                        //   ),
                        // ),
                        // SizedBox(height: 10),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 24),
                        //   child: Container(
                        //     height: 140,
                        //     width: Get.width,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: white,
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: grey656.withValues(alpha: 0.25),
                        //           blurRadius: 5,
                        //         ),
                        //       ],
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         Container(
                        //           height: 140,
                        //           width: 140,
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.only(
                        //               topLeft: Radius.circular(5),
                        //               bottomLeft: Radius.circular(5),
                        //             ),
                        //             image: DecorationImage(
                        //               image:
                        //                   AssetImage(tourismFlagshipStoreImage),
                        //               fit: BoxFit.fill,
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(width: 18),
                        //         Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Image.asset(saudiaImage,
                        //                 height: 50, width: 85),
                        //             CommonTextWidget.PoppinsBold(
                        //               text: "Saudi Arabia, \nHere We Come!",
                        //               color: black2E2,
                        //               fontSize: 14,
                        //             ),
                        //             SizedBox(height: 8),
                        //             Container(
                        //               height: 30,
                        //               width: 95,
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(5),
                        //                 color: redCA0,
                        //               ),
                        //               child: Center(
                        //                 child: CommonTextWidget.PoppinsMedium(
                        //                   text: "Explore Now!",
                        //                   color: white,
                        //                   fontSize: 12,
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 15),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 24),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       CommonTextWidget.PoppinsSemiBold(
                        //         text: "Latest Collections for you",
                        //         color: black2E2,
                        //         fontSize: 16,
                        //       ),
                        //       Row(
                        //         children: [
                        //           CommonTextWidget.PoppinsRegular(
                        //             text: "View All",
                        //             color: redCA0,
                        //             fontSize: 14,
                        //           ),
                        //           SizedBox(width: 8),
                        //           Icon(Icons.arrow_forward_ios,
                        //               color: redCA0, size: 18),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 10),
                        if (controller.isActivitiesLoading)
                          const Center(
                              child: CircularProgressIndicator(
                            color: primary,
                          ))
                        else if (controller.activitiesList != null &&
                            controller.activitiesList!.isEmpty)
                          const Center(child: Text("No activities found"))
                        else if (controller.activitiesList != null)
                          ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.activitiesList!.length,
                              itemBuilder: (context, index) {
                                var activity =
                                    controller.activitiesList![index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: InkWell(
                                    onTap: () {
                                      if (activity.tourId != null) {
                                        RouteManagement
                                            .goToActivityDetailsScreen(
                                                activityId: activity.tourId!,
                                                contractId:
                                                    activity.contractId!);
                                      }
                                    },
                                    child: Container(
                                      height: 120,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                grey656.withValues(alpha: 0.25),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 150,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              ),
                                            ),
                                            clipBehavior: Clip
                                                .hardEdge, // Ensures image respects border radius
                                            child: activity.imagePath != null &&
                                                    activity
                                                        .imagePath!.isNotEmpty
                                                ? Image.network(
                                                    activity.imagePath!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Container(
                                                        color: Colors.grey[200],
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Text(
                                                            'Image Unavailable'),
                                                      );
                                                    },
                                                  )
                                                : Container(
                                                    color: Colors.grey[200],
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                        'Image Unavailable'),
                                                  ),
                                          ),
                                          SizedBox(width: 15),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on,
                                                        color: redCA0,
                                                        size: 18),
                                                    SizedBox(width: 7),
                                                    CommonTextWidget
                                                        .PoppinsSemiBold(
                                                      text: activity.cityName,
                                                      color: redCA0,
                                                      fontSize: 10,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width: 130,
                                                    child: CommonTextWidget
                                                        .PoppinsMedium(
                                                            text: activity
                                                                .tourName,
                                                            color: black2E2,
                                                            fontSize: 10,
                                                            maxLines: 2)),
                                                SizedBox(
                                                    width: 130,
                                                    child: CommonTextWidget
                                                        .PoppinsMedium(
                                                            text: activity
                                                                .duration,
                                                            color: blue1F9,
                                                            fontSize: 12,
                                                            maxLines: 2)),
                                                Row(
                                                  children: [
                                                    CommonTextWidget
                                                        .PoppinsMedium(
                                                      text:
                                                          "${currency()} ${activity.price}",
                                                      color: black2E2,
                                                      fontSize: 12,
                                                    ),
                                                    // SizedBox(width: 10),
                                                    // CommonTextWidget.PoppinsRegular(
                                                    //   text: "Per Person",
                                                    //   color: grey717,
                                                    //   fontSize: 10,
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 215),
                      child: Container(
                        height: 88,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: grey757.withValues(alpha: 0.25),
                              blurRadius: 6,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 39, right: 39, top: 193),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              RouteManagement.goToFlightSearchScreen();
                              // Get.to(() => FlightSearchScreen());
                            },
                            child: Column(
                              children: [
                                Image.asset(flight, height: 55, width: 55),
                                SizedBox(height: 8),
                                CommonTextWidget.PoppinsMedium(
                                  text: "Flight",
                                  color: black2E2,
                                  fontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              RouteManagement.goToActivitiesScreen();
                            },
                            child: Column(
                              children: [
                                Image.asset(trainsAndBus,
                                    height: 55, width: 55),
                                SizedBox(height: 8),
                                CommonTextWidget.PoppinsMedium(
                                  text: "Activities",
                                  color: black2E2,
                                  fontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              RouteManagement.goToHotelAndHomeStayScreen();
                            },
                            child: Column(
                              children: [
                                Image.asset(hotel, height: 55, width: 55),
                                SizedBox(height: 8),
                                CommonTextWidget.PoppinsMedium(
                                  text: "Hotel",
                                  color: black2E2,
                                  fontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              RouteManagement.goToHolidayPackagesScreen();
                            },
                            child: Column(
                              children: [
                                Image.asset(holidayPakages,
                                    height: 55, width: 55),
                                SizedBox(height: 8),
                                CommonTextWidget.PoppinsMedium(
                                  text: "Holiday\nPackages",
                                  color: black2E2,
                                  fontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Get.to(() => TrainAndBusScreen());
                          //   },
                          //   child: Column(
                          //     children: [
                          //       Image.asset(trainsAndBus, height: 55, width: 55),
                          //       SizedBox(height: 8),
                          //       CommonTextWidget.PoppinsMedium(
                          //         text: "Trains &\nBus",
                          //         color: black2E2,
                          //         fontSize: 12,
                          //         textAlign: TextAlign.center,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
