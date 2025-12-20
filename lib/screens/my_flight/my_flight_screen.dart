import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/main.dart';
import 'package:hybridtravelagency/navigators/navigators.dart';

import 'package:hybridtravelagency/screens/my_flight/my_flight_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';

class MyFlightScreen extends StatelessWidget {
  MyFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFlightController>(builder: (controller) {
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
          text: "My Flights",
          color: black2E2,
          fontSize: 18,
        ),
        actions: [
          InkWell(
          onTap: (){
    controller.getUserFlightsBooking();
    },
      child:Padding(
            padding: EdgeInsets.only(bottom: 16, right: 24),
            child: SvgPicture.asset(arrowCounterClockwise),
          )),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          ScrollConfiguration(
            behavior: MyBehavior(),
            child:
            controller.isLoading
                ? bookingShimmer()
                : controller.bookings!=null && controller.bookings!.isEmpty
                ? const Center(child: Text("No flight bookings found."))
                : controller.bookings!=null
                ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: controller.bookings!.length, // List<FlightBookingData>
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final booking = controller.bookings![index];

                return GestureDetector(
                    onTap: (){
                      RouteManagement.goToMyFlightDetailsScreen(bookingId: booking.id!);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ Header Row — Trip ID + Status Badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trip ID: ${booking.tripeId ?? '-'}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),

                        ],
                      ),

                      const SizedBox(height: 8),

                      // ✅ Trip route
                      Text(
                        "${booking.origin ?? '-'} → ${booking.destination ?? '-'}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // ✅ Departure date
                      Row(
                        children: [
                          const Icon(Icons.flight_takeoff, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            "Departure: ${booking.destinationDate ?? '-'}",
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),

                      // ✅ Booked on date
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            "Booked on: ${booking.createdAt?.split('T').first ?? '-'}",
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ✅ Booked by
                          Text(
                            "Booked by: ${booking.user?.name ?? 'N/A'}",
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(booking.status),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _getStatusText(booking.status),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),


                      const SizedBox(height: 10),
                      const Divider(height: 1, color: Color(0xFFEAEAEA)),
                      const SizedBox(height: 10),

                      // ✅ Footer — Payment status + Transaction ID
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getPaymentColor(booking.paymentStatus),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              _getPaymentStatusText(booking.paymentStatus),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Txn: ${booking.transactionNo ?? '-'}",
                              style: const TextStyle(fontSize: 11, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
              },
            )
              :SizedBox.shrink(),
          )
        ],
      ),
    );});
  }

  Color _getStatusColor(int? status) {
    switch (status) {
      case 1:
        return Colors.green;
      case 0:
        return Colors.orange;
      case -1:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(int? status) {
    switch (status) {
      case 1:
        return "CONFIRMED";
      case 0:
        return "PENDING";
      case -1:
        return "CANCELLED";
      default:
        return "UNKNOWN";
    }
  }

  Color _getPaymentColor(int? status) {
    switch (status) {
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getPaymentStatusText(int? status) {
    switch (status) {
      case 1:
        return "Unpaid";
      case 2:
        return "Paid";
      case 3:
        return "Failed";
      default:
        return "Unknown";
    }
  }
}
