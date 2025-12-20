import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class OfferDetailScreen extends StatelessWidget {
  OfferDetailScreen({super.key});

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
          child: Icon(Icons.arrow_back, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Offers",
          color: white,
          fontSize: 18,
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(offerDetailImage1, height: 175, width: Get.width),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: CommonTextWidget.PoppinsRegular(
                  text: "Book Simply delightful stays now for your next "
                      "vacation. choose from 100+ Radisson Hotel "
                      "across 60+ cities in India with:",
                  color: black2E2,
                  fontSize: 14,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(offerDetailImage2,
                    height: 290, width: Get.width),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CommonButtonWidget.button(
                  buttonColor: primary,
                  onTap: () {},
                  text: "BOOK NOW",
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
