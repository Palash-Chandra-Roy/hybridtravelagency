import 'package:flutter/material.dart';
import 'package:hybridtravelagency/constants/font_family.dart';

class CommonTextWidget {
  static dynamic PoppinsBold(
      {String? text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      TextDecoration? textDecoration}) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: FontFamily.PoppinsBold,
        decoration: textDecoration,
      ),
    );
  }

  static dynamic PoppinsRegular(
      {String? text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      TextDecoration? textDecoration,
      int? maxLines = 1,
      TextOverflow? overflow}) {
    return Text(
      text!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: FontFamily.PoppinsRegular,
      ),
    );
  }

  static dynamic PoppinsSemiBold(
      {String? text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      TextDecoration? textDecoration,
      int? maxLines,
      TextOverflow? overflow}) {
    return Text(
      text!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: FontFamily.PoppinsSemiBold,
      ),
    );
  }

  static dynamic PoppinsMedium(
      {String? text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      TextDecoration? textDecoration,
      int? maxLines,
      TextOverflow? overflow}) {
    return Text(
      text!,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: FontFamily.PoppinsMedium,
      ),
    );
  }

  static dynamic PoppinsLight(
      {String? text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      TextDecoration? textDecoration}) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: FontFamily.PoppinsLight,
      ),
    );
  }
}
