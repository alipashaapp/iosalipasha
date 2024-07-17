import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:select2dot1/select2dot1.dart';

class Select2Component extends StatelessWidget {
  Select2Component(
      {super.key, required this.width, required this.selectDataController});

  final double width;
  final SelectDataController selectDataController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.002.sh),
      width: width,
      child: Select2dot1(
        selectDataController: selectDataController,
        dropdownOverlaySettings: DropdownOverlaySettings(sizeAnimationCurve: Curves.bounceIn),
        dropdownModalSettings: DropdownModalSettings(barrierColor: GrayDarkColor),
        globalSettings: GlobalSettings(mainColor: GrayDarkColor),
        pillboxTitleSettings: PillboxTitleSettings(title: 'المدينة',titleStyleDefault: HintTextStyle),
        pillboxContentMultiSettings: PillboxContentMultiSettings(pillboxLayout: PillboxLayout.wrap),
        categoryItemOverlaySettings: CategoryItemOverlaySettings(defaultTextStyle: HintTextStyle,selectedTextStyle: HintTextStyle,extraInfoTextStyle: HintTextStyle),
        categoryNameModalSettings: CategoryNameModalSettings(textStyle: HintTextStyle,),
        searchBarModalSettings: SearchBarModalSettings(heightReplacement: 45),
        doneButtonModalSettings: DoneButtonModalSettings(title: 'تم',textStyle: TabActiveTextStyle),
        categoryItemModalSettings: CategoryItemModalSettings(
          defaultTextStyle: HintTextStyle,
          textOverflow: TextOverflow.ellipsis,
          selectedTextStyle: RequiredTextStyle,
          extraInfoTextStyle: HintTextStyle,
          margin: EdgeInsets.symmetric(vertical: 0.001.sh),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.003.sw),
          ),
        ),
      ),
    );
  }
}
