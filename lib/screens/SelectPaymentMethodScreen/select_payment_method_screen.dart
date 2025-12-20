import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/font_family.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/SelectPaymentMethodScreen/fare_breakUp_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  SelectPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightDetailController>(
        builder: (controller) {
    return Scaffold(
      backgroundColor: redF9E.withValues(alpha: 0.75),
      appBar: AppBar(
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Select Payment Mode",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    color: white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          CommonTextWidget.PoppinsSemiBold(
                            text: "${SharedPrefUtil.flightOffer!.slices![0].origin!
                                .cityName} - ${SharedPrefUtil.flightOffer!.slices![0].destination!
                                .cityName}",
                            color: black2E2,
                            fontSize: 14,
                          ),
                          CommonTextWidget.PoppinsRegular(
                            text: "Departure ${formatToDayDateMonth( SharedPrefUtil.flightOffer!
                                .slices![0]
                                .segments![0]
                                .departingAt!,)} ",
                            color: grey717,
                            fontSize: 12,
                          ),
                          SizedBox(height: 8),
                          ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: controller.travellers.length,
    itemBuilder: (context, index) {
    final traveller = controller.travellers[index];
    return
                          CommonTextWidget.PoppinsMedium(
                            text: "1) ${traveller.firstName} ${traveller.lastName}",
                            color: black2E2,
                            fontSize: 12,
                          );}),
                          SizedBox(height: 8),
                          Divider(color: greyE8E, thickness: 1),
                          SizedBox(height: 10),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading:
                            SvgPicture.network(
                              SharedPrefUtil.flightOffer!.owner!.logoSymbolUrl ?? '',
                              // height: 30,
                              width: 30,
                            ),
                            title: CommonTextWidget.PoppinsMedium(
                              text: "${SharedPrefUtil.flightOffer!.slices![0].origin!
                                  .iataCityCode} - ${SharedPrefUtil.flightOffer!.slices![0].destination!
                                  .iataCityCode}",
                              color: black2E2,
                              fontSize: 14,
                            ),
                            subtitle: CommonTextWidget.PoppinsRegular(
                              text: "${formatToDayDateMonth( SharedPrefUtil.flightOffer!
                                  .slices![0]
                                  .segments![0]
                                  .arrivingAt!)} | ${parseDateTimeToTime(SharedPrefUtil.flightOffer!
                                  .slices![0]
                                  .segments![0]
                                  .arrivingAt!)} - ${parseDateTimeToTime(SharedPrefUtil.flightOffer!
                                  .slices![0]
                                  .segments![0]
                                  .departingAt!)}",
                              color: black2E2,
                              fontSize: 14,
                            ),
                            trailing: CommonTextWidget.PoppinsRegular(
                              text: stops(SharedPrefUtil.flightOffer!.slices![0]
                                  .segments!.length),
                              color: grey717,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget.PoppinsSemiBold(
                          text: "Other pay options",
                          color: black2E2,
                          fontSize: 16,
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: white,
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: Lists.selectPaymentMethodList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Column(
                              children: [
                                ListTile(
                                  onTap: Lists.selectPaymentMethodList[index]
                                      ["onTap"],
                                  horizontalTitleGap: -2,
                                  leading: Image.asset(
                                      Lists.selectPaymentMethodList[index]
                                          ["image"],
                                      height: 25,
                                      width: 25),
                                  title: CommonTextWidget.PoppinsMedium(
                                    text: Lists.selectPaymentMethodList[index]
                                        ["text1"],
                                    color: black2E2,
                                    fontSize: 14,
                                  ),
                                  subtitle: CommonTextWidget.PoppinsRegular(
                                    text: Lists.selectPaymentMethodList[index]
                                        ["text2"],
                                    color: black2E2,
                                    fontSize: 12,
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios,
                                      color: redCA0),
                                ),
                                index == 3
                                    ? SizedBox.shrink()
                                    : Divider(color: greyE8E, thickness: 1),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        text:
                            "By continuing to pay, I understand and agree with the ",
                        style: TextStyle(
                          fontFamily: FontFamily.PoppinsRegular,
                          fontSize: 12,
                          color: black2E2,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Privacy Policy, ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: FontFamily.PoppinsRegular,
                                color: redCA0),
                          ),
                          TextSpan(
                            text: "the ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: FontFamily.PoppinsRegular,
                                color: black2E2),
                          ),
                          TextSpan(
                            text: "User Agreement ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: FontFamily.PoppinsRegular,
                                color: redCA0),
                          ),
                          TextSpan(
                            text: "and ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: FontFamily.PoppinsRegular,
                                color: black2E2),
                          ),
                          TextSpan(
                            text: "Terms of Service ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: FontFamily.PoppinsRegular,
                                color: redCA0),
                          ),
                          TextSpan(
                            text: "of Hybrid Travel Agency. ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: FontFamily.PoppinsRegular,
                                color: black2E2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: Get.width,
                color: black2E2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.totalAmount}",
                              style: TextStyle(
                                fontFamily: FontFamily.PoppinsSemiBold,
                                fontSize: 16,
                                color: white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Due now ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: FontFamily.PoppinsMedium,
                                      color: grey8E8),
                                ),
                              ],
                            ),
                          ),
                          CommonTextWidget.PoppinsMedium(
                            text: "Convenience Fee added",
                            color: grey8E8,
                            fontSize: 10,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            FareBreakUpScreen(),
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                          );
                        },
                        child: SvgPicture.asset(info),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );});
  }
}
