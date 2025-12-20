import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class AddDocumentScreen extends StatelessWidget {
  AddDocumentScreen({super.key});

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
          text: "Add Documents",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Image.asset(addDocumentImage, width: Get.width),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CommonButtonWidget.button(
              buttonColor: primary,
              onTap: () {
                Get.to(() => AddDocumentScreen());
              },
              text: "SUBMIT APPLICATION",
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
