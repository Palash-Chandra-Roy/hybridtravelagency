import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';

import 'package:hybridtravelagency/screens/MyAccountScreen/my_account_screen.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_screen.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_controller.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_controller.dart';
import 'package:hybridtravelagency/screens/home/drawer/drawer_screen.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class NavigationScreen extends StatelessWidget {
  dynamic buildMyNavBar(
      BuildContext context, NavigationController navigationController) {
    return SafeArea(
        top: false,
        bottom:
            true, // This adds padding equal to the height of the system navigation bar.
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: greyB9B.withValues(alpha: 0.25),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => Column(
                    children: [
                      InkWell(
                        enableFeedback: false,
                        onTap: () {
                          navigationController.pageIndex.value = 0;
                        },
                        child: SvgPicture.asset(
                          navigationController.pageIndex.value == 0
                              ? homeSelectedIcon
                              : homeUnSelectedIcon,
                        ),
                      ),
                      SizedBox(height: 6),
                      CommonTextWidget.PoppinsMedium(
                        text: "Home",
                        color: navigationController.pageIndex.value == 0
                            ? primary
                            : greyAAA,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      enableFeedback: false,
                      onTap: () {
                        // Fetch latest bookings before navigating
                        final myTripController = Get.find<MyTripController>();
                        myTripController.fetchAllBookings();
                        Get.to(() => MyTripScreen());
                      },
                      child: SvgPicture.asset(suitcaseIcon),
                    ),
                    SizedBox(height: 6),
                    CommonTextWidget.PoppinsMedium(
                      text: "My Trips",
                      color: greyAAA,
                      fontSize: 12,
                    ),
                  ],
                ),
                Obx(
                  () => Column(
                    children: [
                      InkWell(
                        enableFeedback: false,
                        onTap: () {
                          navigationController.pageIndex.value = 2;
                        },
                        child: SvgPicture.asset(
                          navigationController.pageIndex.value == 2
                              ? selectedRightArrow
                              : unSelectedRightArrow,
                        ),
                      ),
                      SizedBox(height: 6),
                      CommonTextWidget.PoppinsMedium(
                        text: "Where2Go",
                        color: navigationController.pageIndex.value == 2
                            ? primary
                            : greyAAA,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      enableFeedback: false,
                      onTap: () {
                        Get.to(() => MyAccountScreen());
                      },
                      child: SvgPicture.asset(userIcon),
                    ),
                    SizedBox(height: 6),
                    CommonTextWidget.PoppinsMedium(
                      text: "MY Account",
                      color: greyAAA,
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (navigationController) {
      final GlobalKey<ScaffoldState> key = GlobalKey();
      return Scaffold(
          key: key,
          backgroundColor: white,
          drawer: Drawer(
            backgroundColor: white,
            child: DrawerScreen(),
          ),
          body: Stack(
            children: [
              Obx(
                () => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    navigationController
                        .pages[navigationController.pageIndex.value],
                    buildMyNavBar(context, navigationController),
                  ],
                ),
              ),
              Obx(() {
                return navigationController.pageIndex.value == 0
                    ? Positioned(
                        top: 65,
                        left: 24,
                        child: InkWell(
                          onTap: () {
                            key.currentState!.openDrawer();
                          },
                          child: Image.asset(menuIcon, height: 42, width: 42),
                        ),
                      )
                    : SizedBox();
              }),
            ],
          ));
    });
  }
}
