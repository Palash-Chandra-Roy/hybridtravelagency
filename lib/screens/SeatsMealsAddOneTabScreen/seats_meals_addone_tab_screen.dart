import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/SeatsMealsAddOneTabScreen/add_one_screen.dart';
import 'package:hybridtravelagency/screens/SeatsMealsAddOneTabScreen/meals_screen.dart';
import 'package:hybridtravelagency/screens/SeatsMealsAddOneTabScreen/seats.dart';
import 'package:hybridtravelagency/screens/SeatsMealsAddOneTabScreen/seats_screen.dart';
import 'package:hybridtravelagency/screens/SeatsMealsAddOneTabScreen/seats_meals_addone_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/FareBreakUpScreen1/fare_break_up_screen1.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import '../../utils/shared_pref_util.dart';
import '../SelectPaymentMethodScreen/select_payment_method_screen.dart';

class SeatsMealsAddOneTabScreen extends StatelessWidget {
  SeatsMealsAddOneTabScreen({super.key});
  final SeatsMealsAddOneTabController seatsMealsAddOneTabController =
      Get.put(SeatsMealsAddOneTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(flightSearch2TopImage),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              seatSelected.value = false;
                            },
                            child:
                                Icon(Icons.arrow_back, color: white, size: 20),
                          ),
                          SizedBox(width: 25),
                          CommonTextWidget.PoppinsSemiBold(
                            text: "Add-ons",
                            color: white,
                            fontSize: 18,
                          ),
                        ],
                      ),
                      CommonTextWidget.PoppinsMedium(
                        text: "Skip To Payment",
                        color: white,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: seatsMealsAddOneTabController.controller,
                  children: [
                    SeatsScreen(),
                    MealsScreen(),
                    AddOneScreen(),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 110, left: 24, right: 24),
            child: Container(
              height: 45,
              width: Get.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: grey757.withValues(alpha: 0.25),
                    blurRadius: 6,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                padding: EdgeInsets.only(left: 0, bottom: 7, right: 0),
                tabs: seatsMealsAddOneTabController.myTabs,
                unselectedLabelColor: grey5F5,
                labelStyle:
                    TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14),
                unselectedLabelStyle:
                    TextStyle(fontFamily: "PoppinsMedium", fontSize: 14),
                labelColor: redCA0,
                controller: seatsMealsAddOneTabController.controller,
                indicatorColor: redCA0,
                indicatorWeight: 2.5,
              ),
            ),
          ),
          Positioned(
            bottom: 42,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              width: Get.width,
              color: black2E2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        // log(Lists.seatsList2.length.toString());
                        Get.to(() => SelectPaymentMethodScreen());
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
        ],
      ),
    );
  }
}
