import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';

class TrainAndBusModifySearchScreen extends StatelessWidget {
  TrainAndBusModifySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.close, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Modify Search",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: Lists.trainAndBusFromToList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: InkWell(
                      onTap: Lists.trainAndBusFromToList[index]["onTap"],
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: grey9B9.withValues(alpha: 0.15),
                          border: Border.all(color: greyE2E, width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(trainAndBusFromToIcon),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextWidget.PoppinsMedium(
                                    text: Lists.trainAndBusFromToList[index]
                                        ["text1"],
                                    color: grey888,
                                    fontSize: 14,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CommonTextWidget.PoppinsSemiBold(
                                        text: Lists.trainAndBusFromToList[index]
                                            ["text2"],
                                        color: black2E2,
                                        fontSize: 16,
                                      ),
                                      SizedBox(width: 5),
                                      CommonTextWidget.PoppinsRegular(
                                        text: Lists.trainAndBusFromToList[index]
                                            ["text3"],
                                        color: grey888,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: grey9B9.withValues(alpha: 0.15),
                    border: Border.all(color: greyE2E, width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(calendarPlus),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextWidget.PoppinsMedium(
                                    text: "DATE",
                                    color: grey888,
                                    fontSize: 14,
                                  ),
                                  CommonTextWidget.PoppinsSemiBold(
                                    text: "03 Oct",
                                    color: black2E2,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 30,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: redFAE.withValues(alpha: 0.8),
                                    border: Border.all(color: redCA0, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: CommonTextWidget.PoppinsMedium(
                                      text: "Tomorrow",
                                      color: redCA0,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Container(
                                  height: 30,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey515.withValues(alpha: 0.25),
                                        blurRadius: 6,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: CommonTextWidget.PoppinsMedium(
                                      text: "Day After",
                                      color: redCA0,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 32,
            top: 75,
            child: InkWell(
              onTap: () {
                // Get.to(() => SortAndFilterScreen());
              },
              child: Container(
                height: 45,
                width: 33,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: greyE2E,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(arrowsDownUp),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 60,
            child: CommonButtonWidget.button(
              onTap: (){},
              buttonColor: primary,
              text: "MODIFY SEARCH",
            ),
          ),
        ],
      ),
    );
  }
}
