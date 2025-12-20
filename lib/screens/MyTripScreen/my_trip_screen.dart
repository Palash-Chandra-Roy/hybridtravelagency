import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';

import 'package:hybridtravelagency/screens/MyTripScreen/cancelled_trip_screen.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/upcoming_trip_screen.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class MyTripScreen extends StatelessWidget {
  MyTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTripController>(builder: (myTripController) {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: black2E2, size: 20),
          ),
          title: CommonTextWidget.PoppinsSemiBold(
            text: "My Trips",
            color: black2E2,
            fontSize: 18,
          ),
          actions: [
            InkWell(
              onTap: () {
                // Refresh all bookings
                myTripController.fetchAllBookings();
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 16, right: 24),
                child: SvgPicture.asset(arrowCounterClockwise),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 45,
              width: Get.width,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey363.withValues(alpha: 0.25),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: TabBar(
                isScrollable: true,
                padding: EdgeInsets.only(left: 2, bottom: 7, right: 2),
                tabs: myTripController.myTabs,
                unselectedLabelColor: grey5F5,
                labelStyle:
                    TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
                unselectedLabelStyle:
                    TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
                labelColor: primary,
                controller: myTripController.tabController,
                indicatorColor: primary,
                indicatorWeight: 2.5,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: myTripController.tabController,
                children: [
                  UpComingTripScreen(myTripController: myTripController),
                  CancelledTripScreen(myTripController: myTripController),
                  Scaffold(),
                  Scaffold(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
