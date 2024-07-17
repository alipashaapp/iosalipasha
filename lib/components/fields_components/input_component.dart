import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InputComponent extends StatelessWidget {
  InputComponent(
      {super.key,
      required this.width,
      this.controller,
      this.textInputType,
      this.hint,
      this.isRequired = false,
      this.validation});

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hint;
  final double width;
  final bool isRequired;

  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: TextFormField(
        controller: controller,
        validator: validation,
        style: InputTextStyle,
        keyboardType: textInputType,
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(children: [
              TextSpan(text: "${hint ?? ''}", style: HintTextStyle),
              if (isRequired) TextSpan(text: "*", style: RequiredTextStyle),
            ]),
          ),
          errorStyle: RequiredTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.03.sw),
            borderSide: BorderSide(
              color: GrayDarkColor,
            ),
          ),
          contentPadding: EdgeInsets.all(20.h),
          filled: true,
          fillColor: GrayLightColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.03.sw),
            borderSide: BorderSide(
              color: GrayDarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
