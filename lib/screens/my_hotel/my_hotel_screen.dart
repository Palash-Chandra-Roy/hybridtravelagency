import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/main.dart';

import 'package:hybridtravelagency/screens/my_hotel/my_hotel_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';

class MyHotelScreen extends StatelessWidget {
  MyHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHotelController>(builder: (controller) {
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
            text: "My Hotels",
            color: black2E2,
            fontSize: 18,
          ),
          actions: [
            InkWell(
                onTap: () {
                  controller.getHotelsBookings();
                },
                child: Padding(
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
              child: controller.isLoading
                  ? bookingShimmer()
                  : controller.bookings != null && controller.bookings!.isEmpty
                      ? const Center(child: Text("No hotel bookings found."))
                      : controller.bookings != null
                          ? ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              itemCount: controller
                                  .bookings!.length, // List<HotelBookingData>
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final booking = controller.bookings![index];

                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.08),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ✅ Header Row — Order ID + Status Badge
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Order ID: ${booking.bookingId ?? '-'}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: _getHotelStatusColor(
                                                  booking.status),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              booking.status?.toUpperCase() ??
                                                  'UNKNOWN',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),

                                      // ✅ Hotel Name
                                      Text(
                                        booking.hotelName ?? 'Unknown Hotel',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      if (booking.roomTypeName != null &&
                                          booking.roomTypeName!.isNotEmpty)
                                        Text(
                                          booking.roomTypeName!,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),

                                      const SizedBox(height: 6),

                                      // ✅ Stay Details
                                      Row(
                                        children: [
                                          const Icon(Icons.night_shelter,
                                              size: 14, color: Colors.grey),
                                          const SizedBox(width: 4),
                                          Text(
                                            "Stay: ${booking.checkin ?? '-'} → ${booking.checkout ?? '-'}",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // ✅ Booked On
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_today,
                                              size: 14, color: Colors.grey),
                                          const SizedBox(width: 4),
                                          Text(
                                            "Booked on: ${booking.createdAt?.split('T').first ?? '-'}",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 10),
                                      const Divider(
                                          height: 1, color: Color(0xFFEAEAEA)),
                                      const SizedBox(height: 10),

                                      // ✅ Footer — Holder Name + Price
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Guest: ${booking.holderFirstName ?? ''} ${booking.holderLastName ?? ''}",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                          if (booking.price != null)
                                            Text(
                                              "${booking.rateCurrency ?? booking.currency ?? ''} ${booking.price}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : SizedBox.shrink(),
            )
          ],
        ),
      );
    });
  }

  Color _getHotelStatusColor(String? status) {
    if (status == null) return Colors.grey;
    switch (status.toLowerCase()) {
      case "confirmed":
      case "booked":
        return Colors.green;
      case "pending":
        return Colors.orange;
      case "cancelled":
      case "failed":
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}
