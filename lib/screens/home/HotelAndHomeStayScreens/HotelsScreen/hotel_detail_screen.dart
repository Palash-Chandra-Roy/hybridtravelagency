import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_facilities_response.dart';
import 'package:hybridtravelagency/data/responses/search_hotels_response.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/rate_plan_detail_screen.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class HotelDetailScreen extends StatelessWidget {
  final HotelData hotel;
  const HotelDetailScreen({super.key, required this.hotel});

  /// Helper method to collect image URLs from available data
  List<String> _getHotelImages() {
    final List<String> images = [];

    // If the API has a `photos` or `gallery` field later, you can map it here:
    // if (hotel.photos != null) {
    //   images.addAll(hotel.photos!);
    // }

    // Add mainPhoto and thumbnail (fallback)
    if (hotel.mainPhoto != null && hotel.mainPhoto!.isNotEmpty) {
      images.add(hotel.mainPhoto!);
    }
    if (hotel.thumbnail != null &&
        hotel.thumbnail!.isNotEmpty &&
        hotel.thumbnail != hotel.mainPhoto) {
      images.add(hotel.thumbnail!);
    }

    // If still empty, add a default placeholder
    if (images.isEmpty) {
      images.add("https://via.placeholder.com/150?text=No+Image");
    }

    return images;
  }

  List<String> _getFacilityNames() {
    if (hotel.facilityIds == null ||
        hotel.facilityIds!.isEmpty ||
        SharedPrefUtil.hotelsFacilities == null) {
      return [];
    }

    // Map the IDs to names using the global facilities list
    final names = hotel.facilityIds!.map((id) {
      final facility = SharedPrefUtil.hotelsFacilities!.firstWhere(
        (f) => f.facilityId == id,
        orElse: () => HotelFacility(name: "Facility $id"),
      );
      return facility.name ?? "Facility $id";
    }).toList();

    return names;
  }

  @override
  Widget build(BuildContext context) {
    final images = _getHotelImages();
    final facilityNames = _getFacilityNames();
    return Scaffold(
      backgroundColor: white,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === TOP HEADER IMAGE ===
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(images.first),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 24,
                    right: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: Get.back,
                          child:
                              const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.search, color: Colors.white, size: 24),
                            SizedBox(width: 20),
                            Icon(Icons.favorite_border, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          CommonTextWidget.PoppinsRegular(
                            text: "${images.length} Photos",
                            color: white,
                            fontSize: 12,
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.arrow_forward,
                              color: white, size: 14),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // === HOTEL NAME & LOCATION ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget.PoppinsSemiBold(
                      text: hotel.name ?? "Hotel Name Unavailable",
                      fontSize: 20,
                      color: black2E2,
                    ),
                    const SizedBox(height: 8),
                    if (hotel.address != null && hotel.address!.isNotEmpty)
                      CommonTextWidget.PoppinsRegular(
                        text: hotel.address!,
                        fontSize: 13,
                        color: grey717,
                      ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Rating section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Star rating
                              Row(
                                children: List.generate(5, (index) {
                                  final rating = hotel.rating ?? 0;
                                  if (index < rating.floor()) {
                                    return Icon(Icons.star,
                                        size: 18, color: Colors.amber.shade600);
                                  } else if (index < rating.ceil() &&
                                      rating % 1 != 0) {
                                    return Icon(Icons.star_half,
                                        size: 18, color: Colors.amber.shade600);
                                  } else {
                                    return Icon(Icons.star_border,
                                        size: 18, color: Colors.amber.shade600);
                                  }
                                }),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: CommonTextWidget.PoppinsSemiBold(
                                      text:
                                          "${hotel.rating?.toStringAsFixed(1) ?? '0.0'} Out of 5",
                                      color: white,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  CommonTextWidget.PoppinsMedium(
                                    text: hotel.rating != null &&
                                            hotel.rating! >= 4.0
                                        ? "Rated Excellent"
                                        : hotel.rating != null &&
                                                hotel.rating! >= 3.0
                                            ? "Rated Good"
                                            : "Rated Average",
                                    fontSize: 13,
                                    color: black2E2,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              CommonTextWidget.PoppinsRegular(
                                text:
                                    "Based on ${hotel.reviewCount ?? 0} Ratings",
                                fontSize: 12,
                                color: grey717,
                              ),
                            ],
                          ),
                        ),
                        // Map section
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: greyE8E,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(Icons.location_on,
                                  color: redCA0, size: 24),
                            ),
                            const SizedBox(height: 4),
                            if (hotel.address != null &&
                                hotel.address!.isNotEmpty)
                              SizedBox(
                                width: 80,
                                child: CommonTextWidget.PoppinsRegular(
                                  text: hotel.address!.split(',').first,
                                  fontSize: 11,
                                  color: grey717,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                            const SizedBox(height: 2),
                            CommonTextWidget.PoppinsMedium(
                              text: "View on Map",
                              fontSize: 11,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              const Divider(color: greyE8E, thickness: 1),
              const SizedBox(height: 15),

              // === TRAVEL DATES & GUESTS ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget.PoppinsSemiBold(
                              text: "Travel Dates & Guests",
                              fontSize: 16,
                              color: black2E2,
                            ),
                            Container(
                              height: 2,
                              width: 100,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CommonTextWidget.PoppinsMedium(
                              text: "View Calendar",
                              color: redCA0,
                              fontSize: 11,
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_forward_ios,
                                color: redCA0, size: 10),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Check-In & Check-Out
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: grey9B9.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: greyE2E),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              color: grey717, size: 20),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget.PoppinsMedium(
                                text: "Check-In & Check-Out",
                                color: grey888,
                                fontSize: 14,
                              ),
                              CommonTextWidget.PoppinsMedium(
                                text: "28 Sep, Thu - 30 Sep, Fri",
                                color: black2E2,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Rooms & Guests
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: grey9B9.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: greyE2E),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline,
                              color: grey717, size: 20),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget.PoppinsMedium(
                                text: "Rooms & Guests",
                                color: grey888,
                                fontSize: 14,
                              ),
                              CommonTextWidget.PoppinsMedium(
                                text: "1 Rooms, 2 Adults",
                                color: black2E2,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              const Divider(color: greyE8E, thickness: 1),
              const SizedBox(height: 15),

              // === HOTEL DESCRIPTION (IF AVAILABLE) ===
              if (hotel.hotelDescription != null &&
                  hotel.hotelDescription!.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget.PoppinsSemiBold(
                        text: "About Hotel",
                        fontSize: 16,
                        color: black2E2,
                      ),
                      const SizedBox(height: 10),
                      Html(
                        data: hotel.hotelDescription!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: greyE8E, thickness: 1),
                const SizedBox(height: 15),
              ],

              // === DYNAMIC GALLERY IMAGES ===
              if (images.length > 1) ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: CommonTextWidget.PoppinsSemiBold(
                    text: "Gallery",
                    fontSize: 16,
                    color: black2E2,
                  ),
                ),
                const SizedBox(height: 10),
                CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        images[index],
                        height: 200,
                        width: Get.width,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            width: Get.width,
                            color: greyE8E,
                            child: const Icon(Icons.broken_image,
                                color: Colors.grey, size: 50),
                          );
                        },
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    enableInfiniteScroll: images.length > 1,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(color: greyE8E, thickness: 1),
              ],

              // === FACILITIES ===
              if (facilityNames.isNotEmpty) ...[
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget.PoppinsSemiBold(
                        text: "Facilities",
                        fontSize: 16,
                        color: black2E2,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: facilityNames
                            .map(
                              (name) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: grey9B9.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: greyE2E, width: 0.8),
                                ),
                                child: Text(
                                  name,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: greyE8E, thickness: 1),
              ],

              // === ACCESSIBILITY ATTRIBUTES ===
              if (hotel.accessibilityAttributes != null &&
                  hotel.accessibilityAttributes!.attributes != null &&
                  hotel.accessibilityAttributes!.attributes!.isNotEmpty) ...[
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget.PoppinsSemiBold(
                        text: "Accessibility Info",
                        fontSize: 16,
                        color: black2E2,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        hotel.accessibilityAttributes!.attributes!,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: greyE8E, thickness: 1),
              ],

              const SizedBox(height: 20),

              // === PRICE & ACTION BUTTON ===
              if (hotel.price != null && hotel.price! > 0)
                SafeArea(
                  child: Container(
                    width: Get.width,
                    color: black2E2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text: "₹ ${hotel.price!.toStringAsFixed(0)}",
                                color: white,
                                fontSize: 18,
                              ),
                              CommonTextWidget.PoppinsRegular(
                                text: "Per Night",
                                color: white,
                                fontSize: 11,
                              ),
                            ],
                          ),
                          MaterialButton(
                            onPressed: () {
                              Get.to(() => RatePlanDetailScreen());
                            },
                            height: 45,
                            minWidth: 150,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            color: redCA0,
                            elevation: 0,
                            child: CommonTextWidget.PoppinsSemiBold(
                              fontSize: 16,
                              text: "SELECT ROOM",
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:hybridtravelagency/constants/colors.dart';
// import 'package:hybridtravelagency/constants/images.dart';
// import 'package:hybridtravelagency/data/responses/search_hotels_response.dart';
// import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/hotel_detail_search_screen.dart';
// import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/rate_plan_detail_screen.dart';
// import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/select_check_inout_date_screen.dart';
// import 'package:hybridtravelagency/widgets/common_text_widget.dart';
// import 'package:hybridtravelagency/utils/lists_widget.dart';
// import 'package:hybridtravelagency/main.dart';
//
// class HotelDetailScreen extends StatelessWidget {
//   final HotelData hotel;
//   HotelDetailScreen({super.key, required this.hotel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       body: ScrollConfiguration(
//         behavior: MyBehavior(),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 250,
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(hotelDetailTopImage),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 24, right: 24, top: 55),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Get.back();
//                             },
//                             child:
//                                 SvgPicture.asset(internationalDetailBackImage),
//                           ),
//                           Row(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Get.to(() => HotelDetailSearchScreen());
//                                 },
//                                 child: SvgPicture.asset(
//                                     internationalDetailSearchImage),
//                               ),
//                               SizedBox(width: 20),
//                               SvgPicture.asset(hotelDetailHeartIcon),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: Alignment.bottomRight,
//                           child: Image.asset(hotelDetailTopImage2,
//                               height: 26, width: 103),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Image.asset(hotelDetailImage3, height: 163, width: 327),
//               ),
//               SizedBox(height: 20),
//               Divider(color: greyE8E, thickness: 1),
//               SizedBox(height: 15),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(hotelDetailImage4, height: 23, width: 134),
//                     InkWell(
//                       onTap: () {
//                         Get.to(() => SelectCheckInOutDateScreen(from: "Hotel-Detail",));
//                       },
//                       child: Row(
//                         children: [
//                           CommonTextWidget.PoppinsMedium(
//                             text: "View Calendar",
//                             color: redCA0,
//                             fontSize: 11,
//                           ),
//                           Icon(Icons.arrow_forward_ios,
//                               color: redCA0, size: 10),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: Lists.hotelDetailList1.length,
//                 physics: NeverScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 itemBuilder: (context, index) => Padding(
//                   padding: EdgeInsets.only(bottom: 15),
//                   child: InkWell(
//                     onTap: Lists.hotelDetailList1[index]["onTap"],
//                     child: Container(
//                       width: Get.width,
//                       decoration: BoxDecoration(
//                         color: grey9B9.withValues(alpha: 0.15),
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(width: 1, color: greyE2E),
//                       ),
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 15, vertical: 7),
//                         child: Row(
//                           children: [
//                             SvgPicture.asset(
//                                 Lists.hotelDetailList1[index]["image"]),
//                             SizedBox(width: 15),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CommonTextWidget.PoppinsMedium(
//                                   text: Lists.hotelDetailList1[index]["text1"],
//                                   color: grey888,
//                                   fontSize: 14,
//                                 ),
//                                 CommonTextWidget.PoppinsMedium(
//                                   text: Lists.hotelDetailList1[index]["text2"],
//                                   color: black2E2,
//                                   fontSize: 12,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Divider(color: greyE8E, thickness: 1),
//               SizedBox(height: 15),
//               Image.asset(hotelDetailImage5),
//               SizedBox(height: 15),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Image.asset(hotelDetailImage6, height: 25, width: 240),
//               ),
//               SizedBox(height: 15),
//               SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   padding: EdgeInsets.only(left: 24, right: 9),
//                   shrinkWrap: true,
//                   itemCount: Lists.hotelDetailList2.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => Padding(
//                     padding: EdgeInsets.only(right: 15),
//                     child: Image.asset(Lists.hotelDetailList2[index],
//                         height: 150, width: 150),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               Padding(
//                 padding: EdgeInsets.only(bottom: 40),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         width: Get.width,
//                         color: black2E2,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 24, vertical: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CommonTextWidget.PoppinsSemiBold(
//                                     text: "₹ 7,950",
//                                     color: white,
//                                     fontSize: 16,
//                                   ),
//                                   CommonTextWidget.PoppinsRegular(
//                                     text: "+ ₹870 taxes & service fees",
//                                     color: white,
//                                     fontSize: 10,
//                                   ),
//                                   CommonTextWidget.PoppinsRegular(
//                                     text: "Per Night (2 Adults)",
//                                     color: white,
//                                     fontSize: 10,
//                                   ),
//                                 ],
//                               ),
//                               MaterialButton(
//                                 onPressed: () {
//                                   Get.to(() => RatePlanDetailScreen());
//                                 },
//                                 height: 40,
//                                 minWidth: 140,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 color: redCA0,
//                                 child: CommonTextWidget.PoppinsSemiBold(
//                                   fontSize: 16,
//                                   text: "SELECT ROOM",
//                                   color: white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // SizedBox(height: 0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
