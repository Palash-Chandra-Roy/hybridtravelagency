import 'package:flutter/material.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class MyActivityDetailsScreen extends StatelessWidget {
  final ActivityData booking;

  const MyActivityDetailsScreen({super.key, required this.booking});

  // Helper method to extract the main tour details for display
  TourDetails? get _tourDetails {
    return booking.request?.tourDetails?.isNotEmpty == true
        ? booking.request!.tourDetails!.first
        : null;
  }

  // Helper method to extract the first passenger details
  Passengers? get _leadPassenger {
    return _tourDetails?.passengers?.isNotEmpty == true
        ? _tourDetails!.passengers!.first
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final tourDetails = _tourDetails;
    final leadPassenger = _leadPassenger;
    final tour = booking.tour;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            // Use Navigator.pop(context) if not using GetX
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: black2E2, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Activity Details",
          color: black2E2,
          fontSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Activity Details / Tour Details Section Header ---
            // const Text(
            //   "Activity Details",
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //     color: black2E2,
            //   ),
            // ),
            // const SizedBox(height: 16),

            // --- Tour Details Card ---
            _buildCard(
              title: "Tour Details",
              children: [
                _infoRow("Tour Name", tour?.tourName ?? "N/A"),
                _infoRow("Adult", tourDetails?.adult ?? "0"),
                _infoRow("Child", tourDetails?.child ?? "0"),
                _infoRow("Infant", tourDetails?.infant ?? "0"),

                const Divider(height: 16),

                _infoRow("Tour Date", tourDetails?.tourDate ?? "N/A"),
                _infoRow("Start Time", tourDetails?.startTime ?? "N/A"),
                _infoRow("Pickup", tourDetails?.pickup ?? "N/A"),
                _infoRow("Duration", tour?.duration ?? "N/A"), // Data from Tour model

                const Divider(height: 16),

                // Rates and Service Total (Mapping to screenshot fields)
                _infoRow("Adult Rate", "${booking.request?.currency ?? ''} ${tourDetails?.adultRate ?? '0.00'}"),
                _infoRow("Child Rate", "${booking.request?.currency ?? ''} ${tourDetails?.childRate ?? '0.00'}"),
                _infoRow("Service Total", "${booking.request?.currency ?? ''} ${tourDetails?.serviceTotal ?? '0.00'}"),
              ],
            ),

            const SizedBox(height: 16),

            // --- Passenger Information Card ---
            _buildCard(
              title: "Passenger Information",
              children: [
                // Displaying details of the first passenger
                _infoRow("Prefix", leadPassenger?.prefix ?? "N/A"),
                _infoRow("First Name", leadPassenger?.firstName ?? "N/A"),
                _infoRow("Last Name", leadPassenger?.lastName ?? "N/A"),
                _infoRow("Email", leadPassenger?.email ?? "N/A"),
                _infoRow("Mobile", leadPassenger?.mobile ?? "N/A"),
                _infoRow("Passenger Type", leadPassenger?.paxType ?? "N/A"),
                _infoRow("Service Type", leadPassenger?.serviceType ?? "N/A"),

                const Divider(height: 16),

                // Displaying the total number of passengers
                _infoRow(
                  "Total Passengers",
                  "${tourDetails?.passengers?.length ?? 0}",
                ),
              ],
            ),

            const SizedBox(height: 24),

            // --- Close Button (Placeholder as seen in the screenshot) ---
            // Center(
            //   child: OutlinedButton(
            //     onPressed: () => Navigator.pop(context),
            //     child: const Text("Close"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets (Reused/Adapted from previous examples) ---

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
          // Fixed width for the label to align the values nicely
          SizedBox(width: 140, child: Text("$label:")),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}