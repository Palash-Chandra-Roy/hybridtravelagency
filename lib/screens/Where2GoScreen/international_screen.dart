import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/screens/Where2GoScreen/international_detail_screen1.dart';
import 'package:hybridtravelagency/screens/Where2GoScreen/international_select_city_screen.dart';
import 'package:hybridtravelagency/main.dart';

class InterNationalScreen extends StatelessWidget {
  InterNationalScreen({super.key});

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
          text: "From Ahmedabad",
          color: white,
          fontSize: 18,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => InternationalSelectCityScreenScreen());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 24),
              child: Icon(CupertinoIcons.search, color: white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: Lists.internationalList.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => InterNationalDetailScreen1());
                    },
                    child: Image.asset(Lists.internationalList[index],
                        height: 310, width: Get.width),
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
