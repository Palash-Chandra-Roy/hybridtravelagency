import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/flight_detail_screen1.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class FlightDetailScreen extends StatelessWidget {
  FlightDetailScreen({super.key});

  String _calculateConnectingTime(String? arrivalTime, String? departureTime) {
    if (arrivalTime == null || departureTime == null) return 'N/A';
    try {
      final arrival = DateTime.parse(arrivalTime);
      final departure = DateTime.parse(departureTime);
      final difference = departure.difference(arrival);

      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;

      if (hours > 0 && minutes > 0) {
        return '$hours Hour${hours != 1 ? 's' : ''} $minutes Minute${minutes != 1 ? 's' : ''}';
      } else if (hours > 0) {
        return '$hours Hour${hours != 1 ? 's' : ''}';
      } else {
        return '$minutes Minute${minutes != 1 ? 's' : ''}';
      }
    } catch (e) {
      return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redF9E,
      appBar: AppBar(
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Flight Details",
          color: white,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.close, color: white, size: 20),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 24, right: 24),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(flightDetailImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 12),
                              child: Column(
                                children: [
                                  CommonTextWidget.PoppinsSemiBold(
                                    text:
                                        "${SharedPrefUtil.flightOffer!.slices![0].origin!.iataCityCode} - ${SharedPrefUtil.flightOffer!.slices![0].destination!.iataCityCode}",
                                    color: white,
                                    fontSize: 18,
                                  ),
                                  CommonTextWidget.PoppinsMedium(
                                    text:
                                        "${stops(SharedPrefUtil.flightOffer!.slices![0].segments!.length)} | ${parseIntervalTimeHour(SharedPrefUtil.flightOffer!.slices![0].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![0].segments![0].departingAt!)} ${parseIntervalTimeMinutes(SharedPrefUtil.flightOffer!.slices![0].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![0].segments![0].departingAt!)} | Economy",
                                    color: white,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15, left: 15, right: 15, bottom: 18),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.network(
                                      SharedPrefUtil.flightOffer!.owner!
                                              .logoSymbolUrl ??
                                          '',
                                      // height: 30,
                                      width: 30,
                                    ),
                                    SizedBox(width: 8),
                                    CommonTextWidget.PoppinsMedium(
                                      text:
                                          "${SharedPrefUtil.flightOffer!.owner!.name}  | ${SharedPrefUtil.flightOffer!.owner!.iataCode}",
                                      color: black2E2,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextWidget.PoppinsSemiBold(
                                      text: parseDateTimeToTime(SharedPrefUtil
                                          .flightOffer!
                                          .slices![0]
                                          .segments![0]
                                          .arrivingAt!),
                                      color: black2E2,
                                      fontSize: 20,
                                    ),
                                    CommonTextWidget.PoppinsMedium(
                                      text:
                                          "-- ${parseIntervalTimeHour(SharedPrefUtil.flightOffer!.slices![0].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![0].segments![0].departingAt!)} ${parseIntervalTimeMinutes(SharedPrefUtil.flightOffer!.slices![0].segments![0].arrivingAt!, SharedPrefUtil.flightOffer!.slices![0].segments![0].departingAt!)} --",
                                      color: black2E2,
                                      fontSize: 12,
                                    ),
                                    CommonTextWidget.PoppinsSemiBold(
                                      text: parseDateTimeToTime(SharedPrefUtil
                                          .flightOffer!
                                          .slices![0]
                                          .segments![0]
                                          .departingAt!),
                                      color: black2E2,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextWidget.PoppinsRegular(
                                      text: formatToDayMonthYear(
                                        SharedPrefUtil.flightOffer!.slices![0]
                                            .segments![0].arrivingAt!,
                                      ),
                                      color: black2E2,
                                      fontSize: 12,
                                    ),
                                    SvgPicture.asset(watch),
                                    CommonTextWidget.PoppinsRegular(
                                      text: formatToDayMonthYear(
                                        SharedPrefUtil.flightOffer!.slices![0]
                                            .segments![0].departingAt!,
                                      ),
                                      color: black2E2,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonTextWidget.PoppinsMedium(
                                          text:
                                              "${SharedPrefUtil.flightOffer!.slices![0].origin!.iataCityCode}",
                                          color: black2E2,
                                          fontSize: 12,
                                        ),
                                        CommonTextWidget.PoppinsRegular(
                                          text:
                                              "${SharedPrefUtil.flightOffer!.slices![0].origin!.cityName}",
                                          color: black2E2,
                                          fontSize: 12,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.375,
                                            child:
                                                CommonTextWidget.PoppinsRegular(
                                              text:
                                                  "${SharedPrefUtil.flightOffer!.slices![0].origin!.name}",
                                              maxLines: 2,
                                              color: black2E2,
                                              fontSize: 12,
                                            )),
                                        CommonTextWidget.PoppinsRegular(
                                          text:
                                              "Terminal ${SharedPrefUtil.flightOffer!.slices![0].segments![0].originTerminal}",
                                          color: grey717,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CommonTextWidget.PoppinsMedium(
                                          text:
                                              "${SharedPrefUtil.flightOffer!.slices![0].destination!.iataCityCode}",
                                          color: black2E2,
                                          fontSize: 12,
                                        ),
                                        CommonTextWidget.PoppinsRegular(
                                          text:
                                              "${SharedPrefUtil.flightOffer!.slices![0].destination!.cityName}",
                                          color: black2E2,
                                          fontSize: 12,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.375,
                                            child:
                                                CommonTextWidget.PoppinsRegular(
                                              text:
                                                  "${SharedPrefUtil.flightOffer!.slices![0].destination!.name}",
                                              maxLines: 2,
                                              color: black2E2,
                                              fontSize: 12,
                                            )),
                                        CommonTextWidget.PoppinsRegular(
                                          text:
                                              "Terminal ${SharedPrefUtil.flightOffer!.slices![0].segments![0].destinationTerminal}",
                                          color: grey717,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<FlightDetailController>(
                        init: FlightDetailController(),
                        builder: (controller) => ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                SharedPrefUtil.flightOffer!.slices!.length,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 8),
                            itemBuilder: (context, index1) {
                              var slice =
                                  SharedPrefUtil.flightOffer!.slices![index1];
                              return Padding(
                                  padding: EdgeInsets.zero,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Slice Label (Outbound/Return)
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: primary.withValues(
                                                    alpha: 0.1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.flight_takeoff,
                                                      color: primary, size: 18),
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                    child: CommonTextWidget
                                                        .PoppinsSemiBold(
                                                      text: index1 == 0
                                                          ? "Outbound Flight: ${slice.origin?.iataCityCode ?? ''} → ${slice.destination?.iataCityCode ?? ''}"
                                                          : "Return Flight: ${slice.origin?.iataCityCode ?? ''} → ${slice.destination?.iataCityCode ?? ''}",
                                                      color: primary,
                                                      fontSize: 14,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15),

                                            // Segments Loop
                                            ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: slice.segments!.length,
                                              itemBuilder: (context, segIndex) {
                                                var segment =
                                                    slice.segments![segIndex];
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Segment Details
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Departure
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CommonTextWidget
                                                                  .PoppinsSemiBold(
                                                                text: segment
                                                                        .origin
                                                                        ?.iataCode ??
                                                                    '',
                                                                color: black2E2,
                                                                fontSize: 18,
                                                              ),
                                                              CommonTextWidget
                                                                  .PoppinsRegular(
                                                                text: parseDateTimeToTime(
                                                                    segment.departingAt ??
                                                                        ''),
                                                                color: black2E2,
                                                                fontSize: 16,
                                                              ),
                                                              CommonTextWidget
                                                                  .PoppinsRegular(
                                                                text: formatToDayDateMonth(
                                                                    segment.departingAt ??
                                                                        ''),
                                                                color: grey717,
                                                                fontSize: 12,
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              CommonTextWidget
                                                                  .PoppinsRegular(
                                                                text: segment
                                                                        .origin
                                                                        ?.name ??
                                                                    '',
                                                                color: grey717,
                                                                fontSize: 10,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        // Duration & Icon
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8),
                                                          child: Column(
                                                            children: [
                                                              CommonTextWidget
                                                                  .PoppinsRegular(
                                                                text:
                                                                    "${parseIntervalTimeHour(segment.arrivingAt!, segment.departingAt!)} ${parseIntervalTimeMinutes(segment.arrivingAt!, segment.departingAt!)}",
                                                                color: grey717,
                                                                fontSize: 10,
                                                              ),
                                                              Icon(
                                                                  Icons
                                                                      .arrow_forward,
                                                                  color:
                                                                      primary,
                                                                  size: 20),
                                                            ],
                                                          ),
                                                        ),
                                                        // Arrival
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              CommonTextWidget
                                                                  .PoppinsSemiBold(
                                                                text: segment
                                                                        .destination
                                                                        ?.iataCode ??
                                                                    '',
                                                                color: black2E2,
                                                                fontSize: 18,
                                                              ),
                                                              CommonTextWidget
                                                                  .PoppinsRegular(
                                                                text: parseDateTimeToTime(
                                                                    segment.arrivingAt ??
                                                                        ''),
                                                                color: black2E2,
                                                                fontSize: 16,
                                                              ),
                                                              CommonTextWidget
                                                                  .PoppinsRegular(
                                                                text: formatToDayDateMonth(
                                                                    segment.arrivingAt ??
                                                                        ''),
                                                                color: grey717,
                                                                fontSize: 12,
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              CommonTextWidget
                                                                  .PoppinsRegular(
                                                                text: segment
                                                                        .destination
                                                                        ?.name ??
                                                                    '',
                                                                color: grey717,
                                                                fontSize: 10,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 12),
                                                    // Class and Baggage info
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: CommonTextWidget
                                                              .PoppinsRegular(
                                                            text:
                                                                "Class: ${segment.passengers?.first.cabinClass ?? 'Economy'}",
                                                            color: grey717,
                                                            fontSize: 11,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        SizedBox(width: 16),
                                                        Flexible(
                                                          child: CommonTextWidget
                                                              .PoppinsRegular(
                                                            text:
                                                                "Baggage: ${segment.passengers?.first.baggages?.length ?? 0} pcs",
                                                            color: grey717,
                                                            fontSize: 11,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    // Connecting Time (if not last segment)
                                                    if (segIndex <
                                                        slice.segments!.length -
                                                            1) ...[
                                                      SizedBox(height: 12),
                                                      Container(
                                                        width: double.infinity,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10,
                                                                horizontal: 12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.blue
                                                              .withValues(
                                                                  alpha: 0.1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: Colors.blue
                                                                  .withValues(
                                                                      alpha:
                                                                          0.3)),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .access_time,
                                                                color:
                                                                    Colors.blue,
                                                                size: 16),
                                                            SizedBox(width: 8),
                                                            Expanded(
                                                              child: CommonTextWidget
                                                                  .PoppinsMedium(
                                                                text:
                                                                    "Change plane at ${segment.destination?.name ?? ''} (${segment.destination?.iataCode ?? ''}), Connecting Time: ${_calculateConnectingTime(segment.arrivingAt, slice.segments![segIndex + 1].departingAt)}",
                                                                color: Colors
                                                                    .blue[800]!,
                                                                fontSize: 11,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 12),
                                                    ] else
                                                      SizedBox(height: 8),
                                                  ],
                                                );
                                              },
                                            ),

                                            SizedBox(height: 15),
                                            Divider(
                                                color: greyE8E, thickness: 1),
                                            SizedBox(height: 15),
                                            Table(
                                              columnWidths: {
                                                0: FlexColumnWidth(1.5),
                                                1: FlexColumnWidth(4.5),
                                                2: FlexColumnWidth(6),
                                              },
                                              children: [
                                                ...slice.segments![0]
                                                    .passengers![0].baggages!
                                                    .map(
                                                  (baggage) => TableRow(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 10,
                                                                right: 10),
                                                        child: SvgPicture.asset(
                                                            briefcase),
                                                      ),
                                                      CommonTextWidget
                                                          .PoppinsMedium(
                                                        text: "${baggage.type}"
                                                            .toUpperCase(),
                                                        color: black2E2,
                                                        fontSize: 12,
                                                      ),
                                                      CommonTextWidget
                                                          .PoppinsRegular(
                                                        text:
                                                            "${baggage.quantity} Kgs",
                                                        color: grey717,
                                                        fontSize: 12,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // TableRow(
                                                //   children: [
                                                //     Padding(
                                                //       padding: EdgeInsets
                                                //           .only(
                                                //               bottom:
                                                //                   10,
                                                //               right:
                                                //                   10),
                                                //       child: SvgPicture
                                                //           .asset(
                                                //               backpack),
                                                //     ),
                                                //     CommonTextWidget
                                                //         .PoppinsMedium(
                                                //       text: "Check-in",
                                                //       color: black2E2,
                                                //       fontSize: 12,
                                                //     ),
                                                //     CommonTextWidget
                                                //         .PoppinsRegular(
                                                //       text: "15 Kgs",
                                                //       color: grey717,
                                                //       fontSize: 12,
                                                //     ),
                                                //   ],
                                                // ),
                                                TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10,
                                                          right: 10),
                                                      child: SvgPicture.asset(
                                                          currencyInr),
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsMedium(
                                                      text: "Cancellation",
                                                      color: black2E2,
                                                      fontSize: 12,
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsRegular(
                                                      text:
                                                          "Cancellation fee starting ₹ ",
                                                      color: grey717,
                                                      fontSize: 12,
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10,
                                                          right: 10),
                                                      child: SvgPicture.asset(
                                                          calendarPlus1,
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                                  redCA0,
                                                                  BlendMode
                                                                      .srcIn)),
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsMedium(
                                                      text: "Date Change",
                                                      color: black2E2,
                                                      fontSize: 12,
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsRegular(
                                                      text:
                                                          "Date Change fee starting ₹ 3,350",
                                                      color: grey717,
                                                      fontSize: 12,
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10,
                                                          right: 10),
                                                      child: SvgPicture.asset(
                                                          seat),
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsMedium(
                                                      text: "Seat",
                                                      color: black2E2,
                                                      fontSize: 12,
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsRegular(
                                                      text:
                                                          "Free Seat available",
                                                      color: grey717,
                                                      fontSize: 12,
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10),
                                                      child: SvgPicture.asset(
                                                          dish),
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsMedium(
                                                      text: "Meal",
                                                      color: black2E2,
                                                      fontSize: 12,
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsRegular(
                                                      text: "Get complimentary",
                                                      color: grey717,
                                                      fontSize: 12,
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10),
                                                      child: SvgPicture.asset(
                                                          dish),
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsMedium(
                                                      text: "Wifi",
                                                      color: black2E2,
                                                      fontSize: 12,
                                                    ),
                                                    CommonTextWidget
                                                        .PoppinsRegular(
                                                      text:
                                                          "${slice.segments![0].passengers![0].cabin!.amenities!.wifi!.cost}",
                                                      color: grey717,
                                                      fontSize: 12,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // SizedBox(height: 20),
                                            // CommonButtonWidget.button(
                                            //   buttonColor: primary,
                                            //   onTap: () {
                                            //     SharedPrefUtil.flightOffer = offer;
                                            //     Get.to(() =>
                                            //         FlightDetailScreen());
                                            //   },
                                            //   text: "Book Now",
                                            // ),
                                            // SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            })

                        //     ListView.builder(
                        //   shrinkWrap: true,
                        //   itemCount: Lists.flightBookTicketDetailList.length,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   padding: EdgeInsets.only(top: 8),
                        //   itemBuilder: (context, index) => Padding(
                        //     padding: EdgeInsets.zero,
                        //     child: Padding(
                        //       padding: EdgeInsets.only(bottom: 8),
                        //       child: Container(
                        //         width: Get.width,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(5),
                        //           color: white,
                        //         ),
                        //         child: Padding(
                        //           padding: EdgeInsets.all(15),
                        //           child: Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //               Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Row(
                        //                     children: [
                        //                       InkWell(
                        //                         onTap: () {
                        //                           controller.onIndexChange(index);
                        //                         },
                        //                         child: Container(
                        //                           height: 18,
                        //                           width: 18,
                        //                           decoration: BoxDecoration(
                        //                               color: white,
                        //                               shape: BoxShape.circle,
                        //                               border: Border.all(
                        //                                   color: controller
                        //                                               .selectedIndex ==
                        //                                           index
                        //                                       ? redCA0
                        //                                       : grey717)),
                        //                           alignment: Alignment.center,
                        //                           child: controller
                        //                                       .selectedIndex ==
                        //                                   index
                        //                               ? Container(
                        //                                   height: 10,
                        //                                   width: 10,
                        //                                   decoration:
                        //                                       BoxDecoration(
                        //                                           color: redCA0,
                        //                                           shape: BoxShape
                        //                                               .circle),
                        //                                 )
                        //                               : SizedBox.shrink(),
                        //                         ),
                        //                       ),
                        //                       SizedBox(width: 20),
                        //                       Column(
                        //                         crossAxisAlignment:
                        //                             CrossAxisAlignment.start,
                        //                         children: [
                        //                           CommonTextWidget
                        //                               .PoppinsSemiBold(
                        //                             text: Lists
                        //                                     .flightBookTicketDetailList[
                        //                                 index]["text1"],
                        //                             color: black2E2,
                        //                             fontSize: 14,
                        //                           ),
                        //                           CommonTextWidget.PoppinsRegular(
                        //                             text:
                        //                                 "Fare offered by airline.",
                        //                             color: grey717,
                        //                             fontSize: 10,
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   CommonTextWidget.PoppinsSemiBold(
                        //                     text:
                        //                         Lists.flightBookTicketDetailList[
                        //                             index]["text2"],
                        //                     color: black2E2,
                        //                     fontSize: 16,
                        //                   ),
                        //                 ],
                        //               ),
                        //               SizedBox(height: 25),
                        //               Table(
                        //                 columnWidths: {
                        //                   0: FlexColumnWidth(1.5),
                        //                   1: FlexColumnWidth(4.5),
                        //                   2: FlexColumnWidth(6),
                        //                 },
                        //                 children: [
                        //                   TableRow(
                        //                     children: [
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             bottom: 10, right: 10),
                        //                         child:
                        //                             SvgPicture.asset(briefcase),
                        //                       ),
                        //                       CommonTextWidget.PoppinsMedium(
                        //                         text: "Cabin bag",
                        //                         color: black2E2,
                        //                         fontSize: 12,
                        //                       ),
                        //                       CommonTextWidget.PoppinsRegular(
                        //                         text: "7 Kgs",
                        //                         color: grey717,
                        //                         fontSize: 12,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   TableRow(
                        //                     children: [
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             bottom: 10, right: 10),
                        //                         child: SvgPicture.asset(backpack),
                        //                       ),
                        //                       CommonTextWidget.PoppinsMedium(
                        //                         text: "Check-in",
                        //                         color: black2E2,
                        //                         fontSize: 12,
                        //                       ),
                        //                       CommonTextWidget.PoppinsRegular(
                        //                         text: "15 Kgs",
                        //                         color: grey717,
                        //                         fontSize: 12,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   TableRow(
                        //                     children: [
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             bottom: 10, right: 10),
                        //                         child:
                        //                             SvgPicture.asset(currencyInr),
                        //                       ),
                        //                       CommonTextWidget.PoppinsMedium(
                        //                         text: "Cancellation",
                        //                         color: black2E2,
                        //                         fontSize: 12,
                        //                       ),
                        //                       CommonTextWidget.PoppinsRegular(
                        //                         text:
                        //                             "Cancellation fee starting ₹ 3,600",
                        //                         color: grey717,
                        //                         fontSize: 12,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   TableRow(
                        //                     children: [
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             bottom: 10, right: 10),
                        //                         child: SvgPicture.asset(
                        //                             calendarPlus1,
                        //                             colorFilter: ColorFilter.mode(redCA0, BlendMode.srcIn)
                        //                         ),
                        //                       ),
                        //                       CommonTextWidget.PoppinsMedium(
                        //                         text: "Date Change",
                        //                         color: black2E2,
                        //                         fontSize: 12,
                        //                       ),
                        //                       CommonTextWidget.PoppinsRegular(
                        //                         text:
                        //                             "Date Change fee starting ₹ 3,350",
                        //                         color: grey717,
                        //                         fontSize: 12,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   TableRow(
                        //                     children: [
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             bottom: 10, right: 10),
                        //                         child: SvgPicture.asset(seat),
                        //                       ),
                        //                       CommonTextWidget.PoppinsMedium(
                        //                         text: "Seat",
                        //                         color: black2E2,
                        //                         fontSize: 12,
                        //                       ),
                        //                       CommonTextWidget.PoppinsRegular(
                        //                         text: "Free Seat available",
                        //                         color: grey717,
                        //                         fontSize: 12,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   TableRow(
                        //                     children: [
                        //                       Padding(
                        //                         padding:
                        //                             EdgeInsets.only(right: 10),
                        //                         child: SvgPicture.asset(dish),
                        //                       ),
                        //                       CommonTextWidget.PoppinsMedium(
                        //                         text: "Meal",
                        //                         color: black2E2,
                        //                         fontSize: 12,
                        //                       ),
                        //                       CommonTextWidget.PoppinsRegular(
                        //                         text: "Get complimentary",
                        //                         color: grey717,
                        //                         fontSize: 12,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ],
                        //               ),
                        //               SizedBox(height: 5),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        ),
                    SizedBox(height: 110),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                width: Get.width,
                color: black2E2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      MaterialButton(
                        onPressed: () {
                          Get.to(() => FlightDetailScreen1());
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
  }
}
