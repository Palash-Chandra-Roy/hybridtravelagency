import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/main.dart';

import 'package:hybridtravelagency/screens/my_holidays/my_holiday_details_screen.dart';
import 'package:hybridtravelagency/screens/my_holidays/my_holidays_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';

class MyHolidaysScreen extends StatelessWidget {
  MyHolidaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyHolidaysController>(builder: (controller) {
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
            text: "My Holidays",
            color: black2E2,
            fontSize: 18,
          ),
          actions: [
            InkWell(
                onTap: () {
                  controller.getUserHolidaysBooking();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16, right: 24),
                  child: SvgPicture.asset(arrowCounterClockwise),
                )),
          ],
        ),
        body: Column(
          children: [
            ScrollConfiguration(
                behavior: MyBehavior(),
                child: controller.isLoading
                    ? bookingShimmer()
                    : controller.bookings != null &&
                            controller.bookings!.isEmpty
                        ? const Center(
                            child: Text("No holiday bookings found."))
                        : controller.bookings != null
                            ? ListView.builder(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 24, right: 24),
                                itemCount: controller.bookings!
                                    .length, // your list of HolidayBookingData
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final booking = controller.bookings![index];
                                  final holiday = booking.holiday;

                                  return GestureDetector(
                                      onTap: () {
                                        Get.to(() => MyHolidayDetailsScreen(
                                            booking: booking));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withValues(alpha: 0.25),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // ✅ Image Section (only if image available)
                                              // if (holiday?.packageImage != null && holiday!.packageImage!.isNotEmpty)
                                              //   Container(
                                              //     height: 120,
                                              //     width: 120,
                                              //     decoration: BoxDecoration(
                                              //       borderRadius: const BorderRadius.only(
                                              //         topLeft: Radius.circular(8),
                                              //         bottomLeft: Radius.circular(8),
                                              //       ),
                                              //       image: DecorationImage(
                                              //         image: NetworkImage('${DataConstants.baseUrl}/${holiday.packageImage!}'),
                                              //         fit: BoxFit.cover,
                                              //       ),
                                              //     ),
                                              //   )
                                              // else
                                              //   Container(
                                              //     height: 120,
                                              //     width: 120,
                                              //     decoration: const BoxDecoration(
                                              //       borderRadius: BorderRadius.only(
                                              //         topLeft: Radius.circular(8),
                                              //         bottomLeft: Radius.circular(8),
                                              //       ),
                                              //       color: Colors.grey,
                                              //     ),
                                              //     alignment: Alignment.center,
                                              //     child: const Icon(Icons.image_not_supported, color: Colors.white),
                                              //   ),

                                              // ✅ Details Section
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Holiday Title
                                                      Text(
                                                        holiday?.title ??
                                                            'Unknown Package',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 6),

                                                      // Booking ID
                                                      Text(
                                                        "Booking ID: #${booking.id ?? '-'}",
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                      ),

                                                      // Number of Persons
                                                      Text(
                                                        "Persons: ${booking.travelPersons ?? '-'}",
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                      ),

                                                      // Travel Date
                                                      Text(
                                                        "Travel Date: ${booking.travelDate ?? '-'}",
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                      ),

                                                      // Booked On
                                                      Text(
                                                        "Booked On: ${booking.createdAt != null ? booking.createdAt!.split('T').first : '-'}",
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                      ),

                                                      const SizedBox(height: 6),

                                                      // Status Badge
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8,
                                                                vertical: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              _getStatusColor(
                                                                  booking
                                                                      .status),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                        ),
                                                        child: Text(
                                                          booking.status
                                                                  ?.toUpperCase() ??
                                                              'UNKNOWN',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              )
                            : SizedBox.shrink())
          ],
        ),
      );
    });
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
      case 'booked':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
