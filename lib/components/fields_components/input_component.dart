import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InputComponent extends StatelessWidget {
  InputComponent({
    super.key,
    required this.width,
    this.controller,
    this.textInputType,
    this.hint,
    this.isRequired = false,
    this.validation,
    this.onEditingComplete,
    this.height,
    this.fill,
    this.onChanged,
  });

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hint;
  final double width;
  final double? height;
  final bool isRequired;
  final Color? fill;

  final String? Function(String?)? validation;
  final String? Function()? onEditingComplete;
  final String? Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 0.08.sh,
      child: TextFormField(
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        controller: controller,
        validator: validation,
        style: H3BlackTextStyle,
        keyboardType: textInputType,
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(children: [
              TextSpan(text: "${hint ?? ''}", style: H3GrayTextStyle),
              if (isRequired) TextSpan(text: "*", style: H4RedTextStyle),
            ]),
          ),
          errorStyle: H4RedTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: GrayDarkColor,
            ),
          ),
          contentPadding: EdgeInsets.all(20.h),
          filled: true,
          fillColor: fill,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: GrayDarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
