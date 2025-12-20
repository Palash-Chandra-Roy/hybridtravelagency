import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_controller.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class CancelledTripScreen extends StatelessWidget {
  final MyTripController myTripController;
  CancelledTripScreen({super.key, required this.myTripController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

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
            isScrollable: false,
            padding: EdgeInsets.only(left: 2, bottom: 7, right: 2),
            tabs: myTripController.cancelTabs,
            unselectedLabelColor: grey5F5,
            labelStyle:
            TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
            unselectedLabelStyle:
            TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
            labelColor: primary,
            controller: myTripController.cancelController,
            indicatorColor: primary,
            indicatorWeight: 2.5,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: myTripController.cancelController,
            children: [
              cancelledFlightBookings(),
              cancelledActivityBookings(),
              cancelledHotelBookings(),
              cancelledHolidayBookings()
            ],
          ),
        ),
      ],
    );
  }

  Widget cancelledFlightBookings(){
    return Column(
      children: [

        SizedBox(height: 40),
        SvgPicture.asset(cancelledTripImage),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 42),
          child: CommonTextWidget.PoppinsSemiBold(
            text: "All updates regarding your "
                "cancellation requests are displayed "
                "here!",
            color: black2E2,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: CommonButtonWidget.button(
            onTap: () {},
            buttonColor: primary,
            text: "Start Booking Now",
          ),
        ),
      ],
    );
  }

  Widget cancelledActivityBookings(){
    return Column(
      children: [

        SizedBox(height: 40),
        SvgPicture.asset(cancelledTripImage),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 42),
          child: CommonTextWidget.PoppinsSemiBold(
            text: "All updates regarding your "
                "cancellation requests are displayed "
                "here!",
            color: black2E2,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: CommonButtonWidget.button(
            onTap: () {},
            buttonColor: primary,
            text: "Start Booking Now",
          ),
        ),
      ],
    );
  }

  Widget cancelledHotelBookings(){
    return Column(
      children: [

        SizedBox(height: 40),
        SvgPicture.asset(cancelledTripImage),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 42),
          child: CommonTextWidget.PoppinsSemiBold(
            text: "All updates regarding your "
                "cancellation requests are displayed "
                "here!",
            color: black2E2,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: CommonButtonWidget.button(
            onTap: () {},
            buttonColor: primary,
            text: "Start Booking Now",
          ),
        ),
      ],
    );
  }

  Widget cancelledHolidayBookings(){
    return Column(
      children: [

        SizedBox(height: 40),
        SvgPicture.asset(cancelledTripImage),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 42),
          child: CommonTextWidget.PoppinsSemiBold(
            text: "All updates regarding your "
                "cancellation requests are displayed "
                "here!",
            color: black2E2,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: CommonButtonWidget.button(
            onTap: () {},
            buttonColor: primary,
            text: "Start Booking Now",
          ),
        ),
      ],
    );
  }
}
