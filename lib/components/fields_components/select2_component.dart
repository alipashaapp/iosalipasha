import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:select2dot1/select2dot1.dart';

class Select2Component extends StatelessWidget {
  Select2Component({
    super.key,
    this.isSearch = true,
    required this.label,
    required this.width,
    required this.onChanged,
    required this.selectDataController,
  });

  final double width;
  final String label;
  final bool isSearch;
  final SelectDataController selectDataController;
  final Function(List<dynamic> selected) onChanged;
  //final List<SingleItemCategoryModel>? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.002.sh),
      width: width,
      child: Select2dot1(
        onChanged: (List<SingleItemCategoryModel> models) {
          onChanged(models.map((el) => el.value).toList());
        },
        selectSingleSettings: SelectSingleSettings(textStyle: HintTextStyle),
        isSearchable: isSearch,
        selectDataController: selectDataController,
        dropdownOverlaySettings:
            DropdownOverlaySettings(sizeAnimationCurve: Curves.bounceIn),
        dropdownModalSettings:
            DropdownModalSettings(barrierColor: GrayDarkColor),
        globalSettings: GlobalSettings(mainColor: GrayDarkColor),
        //pillboxTitleSettings: PillboxTitleSettings(title: 'المدينة',titleStyleDefault: HintTextStyle),
        pillboxContentMultiSettings:
            PillboxContentMultiSettings(pillboxLayout: PillboxLayout.wrap),
        selectEmptyInfoSettings:
            SelectEmptyInfoSettings(text: label, textStyle: HintTextStyle),
        categoryItemOverlaySettings: CategoryItemOverlaySettings(
            defaultTextStyle: HintTextStyle,
            selectedTextStyle: HintTextStyle,
            extraInfoTextStyle: HintTextStyle),
        categoryNameModalSettings: CategoryNameModalSettings(
          textStyle: CategoryItemTextStyle,alignmentGeometry: Alignment.centerRight
        ),
        searchBarModalSettings: SearchBarModalSettings(heightReplacement: 45),
        doneButtonModalSettings:
            DoneButtonModalSettings(title: 'تم', textStyle: TabActiveTextStyle),
        categoryItemModalSettings: CategoryItemModalSettings(
          defaultTextStyle: HintTextStyle,
          textOverflow: TextOverflow.ellipsis,
          selectedTextStyle: RequiredTextStyle,
          extraInfoTextStyle: HintTextStyle,
          margin: EdgeInsets.symmetric(vertical: 0.001.sh),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.006.sw),
          ),
        ),
      ),
    );
  }
}
