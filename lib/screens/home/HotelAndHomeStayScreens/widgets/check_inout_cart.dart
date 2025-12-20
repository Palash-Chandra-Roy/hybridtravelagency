import 'package:flutter/material.dart';
import 'package:hybridtravelagency/utils/utils.dart';

class CheckInOutCard extends StatelessWidget {
  final DateTime selectedDay;
  final String from;

  const CheckInOutCard({
    super.key,
    required this.selectedDay,
    required this.from,
  });

  @override
  Widget build(BuildContext context) {
    // Formatters for your date pattern

    // Dynamic dates
    final checkIn = selectedDay;
    final checkOut = selectedDay.add(const Duration(days: 1));
    final nights = checkOut.difference(checkIn).inDays;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Row for both cards
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Check-In Card ---
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEAEA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      from,
                      style: TextStyle(
                        color: Color(0xFFE53935),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          dateFormatter.format(checkIn),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${dayFormatter.format(checkIn)}, ${yearFormatter.format(checkIn)}",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // const SizedBox(width: 30),

              // --- Check-Out Card ---
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.4,
              //   padding: const EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //     color: Colors.black38,
              //     borderRadius: BorderRadius.circular(8),
              //     border: Border.all(color: Colors.white24),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         "Check-Out-Date",
              //         style: TextStyle(
              //           color: Colors.white54,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //       const SizedBox(height: 4),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: [
              //           Text(
              //             dateFormatter.format(checkOut),
              //             style: const TextStyle(
              //               color: Colors.white,
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           const SizedBox(width: 4),
              //           Text(
              //             "${dayFormatter.format(checkOut)}, ${yearFormatter.format(checkOut)}",
              //             style: const TextStyle(
              //               color: Colors.white54,
              //               fontSize: 14,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),

          // --- Floating Night Badge ---
          // Positioned(
          //   top: 20,
          //   child: Container(
          //     padding:
          //     const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          //     decoration: BoxDecoration(
          //       color: Colors.grey.shade800,
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     child: Text(
          //       "$nights NIGHT${nights > 1 ? 'S' : ''}",
          //       style: const TextStyle(
          //         color: Colors.white,
          //         fontSize: 10,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
