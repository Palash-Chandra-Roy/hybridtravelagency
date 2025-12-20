import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/main.dart';

import 'package:hybridtravelagency/screens/my_activity/my_activity_controller.dart';
import 'package:hybridtravelagency/screens/my_activity/my_activity_details_screen.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';

class MyActivityScreen extends StatelessWidget {
  MyActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyActivityController>(builder: (controller) {
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
          text: "My Activities",
          color: black2E2,
          fontSize: 18,
        ),
        actions: [
          InkWell(
          onTap: (){
    controller.getUserActivitiesBookings();
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
                ? const Center(child: Text("No activity bookings found."))
                : controller.bookings!=null
                ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: controller.bookings!.length, // List<ActivityData>
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final activity = controller.bookings![index];
                final activityName = activity.tour?.tourName ?? 'Unknown Activity';
                final activityDate = activity.request?.tourDetails?.isNotEmpty == true
                    ? activity.request!.tourDetails!.first.tourDate ?? '-'
                    : '-';
                final bookingStatus =
                    activity.bookingStatus ?? activity.response?.result?.details?.first.status ?? 'Unknown';

                return GestureDetector(
                    onTap: (){
                  Get.to(() => MyActivityDetailsScreen(booking: activity));
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
                      // ✅ Header Row — Order ID + Status Badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order ID: ${activity.orderId ?? '-'}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getActivityStatusColor(bookingStatus),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              bookingStatus.toUpperCase(),
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

                      // ✅ Activity Name
                      Text(
                        activityName,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // ✅ Activity Date
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            "Date: $activityDate",
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // ✅ Created At (optional)
                      if (activity.createdAt != null)
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              "Booked on: ${activity.createdAt?.split('T').first ?? '-'}",
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
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
  Color _getActivityStatusColor(String? status) {
    if (status == null) return Colors.grey;
    switch (status.toLowerCase()) {
      case "confirmed":
      case "booked":
      case "success":
        return Colors.green;
      case "pending":
        return Colors.orange;
      case "cancelled":
      case "failed":
      case "declined":
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}
