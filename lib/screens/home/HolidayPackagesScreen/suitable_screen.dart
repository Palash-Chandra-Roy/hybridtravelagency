import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/suitable_for_controller.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';

class SuitableScreen extends StatelessWidget {
  SuitableScreen({super.key});

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
          text: "Suitable For",
          color: white,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 24),
            child: CommonTextWidget.PoppinsMedium(
              text: "CLEAR ALL",
              color: white,
              fontSize: 12,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CommonTextWidget.PoppinsMedium(
              text: "Suitable For",
              color: black2E2,
              fontSize: 14,
            ),
          ),
          GetBuilder<SuitableForController>(
            init: SuitableForController(),
            builder: (controller) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio:
                    MediaQuery.of(context).size.aspectRatio * 2 / 0.6,
              ),
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 15, left: 24, right: 75, bottom: 5),
              itemCount: Lists.suitableForList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.onIndexChange(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: grey515.withValues(alpha: 0.25),
                          offset: Offset(0, 1),
                          blurRadius: 6,
                        ),
                      ],
                      border: Border.all(
                          color:
                              controller.selectedIndex == index ? redCA0 : white),
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextWidget.PoppinsRegular(
                          text: Lists.suitableForList[index]["text1"],
                          color: controller.selectedIndex == index
                              ? redCA0
                              : black2E2,
                          fontSize: 12,
                        ),
                        CommonTextWidget.PoppinsRegular(
                          text: Lists.suitableForList[index]["text2"],
                          color: controller.selectedIndex == index
                              ? redCA0
                              : grey717,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CommonButtonWidget.button(
              buttonColor: primary,
              onTap: () {},
              text: "APPLY",
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
