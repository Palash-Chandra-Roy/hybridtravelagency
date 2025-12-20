import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class CommonButtonWidget {
  static dynamic button({dynamic onTap, text, buttonColor, isLoading=false, width}) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      minWidth: width??Get.width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: buttonColor,
      child:
      isLoading?SpinKitThreeBounce(
        color: white,
        size: 20,
      ):
      CommonTextWidget.PoppinsSemiBold(
        fontSize: 16,
        text: text,
        color: white,
      ),
    );
  }
}
