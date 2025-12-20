import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/get_flight_booking_details_response.dart';
import 'package:hybridtravelagency/screens/my_flight_details/my_flight_details_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:intl/intl.dart';

class MyFlightDetailsScreen extends StatelessWidget {
  const MyFlightDetailsScreen({super.key});

  // Helper to format date strings like "2025-10-20T14:42:00+08:00" to "Mon 20 Oct 2025"
  String _formatDate(String? dateTimeString) {
    if (dateTimeString == null) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateTimeString).toLocal();
      return DateFormat('EEE d MMM yyyy').format(dateTime);
    } catch (e) {
      return 'N/A';
    }
  }

  // Helper to format time strings like "2025-10-20T14:42:00+08:00" to "14:42"
  String _formatTime(String? dateTimeString) {
    if (dateTimeString == null) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateTimeString).toLocal();
      return DateFormat('HH:mm').format(dateTime);
    } catch (e) {
      return 'N/A';
    }
  }

  // Helper to convert duration string (e.g., "PT1H22M") to human-readable format
  String _formatDuration(String? duration) {
    if (duration == null) return 'N/A';
    try {
      final regex = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?');
      final match = regex.firstMatch(duration);
      if (match != null) {
        final hours = match.group(1) ?? '0';
        final minutes = match.group(2) ?? '0';
        // Handle singular/plural
        final hourString = int.parse(hours) > 0
            ? '${int.parse(hours)} Hour${int.parse(hours) != 1 ? 's' : ''}'
            : '';
        final minuteString = int.parse(minutes) > 0
            ? '${int.parse(minutes)} Minute${int.parse(minutes) != 1 ? 's' : ''}'
            : '';

        if (hourString.isEmpty && minuteString.isEmpty) {
          return 'Less than a minute';
        }
        if (hourString.isNotEmpty && minuteString.isNotEmpty) {
          return '$hourString $minuteString';
        }
        return hourString + minuteString;
      }
      return 'N/A';
    } catch (e) {
      return 'N/A';
    }
  }

  // Common AppBar structure
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back, color: black2E2, size: 20),
      ),
      title: CommonTextWidget.PoppinsSemiBold(
        text: "Flight Details",
        color: black2E2,
        fontSize: 18,
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            // Action for Print Itinerary
          },
          icon: Icon(Icons.print, size: 18, color: primary),
          label: const Text("Print Itinerary",
              style: TextStyle(fontSize: 14, color: primary)),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFlightDetailsController>(builder: (controller) {
      // --- START: Loading and Error Handling ---
      if (controller.isLoading) {
        return Scaffold(
          backgroundColor: white,
          appBar: _buildAppBar(context), // Show app bar even when loading
          body: const Center(
            child: CircularProgressIndicator(
              color: primary,
            ),
          ),
        );
      }

      // Check if data is unavailable after loading completes
      if (controller.booking == null ||
          controller.booking!.data == null ||
          controller.booking!.data!.data == null) {
        return Scaffold(
          backgroundColor: white,
          appBar: _buildAppBar(context),
          body: Center(
            child: CommonTextWidget.PoppinsSemiBold(
              text: "No flight details available.",
              color: black2E2,
              fontSize: 16,
            ),
          ),
        );
      }
      // --- END: Loading and Error Handling ---

      // Fallback data extraction
      final segment = controller.firstSegment;
      final slice = controller.firstSlice;
      final passenger = controller.firstPassenger;
      final user = controller.booking!.user;

      // Billing
      final totalAmount = controller.booking!.data?.data?.totalAmount ?? '0.00';
      final totalCurrency =
          controller.booking!.data?.data?.totalCurrency ?? 'USD';

      return Scaffold(
        backgroundColor: white,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          // Use a Row or padding to simulate the margin from the left sidebar for desktop view
          padding: const EdgeInsets.only(top: 16, right: 12, left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Booking Reference & Confirmed Badge ---
              _buildHeader(
                bookingReference:
                    "Booking Reference: ${controller.booking!.data?.data?.bookingReference ?? 'N/A'}",
                orderId:
                    "Order ID: ${controller.booking!.flight?.tripeId ?? 'N/A'}",
              ),

              const SizedBox(height: 24),

              // --- Flight Summary Card (Combination of Flight Details and Itinerary) ---
              // Outbound Flight
              const Text("Outbound Flight",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primary)),
              const SizedBox(height: 12),
              _buildFlightSummaryCard(
                segment: segment,
                slice: slice,
                airlineName: segment?.marketingCarrier?.name ?? 'N/A',
                airlineLogoUrl: segment?.marketingCarrier?.logoSymbolUrl,
                flightNumber: segment?.marketingCarrierFlightNumber ?? 'N/A',
                cabinClass: passenger?.cabinClassMarketingName ?? 'Economy',
                baggage: passenger?.baggages?.isNotEmpty == true
                    ? passenger!.baggages!.first.quantity ?? 1
                    : 0,
                seat: passenger?.seat?.designator ?? 'N/A',
              ),

              // Return Flight (if round trip)
              if (controller.isRoundTrip && controller.secondSlice != null) ...[
                const SizedBox(height: 32),
                const Text("Return Flight",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primary)),
                const SizedBox(height: 12),
                _buildFlightSummaryCard(
                  segment: controller.secondSegment,
                  slice: controller.secondSlice,
                  airlineName:
                      controller.secondSegment?.marketingCarrier?.name ?? 'N/A',
                  airlineLogoUrl:
                      controller.secondSegment?.marketingCarrier?.logoSymbolUrl,
                  flightNumber:
                      controller.secondSegment?.marketingCarrierFlightNumber ??
                          'N/A',
                  cabinClass: passenger?.cabinClassMarketingName ?? 'Economy',
                  baggage: passenger?.baggages?.isNotEmpty == true
                      ? passenger!.baggages!.first.quantity ?? 1
                      : 0,
                  seat: passenger?.seat?.designator ?? 'N/A',
                ),
              ],

              const SizedBox(height: 32),

              // --- Passengers ---
              const Text("Passengers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(color: black2E2, height: 16, thickness: 1),
              _buildPassengerSection(
                name:
                    "${user?.salutation ?? ''} ${user?.name ?? 'Mr App User'}",
                // Use the user's age field as a placeholder for DOB, format it safely
                dob: _formatDate(user?.age) == 'N/A'
                    ? '1993-10-12'
                    : _formatDate(user!.age),
                gender: user?.salutation ??
                    'M', // Using salutation as Gender placeholder
                email: user?.email ?? 'Test@test.com',
                phone: user?.mobile ?? '+14383984536',
              ),

              const SizedBox(height: 32),

              // --- Billing Summary ---
              const Text("Billing Summary",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(color: black2E2, height: 16, thickness: 1),
              _buildBillingSummary(
                totalAmount: totalAmount,
                currency: totalCurrency,
              ),

              const SizedBox(height: 24),
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: redCA0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // New helper for the main screen header (Booking Ref, Order ID, Confirmed)
  Widget _buildHeader(
      {required String bookingReference, required String orderId}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Booking Reference
        Text(bookingReference,
            style: const TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(orderId,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                // Confirmed Badge style matching the screenshot
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text("Confirmed",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w500)),
            )),
      ],
    );
  }

  // Card combining all flight/itinerary details
  Widget _buildFlightSummaryCard({
    required Segments? segment,
    required Slices? slice,
    required String airlineName,
    required String? airlineLogoUrl,
    required String flightNumber,
    required String cabinClass,
    required int baggage,
    required String seat,
  }) {
    if (segment == null || slice == null) {
      return const Center(child: Text("Flight segment data unavailable."));
    }

    final departureTime = _formatTime(segment.departingAt);
    final departureDate = _formatDate(segment.departingAt);
    final departureCode = segment.origin?.iataCode ?? 'N/A';
    final departureTerminal = segment.originTerminal ?? 'N/A';
    final departureName = segment.origin?.name ?? '';

    final arrivalTime = _formatTime(segment.arrivingAt);
    final arrivalDate = _formatDate(segment.arrivingAt);
    final arrivalCode = segment.destination?.iataCode ?? 'N/A';
    final arrivalTerminal = segment.destinationTerminal ?? 'N/A';
    final arrivalName = segment.destination?.name ?? 'N/A';

    final duration = _formatDuration(slice.duration);
    final flightDisplay =
        '${segment.marketingCarrier?.iataCode ?? ''} $flightNumber'.trim();

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Departure block
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(departureCode,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      departureTerminal.isNotEmpty
                          ? 'Terminal: $departureTerminal'
                          : '',
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(departureTime,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(departureDate, style: const TextStyle(fontSize: 12)),
                  Text(departureName,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),

            // Middle detail (Duration and icon)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(duration,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Icon(Icons.flight,
                          size: 28, color: black2E2.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ),

            // Arrival block
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(arrivalCode,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      arrivalTerminal.isNotEmpty
                          ? 'Terminal: $arrivalTerminal'
                          : '',
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(arrivalTime,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(arrivalDate, style: const TextStyle(fontSize: 12)),
                  Text(arrivalName,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.right),
                ],
              ),
            ),
          ],
        ),

        const Divider(height: 30, thickness: 1.5, color: Colors.grey),

        // Flight Info Row
        Row(
          children: [
            // Airline Logo & Name
            if (airlineLogoUrl != null)
              SvgPicture.network(
                airlineLogoUrl,
                height: 30,
                width: 30,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.airplanemode_active, size: 30),
              )
            else
              const Icon(Icons.airplanemode_active, size: 30),

            const SizedBox(width: 8),

            Text(airlineName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 16),

            // Details: Cabin, Flight No.
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _detailChip(cabinClass, Icons.chair),
            _detailChip(flightDisplay, Icons.confirmation_number),
          ],
        ),
        Row(
          children: [
            // Baggage and Seat
            _detailChip('$baggage Checked Bag', Icons.work),
            _detailChip('Seat: $seat', Icons.event_seat),
          ],
        )
      ],
    );
  }

  // A small chip-like widget for flight details
  Widget _detailChip(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.blueGrey.shade400),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Passenger Details Section
  Widget _buildPassengerSection({
    required String name,
    required String dob,
    required String gender,
    required String email,
    required String phone,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Adult Title
        Row(
          children: [
            const Icon(Icons.person, size: 20, color: Colors.black87),
            const SizedBox(width: 8),
            Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 12),

        // Passenger Details Grid (3-column structure in screenshot)
        LayoutBuilder(
          builder: (context, constraints) {
            // Determine a flexible column width for responsiveness
            final numColumns =
                (constraints.maxWidth / 250).floor(); // Max 3 columns
            final columnWidth =
                (constraints.maxWidth - (numColumns - 1) * 24) / numColumns;

            return Wrap(
              spacing: 24.0, // horizontal spacing
              runSpacing: 16.0, // vertical spacing
              children: [
                _passengerDetailColumn(
                    label: "Date of Birth", value: dob, width: columnWidth),
                _passengerDetailColumn(
                    label: "Gender", value: gender, width: columnWidth),
                _passengerDetailColumn(
                    label: "Email", value: email, width: columnWidth),
                _passengerDetailColumn(
                    label: "Phone Number", value: phone, width: columnWidth),
              ],
            );
          },
        ),
      ],
    );
  }

  // Individual column helper for passenger details
  Widget _passengerDetailColumn(
      {required String label, required String value, required double width}) {
    return SizedBox(
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label :",
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(width: 2),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // Billing Summary Section
  Widget _buildBillingSummary(
      {required String totalAmount, required String currency}) {
    final format = NumberFormat.currency(
      symbol: currency == 'USD'
          ? '\$'
          : (currency.isEmpty ? '' : currency), // Simple symbol logic
      decimalDigits: 2,
    );
    final formattedAmount = format.format(double.tryParse(totalAmount) ?? 0.00);

    return _billingSummaryRow(
      label: "Total ($currency)",
      value: formattedAmount,
    );
  }

  // Helper for the billing summary row
  Widget _billingSummaryRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 16, color: Colors.black87)),
          const SizedBox(width: 16),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: black2E2)),
        ],
      ),
    );
  }
}
