import 'package:flutter/material.dart';

const Color RedColor = Color.fromRGBO(226, 6, 19, 1);
const Color PrimaryColor = Colors.red;
const Color SecondaryColor = Colors.green;
const Color WhiteColor = Color.fromRGBO(255, 255, 255, 1);
const Color ScafoldColor = Color.fromRGBO(229, 229, 229, 1);
const Color GrayLightColor = Color.fromRGBO(229, 229, 229, 1);
const Color GrayDarkColor = Color.fromRGBO(178, 178, 178, 1);
const Color TitleColor = Color.fromRGBO(84, 84, 84, 1);
const Color SubTitleColor = Color.fromRGBO(84, 84, 84, 0.64);
const Color DarkColor = Color.fromRGBO(37, 36, 36, 0.6);
const Color IconColor = Color.fromRGBO(77, 77, 77, 1);
const Color GoldColor = Color.fromRGBO(238, 205, 73, 1.0);
const Color OrangeColor = Color.fromRGBO(250, 173, 23, 1.0);

const ShowMoreColor = Color(0xFFFEF78A);


Color? String2Hex(String? color) {
  if(color==null){
    return Color(0xFFBBF8FF);
  }
  String? hexString = color?.replaceAll("#", ""); // إزالة علامة #
  if (hexString?.length == 6) {
    hexString = "FF" + "${hexString}"; // إضافة قيمة ألفا إذا كانت غير موجودة
  }
  int? colorNumber=int.tryParse("${hexString}", radix: 16);
  if(colorNumber==null){
    return Color(0xFFBBF8FF);
  }
  return Color(colorNumber);
}
