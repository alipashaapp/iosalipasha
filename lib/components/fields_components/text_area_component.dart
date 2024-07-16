import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAreaComponent extends StatelessWidget {
  const TextAreaComponent({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        minLines: 7,
        maxLines: 10,
        style: InputTextStyle,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'اكتب الوصف هنا',
          hintStyle: HintTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.03.sw),
            borderSide: BorderSide(
              color: GrayDarkColor,
            ),
          ),
          isCollapsed: true,
          contentPadding: EdgeInsets.all(20.h),
          filled: true,
          fillColor: GrayLightColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.03.sw),
            borderSide: BorderSide(
              color: GrayDarkColor,
            ),
          ),),
      ),
    );
  }
}
