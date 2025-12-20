import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/font_family.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/AddTravellerScreen/add_traveller_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/CheckInBaggageScreen/check_in_baggage_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/FareBreakUpScreen1/fare_break_up_screen1.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/RefundPolicyScreen/refund_policy_tab_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/contact_information_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/gst_information_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/review_detail_screen.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/my_dot_separator.dart';

import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class FlightDetailScreen1 extends StatelessWidget {
  FlightDetailScreen1({super.key});

  final TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightDetailController>(builder: (controller) {
      return Scaffold(
        backgroundColor: redF9E,
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(flightDetail1Image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 75, left: 24, right: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(Icons.arrow_back,
                                      color: white, size: 24),
                                ),
                                Column(
                                  children: [
                                    CommonTextWidget.PoppinsMedium(
                                      text: SharedPrefUtil
                                                  .flightOffer!.slices!.length >
                                              1
                                          ? "Round Trip"
                                          : "Trip to",
                                      color: white,
                                      fontSize: 14,
                                    ),
                                    CommonTextWidget.PoppinsSemiBold(
                                      text:
                                          "${SharedPrefUtil.flightOffer!.slices![0].destination!.cityName}",
                                      color: white,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                                SizedBox.shrink(),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Container(
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Image.asset(spicejet),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget.PoppinsSemiBold(
                                        text:
                                            "${SharedPrefUtil.flightOffer!.slices![0].origin!.iataCityCode} - ${SharedPrefUtil.flightOffer!.slices![0].destination!.iataCityCode}",
                                        color: white,
                                        fontSize: 14,
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: "${formatToDayDateMonth(
                                          SharedPrefUtil.flightOffer!.slices![0]
                                              .segments![0].arrivingAt!,
                                        )} | ${parseDateTimeToTime(SharedPrefUtil.flightOffer!.slices![0].segments![0].arrivingAt!)} - ${parseDateTimeToTime(SharedPrefUtil.flightOffer!.slices![0].segments![0].departingAt!)} | ${parseIntervalTimeHour(SharedPrefUtil.flightOffer!.slices![0].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![0].segments![0].departingAt!)} ${parseIntervalTimeMinutes(SharedPrefUtil.flightOffer!.slices![0].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![0].segments![0].departingAt!)}",
                                        color: white,
                                        fontSize: 14,
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text:
                                            "Economy > ${SharedPrefUtil.flightOffer!.slices![0].fareBrandName}",
                                        color: white,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Show return flight info if round trip
                            if (SharedPrefUtil.flightOffer!.slices!.length >
                                1) ...[
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Image.asset(spicejet),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonTextWidget.PoppinsSemiBold(
                                              text:
                                                  "Return: ${SharedPrefUtil.flightOffer!.slices![1].origin!.iataCityCode} - ${SharedPrefUtil.flightOffer!.slices![1].destination!.iataCityCode}",
                                              color: white,
                                              fontSize: 14,
                                            ),
                                            CommonTextWidget.PoppinsMedium(
                                              text: "${formatToDayDateMonth(
                                                SharedPrefUtil
                                                    .flightOffer!
                                                    .slices![1]
                                                    .segments![0]
                                                    .arrivingAt!,
                                              )} | ${parseDateTimeToTime(SharedPrefUtil.flightOffer!.slices![1].segments![0].arrivingAt!)} - ${parseDateTimeToTime(SharedPrefUtil.flightOffer!.slices![1].segments![0].departingAt!)} | ${parseIntervalTimeHour(SharedPrefUtil.flightOffer!.slices![1].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![1].segments![0].departingAt!)} ${parseIntervalTimeMinutes(SharedPrefUtil.flightOffer!.slices![1].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![1].segments![0].departingAt!)}",
                                              color: white,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(height: 25),
                            Container(
                              height: 43,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: white, width: 1),
                              ),
                              child: Center(
                                child: CommonTextWidget.PoppinsMedium(
                                  text: "VIEW FLIGHT & FARE DETAILS",
                                  color: white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => RefundPolicyTabScreen());
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextWidget.PoppinsSemiBold(
                                      text: "Baggage Policy",
                                      color: black2E2,
                                      fontSize: 16,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        color: redCA0),
                                  ],
                                ),
                              ),
                              SizedBox(height: 22),
                              Table(
                                columnWidths: {
                                  0: FlexColumnWidth(1.5),
                                  1: FlexColumnWidth(4.5),
                                  2: FlexColumnWidth(6),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        child: SvgPicture.asset(briefcase),
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: "Cabin bag",
                                        color: black2E2,
                                        fontSize: 12,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text:
                                            " Kgs ( ${SharedPrefUtil.flightOffer!.slices![0].segments![0].passengers![0].baggages![0].quantity} Piece only)",
                                        color: grey717,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        child: SvgPicture.asset(backpack),
                                      ),
                                      CommonTextWidget.PoppinsMedium(
                                        text: "Check-in",
                                        color: black2E2,
                                        fontSize: 12,
                                      ),
                                      CommonTextWidget.PoppinsRegular(
                                        text:
                                            " Kgs ( ${SharedPrefUtil.flightOffer!.slices![0].segments![0].passengers![0].baggages![1].quantity} Piece only)",
                                        color: grey717,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  Get.to(() => CheckInBaggageScreen());
                                },
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: redF9E.withValues(alpha: 0.75),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child:
                                              CommonTextWidget.PoppinsRegular(
                                            text:
                                                "Got excess luggage? Dont’t stress, buy "
                                                "extra check-in baggage allowance at fab "
                                                "rates!",
                                            color: black2E2,
                                            maxLines: 3,
                                            fontSize: 10,
                                          ),
                                        ),
                                        CommonTextWidget.PoppinsSemiBold(
                                          text: "+ADD",
                                          color: redCA0,
                                          fontSize: 14,
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
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text: "Cancellation Refund Policy",
                                color: black2E2,
                                fontSize: 16,
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonTextWidget.PoppinsMedium(
                                    text: "Cancel Between (IST):",
                                    color: grey717,
                                    fontSize: 10,
                                  ),
                                  CommonTextWidget.PoppinsMedium(
                                    text: "Cancellation Penalty:",
                                    color: grey717,
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonTextWidget.PoppinsMedium(
                                    text: "Refund Before Departure",
                                    color: black2E2,
                                    fontSize: 12,
                                  ),
                                  CommonTextWidget.PoppinsMedium(
                                    text:
                                        "${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.conditions!.refundBeforeDeparture!.penaltyAmount ?? '0'}",
                                    color: black2E2,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              MyDotSeparator(),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonTextWidget.PoppinsMedium(
                                    text: "Change Before Departure",
                                    color: black2E2,
                                    fontSize: 12,
                                  ),
                                  CommonTextWidget.PoppinsMedium(
                                    text:
                                        "${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.conditions!.changeBeforeDeparture!.penaltyAmount ?? '0'}",
                                    color: black2E2,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: redF9E.withValues(alpha: 0.75),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CommonTextWidget.PoppinsRegular(
                                          text:
                                              "Upgrade fare to get extra legroom "
                                              "and complimentary meals",
                                          color: black2E2,
                                          fontSize: 10,
                                        ),
                                      ),
                                      CommonTextWidget.PoppinsSemiBold(
                                        text: "UPGRADE",
                                        color: redCA0,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 24),
                    //   child: Container(
                    //     width: Get.width,
                    //     decoration: BoxDecoration(
                    //       color: white,
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(left: 15, right: 15),
                    //       child: Column(
                    //         children: [
                    //           ListTile(
                    //             onTap: () {
                    //               Get.to(() => ApplyPromoCodeScreen());
                    //             },
                    //             contentPadding: EdgeInsets.zero,
                    //             title: CommonTextWidget.PoppinsSemiBold(
                    //               text: "Offers & Promo Codes",
                    //               color: black2E2,
                    //               fontSize: 16,
                    //             ),
                    //             subtitle: CommonTextWidget.PoppinsRegular(
                    //               text: "To help you save more",
                    //               color: black2E2,
                    //               fontSize: 12,
                    //             ),
                    //             trailing: Icon(Icons.arrow_forward_ios,
                    //                 color: redCA0, size: 18),
                    //           ),
                    //           TextFormField(
                    //             keyboardType: TextInputType.text,
                    //             cursorColor: black2E2,
                    //             controller: promoCodeController,
                    //             style: TextStyle(
                    //               color: black2E2,
                    //               fontSize: 14,
                    //               fontFamily: FontFamily.PoppinsRegular,
                    //             ),
                    //             decoration: InputDecoration(
                    //               hintText: "Enter promo code here",
                    //               hintStyle: TextStyle(
                    //                 color: grey717,
                    //                 fontSize: 12,
                    //                 fontFamily: FontFamily.PoppinsRegular,
                    //               ),
                    //               suffixIcon: Padding(
                    //                 padding: EdgeInsets.all(14),
                    //                 child: CommonTextWidget.PoppinsMedium(
                    //                   color: redCA0,
                    //                   fontSize: 14,
                    //                   text: "APPLY",
                    //                 ),
                    //               ),
                    //               filled: true,
                    //               fillColor: white,
                    //               contentPadding: EdgeInsets.only(left: 14),
                    //               disabledBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   borderSide:
                    //                       BorderSide(color: redCA0, width: 1)),
                    //               border: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   borderSide:
                    //                       BorderSide(color: redCA0, width: 1)),
                    //               focusedBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   borderSide:
                    //                       BorderSide(color: redCA0, width: 1)),
                    //               enabledBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   borderSide:
                    //                       BorderSide(color: redCA0, width: 1)),
                    //               errorBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   borderSide:
                    //                       BorderSide(color: redCA0, width: 1)),
                    //             ),
                    //           ),
                    //           SizedBox(height: 15),
                    //           ListView.builder(
                    //             padding: EdgeInsets.zero,
                    //             physics: NeverScrollableScrollPhysics(),
                    //             shrinkWrap: true,
                    //             itemCount: 3,
                    //             itemBuilder: (context, index) => Padding(
                    //               padding: EdgeInsets.only(bottom: 10),
                    //               child: Container(
                    //                 decoration: BoxDecoration(
                    //                   color: whiteF2F,
                    //                   borderRadius: BorderRadius.circular(3),
                    //                 ),
                    //                 child: Padding(
                    //                   padding: EdgeInsets.symmetric(
                    //                       horizontal: 12, vertical: 10),
                    //                   child: Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Icon(Icons.circle_outlined,
                    //                           color: grey959),
                    //                       SizedBox(width: 15),
                    //                       Expanded(
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                           children: [
                    //                             CommonTextWidget.PoppinsSemiBold(
                    //                               text: "MMTSUPER",
                    //                               color: black2E2,
                    //                               fontSize: 14,
                    //                             ),
                    //                             CommonTextWidget.PoppinsRegular(
                    //                               text:
                    //                                   "Use this coupon and get Rs 475 instant"
                    //                                   "discount on your flight booking.",
                    //                               color: black2E2,
                    //                               fontSize: 10,
                    //                             ),
                    //                             CommonTextWidget.PoppinsSemiBold(
                    //                               text: "T&Cs apply",
                    //                               color: redCA0,
                    //                               fontSize: 10,
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                       SvgPicture.asset(tagIcon),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           Align(
                    //             alignment: Alignment.bottomRight,
                    //             child: CommonTextWidget.PoppinsSemiBold(
                    //               text: "VIEW MORE",
                    //               color: redCA0,
                    //               fontSize: 10,
                    //             ),
                    //           ),
                    //           SizedBox(height: 15),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 24),
                    //   child: Container(
                    //     width: Get.width,
                    //     decoration: BoxDecoration(
                    //       color: white,
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     child: Padding(
                    //       padding:
                    //           EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    //       child: Column(
                    //         children: [
                    //           ListTile(
                    //             contentPadding: EdgeInsets.zero,
                    //             horizontalTitleGap: -1,
                    //             leading:
                    //                 Icon(Icons.circle_outlined, color: grey959),
                    //             title: CommonTextWidget.PoppinsMedium(
                    //               text: "Donate ₹10 to support responsible "
                    //                   "tourism initiatives ",
                    //               color: black2E2,
                    //               fontSize: 12,
                    //             ),
                    //             trailing: CommonTextWidget.PoppinsMedium(
                    //               text: "T&Cs",
                    //               color: redCA0,
                    //               fontSize: 10,
                    //             ),
                    //           ),
                    //           SizedBox(height: 15),
                    //           Container(
                    //             width: Get.width,
                    //             decoration: BoxDecoration(
                    //               color: redFAE,
                    //               borderRadius: BorderRadius.circular(3),
                    //             ),
                    //             child: Padding(
                    //               padding: EdgeInsets.symmetric(
                    //                   horizontal: 10, vertical: 5),
                    //               child: RichText(
                    //                 text: TextSpan(
                    //                   text:
                    //                       "Support community empowerment and preservation or heritage. ",
                    //                   style: TextStyle(
                    //                     fontFamily: FontFamily.PoppinsMedium,
                    //                     fontSize: 10,
                    //                     color: black2E2,
                    //                   ),
                    //                   children: <TextSpan>[
                    //                     TextSpan(
                    //                       text: "Know More",
                    //                       style: TextStyle(
                    //                           fontSize: 10,
                    //                           fontFamily:
                    //                               FontFamily.PoppinsMedium,
                    //                           color: redCA0),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget.PoppinsSemiBold(
                                text: "Traveller Details",
                                color: black2E2,
                                fontSize: 16,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: -1,
                                leading: Image.asset(
                                    travellerDetailsProfileImage,
                                    height: 30,
                                    width: 30),
                                title: CommonTextWidget.PoppinsSemiBold(
                                  text: "ADULT (12 yrs+)",
                                  color: black2E2,
                                  fontSize: 16,
                                ),
                                trailing: RichText(
                                  text: TextSpan(
                                    text: "${controller.travellers.length}/1 ",
                                    style: TextStyle(
                                      fontFamily: FontFamily.PoppinsMedium,
                                      fontSize: 10,
                                      color: black2E2,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "added",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily:
                                                FontFamily.PoppinsMedium,
                                            color: grey717),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(height: 10),
                              controller.travellers.isEmpty
                                  ? SizedBox.shrink()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: controller.travellers.length,
                                      itemBuilder: (context, index) {
                                        final traveller =
                                            controller.travellers[index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border:
                                                  Border.all(color: greyE2E),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CommonTextWidget.PoppinsRegular(
                                                  text:
                                                      "${traveller.firstName} ${traveller.lastName} (${traveller.gender})",
                                                  color: black2E2,
                                                  fontSize: 14,
                                                ),
                                                Icon(Icons.person,
                                                    color: redCA0, size: 20),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                              controller.travellers.isEmpty
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(() => AddTravellerScreen());
                                      },
                                      child: Container(
                                        height: 44,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey4B4.withValues(
                                                  alpha: 0.25),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child:
                                              CommonTextWidget.PoppinsSemiBold(
                                            text: "+ Add New ADULT",
                                            color: redCA0,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(height: 15),
                              Divider(color: greyE8E, thickness: 1),
                              SizedBox(height: 15),
                              InkWell(
                                onTap: () {
                                  Get.bottomSheet(
                                    ContactInformationScreen(),
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextWidget.PoppinsMedium(
                                      text: "Booking details will be sent to",
                                      color: black2E2,
                                      fontSize: 12,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        color: redCA0, size: 18),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 10,
                                leading: Image.asset(addEmailIdIcon),
                                title: CommonTextWidget.PoppinsMedium(
                                  text: "Add Email ID",
                                  color: redCA0,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 12),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 10,
                                leading: Image.asset(phoneImage),
                                title: CommonTextWidget.PoppinsRegular(
                                  text: "91-8669825896",
                                  color: grey717,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 15),
                              Divider(color: greyE8E, thickness: 1),
                              SizedBox(height: 10),
                              ListTile(
                                onTap: () {
                                  Get.bottomSheet(
                                    GstInformationScreen(),
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                  );
                                },
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 1,
                                leading: Icon(Icons.crop_square,
                                    color: grey717, size: 30),
                                title: RichText(
                                  text: TextSpan(
                                    text: "I have a GST number ",
                                    style: TextStyle(
                                      fontFamily: FontFamily.PoppinsMedium,
                                      fontSize: 12,
                                      color: black2E2,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "(Optional)",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily:
                                                FontFamily.PoppinsMedium,
                                            color: grey717),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 110),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Container(
                  width: Get.width,
                  color: black2E2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GetBuilder<FlightBookController>(
                                builder: (bookController) {
                              String passengerText = '';
                              List<String> parts = [];

                              if (bookController.adults > 0) {
                                parts.add(
                                    '${bookController.adults} ${bookController.adults == 1 ? 'ADULT' : 'ADULTS'}');
                              }
                              if (bookController.children > 0) {
                                parts.add(
                                    '${bookController.children} ${bookController.children == 1 ? 'CHILD' : 'CHILDREN'}');
                              }
                              if (bookController.infants > 0) {
                                parts.add(
                                    '${bookController.infants} ${bookController.infants == 1 ? 'INFANT' : 'INFANTS'}');
                              }

                              passengerText = parts.isNotEmpty
                                  ? 'FOR ${parts.join(', ')}'
                                  : 'FOR 1 ADULT';

                              return Column(
                                children: [
                                  CommonTextWidget.PoppinsSemiBold(
                                    text:
                                        "${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.totalAmount}",
                                    color: white,
                                    fontSize: 16,
                                  ),
                                  CommonTextWidget.PoppinsMedium(
                                    text: passengerText,
                                    color: white,
                                    fontSize: 10,
                                  ),
                                ],
                              );
                            }),
                            SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                Get.to(() => FareBreakUpScreen1());
                              },
                              child: SvgPicture.asset(info),
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {
                            Get.bottomSheet(
                              ReviewDetailScreen(),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            );
                          },
                          height: 40,
                          minWidth: 140,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: redCA0,
                          child: CommonTextWidget.PoppinsSemiBold(
                            fontSize: 16,
                            text: "CONTINUE",
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
