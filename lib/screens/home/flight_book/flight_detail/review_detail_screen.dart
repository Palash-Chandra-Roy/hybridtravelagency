import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/SelectPaymentMethodScreen/select_payment_method_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class ReviewDetailScreen extends StatelessWidget {
  ReviewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightDetailController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.only(top: 350),
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 25, bottom: 60, left: 24, right: 24),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget.PoppinsSemiBold(
                      text: "Review Details",
                      color: black2E2,
                      fontSize: 18,
                    ),
                    SizedBox(height: 10),
                    CommonTextWidget.PoppinsRegular(
                      text: "Please ensure that the spelling of your name "
                          "and other details match with your travel "
                          "document govt. ID, as there cannot be "
                          "changed later errors might lead to cancel "
                          "penalties.",
                      color: grey717,
                      fontSize: 14,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 4,
                      width: 30,
                      color: redCA0,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: greyE2E, width: 1),
                        color: white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: controller.travellers.length,
                            itemBuilder: (context, index) {
                              final traveller = controller.travellers[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextWidget.PoppinsMedium(
                                    text: "ADULT $index",
                                    color: black2E2,
                                    fontSize: 14,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonTextWidget.PoppinsRegular(
                                            text: "Name :",
                                            color: grey717,
                                            fontSize: 14,
                                          ),
                                          CommonTextWidget.PoppinsRegular(
                                            text: "Last Name :",
                                            color: grey717,
                                            fontSize: 14,
                                          ),
                                          CommonTextWidget.PoppinsRegular(
                                            text: "Gender :",
                                            color: grey717,
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonTextWidget.PoppinsMedium(
                                            text: traveller.firstName,
                                            color: black2E2,
                                            fontSize: 14,
                                          ),
                                          CommonTextWidget.PoppinsMedium(
                                            text: traveller.lastName,
                                            color: black2E2,
                                            fontSize: 14,
                                          ),
                                          CommonTextWidget.PoppinsMedium(
                                            text: traveller.gender,
                                            color: black2E2,
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
                                      SizedBox.shrink(),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CommonTextWidget.PoppinsMedium(
                            text: "EDIT",
                            color: redCA0,
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(() => SeatsMealsAddOneTabScreen());
                            Get.to(() => SelectPaymentMethodScreen());
                          },
                          child: CommonTextWidget.PoppinsMedium(
                            text: "CONFIRM",
                            color: redCA0,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
