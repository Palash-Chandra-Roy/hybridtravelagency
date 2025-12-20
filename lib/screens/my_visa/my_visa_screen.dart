import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/main.dart';

import 'package:hybridtravelagency/screens/my_visa/my_visa_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';

class MyVisaScreen extends StatelessWidget {
  MyVisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyVisaController>(builder: (controller) {
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
            text: "My Visa",
            color: black2E2,
            fontSize: 18,
          ),
          actions: [
            InkWell(
                onTap: () {
                  controller.getVisaApplications();
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
                      ? const Center(child: Text("No visa applications found."))
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
                                            "Order ID: ${booking.id ?? '-'}",
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
                                              color: _getVisaStatusColor(
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

                                      // ✅ Applicant Name
                                      Text(
                                        "${booking.firstName ?? ''} ${booking.lastName ?? ''}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      // ✅ Visa Type
                                      if (booking.visaTypeName != null &&
                                          booking.visaTypeName!.isNotEmpty)
                                        Text(
                                          "Visa Type: ${booking.visaTypeName}",
                                          style: const TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),

                                      const SizedBox(height: 6),

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

                                      const SizedBox(height: 6),

                                      // ✅ Payment Status
                                      Row(
                                        children: [
                                          const Icon(Icons.payment,
                                              size: 14, color: Colors.grey),
                                          const SizedBox(width: 4),
                                          Text(
                                            "Payment: ${_getPaymentStatusLabel(booking.paymentStatus)}",
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

                                      // ✅ Footer — Country + Amount
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (booking.visaCountry != null)
                                            Text(
                                              "Country: ${booking.visaCountry}",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          if (booking.visaAmount != null)
                                            Text(
                                              "${booking.currency ?? ''} ${booking.visaAmount}",
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

  Color _getVisaStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getPaymentStatusLabel(int? status) {
    switch (status) {
      case 0:
        return "Pending";
      case 1:
        return "Paid";
      case 2:
        return "Completed";
      default:
        return "-";
    }
  }
}
