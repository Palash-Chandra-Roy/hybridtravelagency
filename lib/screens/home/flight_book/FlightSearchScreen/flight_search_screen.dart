import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/multicity_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/one_way_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/round_trip_screen.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class FlightSearchScreen extends StatelessWidget {
  FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightSearchController>(
        builder: (controller) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 155,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(flightSearchTopImage),
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
                        text: "Flight Search",
                        color: white,
                        fontSize: 18,
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: redF9E,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(offerIcon),
                        SizedBox(width: 10),
                        Expanded(
                          child: CommonTextWidget.PoppinsMedium(
                            text:
                                "Get FLAT 13% OFF* on your first booking! use "
                                "code: WELCOMEMMT",
                            color: redCA0,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    OneWayScreen(),
                    RoundTripScreen(),
                    MulticityScreen(),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 130, left: 24, right: 24),
            child: Container(
              height: 45,
              width: Get.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: grey757.withValues(alpha: 0.25),
                    blurRadius: 6,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                padding: EdgeInsets.only(left: 14, bottom: 7, right: 10),
                tabs: controller.myTabs,
                tabAlignment: TabAlignment.start,
                unselectedLabelColor: grey5F5,
                labelStyle:
                    TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
                unselectedLabelStyle:
                    TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
                labelColor: redCA0,
                controller: controller.tabController,
                indicatorColor: redCA0,
                indicatorWeight: 2.5,
                onTap: (index){
                  controller.onTabTap(index);
                },
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: 335,
            child: InkWell(
              onTap: () {
                // Get.to(() => SortAndFilterScreen());
              },
              child: Container(
                height: 45,
                width: 33,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: greyE2E,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(arrowsDownUp),
                ),
              ),
            ),
          ),
        ],
      ),
    );});
  }
}
