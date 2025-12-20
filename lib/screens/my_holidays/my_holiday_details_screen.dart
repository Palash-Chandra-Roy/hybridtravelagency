import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class MyHolidayDetailsScreen extends StatelessWidget {
  final HolidayBookingData booking;

  const MyHolidayDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final holiday = booking.holiday;
    final user = booking.user;

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
          text: "Holiday Details",
          color: black2E2,
          fontSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Package Info ---
            _buildCard(
              title: "Package Information",
              children: [
                _infoRow("Title", holiday?.title ?? "-"),
                _infoRow("Package Price", holiday?.price ?? "-"),
                _infoRow("Package Members", holiday?.packageMembers ?? "-"),
                _infoRow("Days/Nights", holiday?.daysnight ?? "-"),
                _infoRow("Location", holiday?.location ?? "-"),
                const SizedBox(height: 10),
                const Text(
                  "Included at this price",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _IncludedItem("Hotels", included: holiday?.hotels == 1),
                    _IncludedItem("Flight", included: holiday?.flight == 1),
                    _IncludedItem("Activities", included: holiday?.activities == 1),
                    _IncludedItem("Transfer", included: holiday?.transfer == 1),
                    _IncludedItem("Visa", included: holiday?.visa == 1),
                    _IncludedItem("Breakfast", included: holiday?.breakfast == 1),
                    _IncludedItem("Lunch", included: holiday?.lunch == 1),
                    _IncludedItem("Dinner", included: holiday?.dinner == 1),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // --- Booking Details ---
            _buildCard(
              title: "Booking Details",
              children: [
                _infoRow("No. of Persons", "${booking.travelPersons ?? '-'}"),
                _infoRow("Travel Date", booking.travelDate ?? "-"),
                _infoRow("Email", booking.email ?? "-"),
                _infoRow("Mobile No", booking.mobileNumber ?? "-"),
                _infoRow("User Type", user?.role ?? "-"),
                _infoRow("User Account Name", user?.name ?? "-"),
                _infoRow("Booking Status", booking.status ?? "-"),
              ],
            ),

            const SizedBox(height: 16),

            // --- Traveller Details ---
            _buildCard(
              title: "Traveller Details",
              children: [
                _travellerHeader(),
                const Divider(),
                Row(
                  children: [
                    const Expanded(flex: 1, child: Text("1")),
                    Expanded(flex: 3, child: Text(user?.name ?? "-")),
                    Expanded(flex: 2, child: Text(user?.age ?? "-")),
                    Expanded(flex: 2, child: Text(user?.salutation ?? "-")),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // --- Buttons ---
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     OutlinedButton(
            //       onPressed: () => Navigator.pop(context),
            //       child: const Text("Close"),
            //     ),
            //     const SizedBox(width: 20),
            //     ElevatedButton(
            //       onPressed: () {
            //         // TODO: Add update functionality
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: primary,
            //       ),
            //       child: const Text("Update", style: TextStyle(color: Colors.white),),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 160, child: Text("$label:")),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _travellerHeader() {
    return Row(
      children: const [
        Expanded(flex: 1, child: Text("#", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 3, child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 2, child: Text("Age", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 2, child: Text("Gender", style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }
}

class _IncludedItem extends StatelessWidget {
  final String title;
  final bool included;

  const _IncludedItem(this.title, {this.included = false});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title),
      backgroundColor: included ? Colors.green.shade100 : Colors.grey.shade200,
      avatar: Icon(
        included ? Icons.check_box : Icons.close,
        color: included ? Colors.green : Colors.redAccent,
        size: 18,
      ),
    );
  }
}
