import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';
import 'package:intl/intl.dart';

class UpComingTripScreen extends StatelessWidget {
  final MyTripController myTripController;
  UpComingTripScreen({super.key, required this.myTripController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTripController>(builder: (controller) {
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
              tabs: controller.bookingTabs,
              unselectedLabelColor: grey5F5,
              labelStyle:
                  TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
              unselectedLabelStyle:
                  TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
              labelColor: primary,
              controller: controller.bookingController,
              indicatorColor: primary,
              indicatorWeight: 2.5,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.bookingController,
              children: [
                upcomingFlightBookings(controller),
                upcomingActivityBookings(controller),
                upcomingHotelBookings(controller),
                upcomingHolidayBookings(controller)
              ],
            ),
          ),
        ],
      );
    });
  }

  // Flight Bookings Tab
  Widget upcomingFlightBookings(MyTripController controller) {
    if (controller.isFlightBookingsLoading) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: bookingShimmer(),
          ),
        ),
      );
    }

    if (controller.flightBookings == null ||
        controller.flightBookings!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight_takeoff, size: 64, color: grey5F5),
            SizedBox(height: 16),
            CommonTextWidget.PoppinsMedium(
              text: "No Flight Bookings Found",
              color: grey5F5,
              fontSize: 16,
            ),
          ],
        ),
      );
    }

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 24, right: 24),
        itemCount: controller.flightBookings!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var booking = controller.flightBookings![index];
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey656.withValues(alpha: 0.25),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonTextWidget.PoppinsSemiBold(
                          text:
                              "${booking.origin ?? ''} → ${booking.destination ?? ''}",
                          color: black2E2,
                          fontSize: 16,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: booking.status == 1
                                ? Colors.green.shade50
                                : Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: CommonTextWidget.PoppinsRegular(
                            text: booking.status == 1 ? "Confirmed" : "Pending",
                            color: booking.status == 1
                                ? Colors.green
                                : Colors.orange,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    if (booking.airlinePnr != null &&
                        booking.airlinePnr!.isNotEmpty)
                      CommonTextWidget.PoppinsRegular(
                        text: "PNR: ${booking.airlinePnr}",
                        color: grey717,
                        fontSize: 12,
                      ),
                    SizedBox(height: 4),
                    CommonTextWidget.PoppinsRegular(
                      text:
                          "${booking.tripType ?? 'One Way'} • ${booking.classType ?? 'Economy'}",
                      color: grey717,
                      fontSize: 12,
                    ),
                    SizedBox(height: 4),
                    CommonTextWidget.PoppinsRegular(
                      text:
                          "Departure: ${_formatDate(booking.destinationDate)}",
                      color: grey717,
                      fontSize: 12,
                    ),
                    if (booking.arrivalDate != null &&
                        booking.arrivalDate!.isNotEmpty)
                      CommonTextWidget.PoppinsRegular(
                        text: "Return: ${_formatDate(booking.arrivalDate)}",
                        color: grey717,
                        fontSize: 12,
                      ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.person, size: 14, color: grey717),
                        SizedBox(width: 4),
                        CommonTextWidget.PoppinsRegular(
                          text:
                              "${booking.noOfAdults ?? 0} Adults, ${booking.noOfChilds ?? 0} Children",
                          color: grey717,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Activity Bookings Tab
  Widget upcomingActivityBookings(MyTripController controller) {
    if (controller.isActivityBookingsLoading) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: bookingShimmer(),
          ),
        ),
      );
    }

    if (controller.activityBookings == null ||
        controller.activityBookings!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_activity, size: 64, color: grey5F5),
            SizedBox(height: 16),
            CommonTextWidget.PoppinsMedium(
              text: "No Activity Bookings Found",
              color: grey5F5,
              fontSize: 16,
            ),
          ],
        ),
      );
    }

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 24, right: 24),
        itemCount: controller.activityBookings!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var booking = controller.activityBookings![index];
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Container(
              height: 120,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey656.withValues(alpha: 0.25),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: booking.tour?.imagePath != null &&
                            booking.tour!.imagePath!.isNotEmpty
                        ? Image.network(
                            booking.tour!.imagePath!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: Icon(Icons.local_activity,
                                    color: grey717, size: 40),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey[200],
                            child: Icon(Icons.local_activity,
                                color: grey717, size: 40),
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text: booking.tour?.tourName ?? "Activity",
                                color: black2E2,
                                fontSize: 13,
                                maxLines: 2,
                              ),
                              SizedBox(height: 4),
                              if (booking.tour?.cityName != null)
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: redCA0, size: 14),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: CommonTextWidget.PoppinsRegular(
                                        text: booking.tour!.cityName!,
                                        color: grey717,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: booking.bookingStatus == "Confirmed"
                                      ? Colors.green.shade50
                                      : Colors.orange.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: CommonTextWidget.PoppinsRegular(
                                  text: booking.bookingStatus ?? "Pending",
                                  color: booking.bookingStatus == "Confirmed"
                                      ? Colors.green
                                      : Colors.orange,
                                  fontSize: 10,
                                ),
                              ),
                              if (booking.createdAt != null)
                                CommonTextWidget.PoppinsRegular(
                                  text: _formatDate(booking.createdAt),
                                  color: grey717,
                                  fontSize: 10,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Hotel Bookings Tab
  Widget upcomingHotelBookings(MyTripController controller) {
    if (controller.isHotelBookingsLoading) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: bookingShimmer(),
          ),
        ),
      );
    }

    if (controller.hotelBookings == null || controller.hotelBookings!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hotel, size: 64, color: grey5F5),
            SizedBox(height: 16),
            CommonTextWidget.PoppinsMedium(
              text: "No Hotel Bookings Found",
              color: grey5F5,
              fontSize: 16,
            ),
          ],
        ),
      );
    }

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 24, right: 24),
        itemCount: controller.hotelBookings!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var booking = controller.hotelBookings![index];
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey656.withValues(alpha: 0.25),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CommonTextWidget.PoppinsSemiBold(
                            text: booking.hotelName ?? "Hotel",
                            color: black2E2,
                            fontSize: 15,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: booking.status == "confirmed"
                                ? Colors.green.shade50
                                : Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: CommonTextWidget.PoppinsRegular(
                            text: booking.status ?? "Pending",
                            color: booking.status == "confirmed"
                                ? Colors.green
                                : Colors.orange,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    if (booking.roomTypeName != null &&
                        booking.roomTypeName!.isNotEmpty)
                      CommonTextWidget.PoppinsRegular(
                        text: booking.roomTypeName!,
                        color: grey717,
                        fontSize: 12,
                      ),
                    SizedBox(height: 4),
                    CommonTextWidget.PoppinsRegular(
                      text: "Check-in: ${_formatDate(booking.checkin)}",
                      color: grey717,
                      fontSize: 12,
                    ),
                    CommonTextWidget.PoppinsRegular(
                      text: "Check-out: ${_formatDate(booking.checkout)}",
                      color: grey717,
                      fontSize: 12,
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.person, size: 14, color: grey717),
                        SizedBox(width: 4),
                        CommonTextWidget.PoppinsRegular(
                          text:
                              "${booking.adults ?? 0} Adults, ${booking.children ?? 0} Children",
                          color: grey717,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    if (booking.hotelConfirmationCode != null &&
                        booking.hotelConfirmationCode!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: CommonTextWidget.PoppinsRegular(
                          text:
                              "Confirmation: ${booking.hotelConfirmationCode}",
                          color: grey717,
                          fontSize: 11,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Holiday Bookings Tab
  Widget upcomingHolidayBookings(MyTripController controller) {
    if (controller.isHolidayBookingsLoading) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: bookingShimmer(),
          ),
        ),
      );
    }

    if (controller.holidayBookings == null ||
        controller.holidayBookings!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.card_travel, size: 64, color: grey5F5),
            SizedBox(height: 16),
            CommonTextWidget.PoppinsMedium(
              text: "No Holiday Bookings Found",
              color: grey5F5,
              fontSize: 16,
            ),
          ],
        ),
      );
    }

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 24, right: 24),
        itemCount: controller.holidayBookings!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var booking = controller.holidayBookings![index];
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Container(
              height: 120,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey656.withValues(alpha: 0.25),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: booking.holiday?.packageImage != null &&
                            booking.holiday!.packageImage!.isNotEmpty
                        ? Image.network(
                            booking.holiday!.packageImage!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: Icon(Icons.card_travel,
                                    color: grey717, size: 40),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey[200],
                            child: Icon(Icons.card_travel,
                                color: grey717, size: 40),
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text:
                                    booking.holiday?.title ?? "Holiday Package",
                                color: black2E2,
                                fontSize: 13,
                                maxLines: 2,
                              ),
                              SizedBox(height: 4),
                              if (booking.holiday?.location != null)
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: redCA0, size: 14),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: CommonTextWidget.PoppinsRegular(
                                        text: booking.holiday!.location!,
                                        color: grey717,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (booking.holiday?.daysnight != null)
                                    CommonTextWidget.PoppinsRegular(
                                      text: booking.holiday!.daysnight!,
                                      color: blue1F9,
                                      fontSize: 11,
                                    ),
                                  if (booking.travelDate != null)
                                    CommonTextWidget.PoppinsRegular(
                                      text: _formatDate(booking.travelDate),
                                      color: grey717,
                                      fontSize: 10,
                                    ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: booking.status == "confirmed"
                                      ? Colors.green.shade50
                                      : Colors.orange.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: CommonTextWidget.PoppinsRegular(
                                  text: booking.status ?? "Pending",
                                  color: booking.status == "confirmed"
                                      ? Colors.green
                                      : Colors.orange,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper method to format dates
  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';

    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
