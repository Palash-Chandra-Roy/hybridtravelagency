import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_controller.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';

class TravellersAndClassScreen extends StatelessWidget {
  TravellersAndClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightSearchController>(builder: (controller) {
      return Container(
        height: 503,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 65,
                width: Get.width,
                decoration: BoxDecoration(
                  color: redCA0,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.close, color: white, size: 20),
                      ),
                      CommonTextWidget.PoppinsMedium(
                        text: "Travellers and Class",
                        color: white,
                        fontSize: 18,
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 89,
              //   width: Get.width,
              //   color: redF9E.withValues(alpha: 0.75),
              //   child: ListTile(
              //     contentPadding:
              //         EdgeInsets.only(top: 15, left: 24, right: 24, bottom: 15),
              //     leading: Image.asset(manager, height: 35, width: 35),
              //     title: CommonTextWidget.PoppinsSemiBold(
              //       text: "Group booking made easy!",
              //       color: black2E2,
              //       fontSize: 15,
              //     ),
              //     subtitle: CommonTextWidget.PoppinsRegular(
              //       text:
              //           "Save More! Get excting group booking deals for 5+ rooms.",
              //       color: grey717,
              //       fontSize: 12,
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),

              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: "Select Class",
                            color: black2E2,
                            fontSize: 14,
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white, // white background
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.25),
                                  blurRadius: 6,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: controller.selectedCabinClass,
                                  icon: SvgPicture.asset(arrowDownIcon),
                                  dropdownColor: Colors.white,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    color: Color(0xFF2E2E2E),
                                  ),
                                  hint: const Text("Select Class"),
                                  items:
                                      controller.classList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    controller.updateSelectedClass(newValue);
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Lists.travellersAndClassList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 24, right: 24, top: 0),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget.PoppinsMedium(
                                  text: Lists.travellersAndClassList[index]
                                      ["text1"],
                                  color: black2E2,
                                  fontSize: 14,
                                ),
                                CommonTextWidget.PoppinsRegular(
                                  text: Lists.travellersAndClassList[index]
                                      ["text2"],
                                  color: grey717,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(5),
                            //     color: white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: grey515.withValues(alpha: 0.25),
                            //         blurRadius: 6,
                            //         offset: Offset(0, 1),
                            //       ),
                            //     ],
                            //   ),
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 15, vertical: 7),
                            //     child: Row(
                            //       children: [
                            //         CommonTextWidget.PoppinsSemiBold(
                            //           text: Lists.roomsAndGuestsList[index]
                            //               ["text3"],
                            //           color: black2E2,
                            //           fontSize: 17,
                            //         ),
                            //         SizedBox(width: 30),
                            //         SvgPicture.asset(arrowDownIcon),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white, // white background
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.25),
                                    blurRadius: 6,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    isExpanded: true,
                                    value: index == 0
                                        ? controller.selectedAdults
                                        : controller.selectedChildren,
                                    icon: SvgPicture.asset(arrowDownIcon),
                                    dropdownColor: Colors.white,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color(0xFF2E2E2E), // black2E2
                                    ),
                                    items: controller.options.map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (int? value) {
                                      if (value != null) {
                                        switch (index) {
                                          case 0:
                                            controller.setAdults(value);
                                            break;
                                          case 1:
                                            controller.setChildren(value);
                                            break;
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: CommonButtonWidget.button(
                        text: "DONE",
                        onTap: () {
                          Get.back();
                        },
                        buttonColor: primary,
                      ),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
