import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';

class MyWishListScreen extends StatelessWidget {
  MyWishListScreen({super.key});

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
          text: "My Wishlist",
          color: white,
          fontSize: 18,
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
          shrinkWrap: true,
          itemCount: Lists.wishListList.length,
          itemBuilder: (context, index) {
            return Image.asset(
              Lists.wishListList[index],
              width: 327,
            );
          }),
    );
  }
}
