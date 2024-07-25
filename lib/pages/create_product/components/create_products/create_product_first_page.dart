import 'package:ali_pasha_graph/pages/create_product/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:select2dot1/select2dot1.dart';

import '../../../../components/fields_components/choose_multi_images.dart';
import '../../../../components/fields_components/choose_single_imag.dart';
import '../../../../components/fields_components/input_component.dart';
import '../../../../components/fields_components/select2_component.dart';
import '../../../../components/fields_components/text_area_component.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/style.dart';

class CreateProductFirstPage extends StatelessWidget {
  CreateProductFirstPage({super.key,
    required this.nextPage,
    required this.someImage,
    required this.saveToDraft,
    required this.errorEndDate,
    required this.mainImage,
    required this.formState,
    required this.infoController,
   required this.priceController,
     required this.viewImage});

  final TextEditingController infoController;
  final TextEditingController priceController;
  final Function(XFile? file) mainImage;
  final Function(List<XFile?>? files) someImage;
  final RxnString errorEndDate;
  final Future<void> Function() saveToDraft;
  final Function() nextPage;
  final CreateProductLogic logic = Get.find<CreateProductLogic>();
  final GlobalKey<FormState> formState;
  Widget viewImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAreaComponent(
          width: 1.sw,
          hint: 'الوصف',
          controller: infoController,
        ),
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChooseSingleImage(
              viewImage: viewImage,
              width: 0.4.sw,
              onFileChanged: (XFile? file) {
                if (file != null) {
                  mainImage(file);
                } else {
                  mainImage(null);
                }
              },
            ),
            ChooseMultiImages(
                width: 0.5.sw,
                onFileChanged: (List<XFile?> files) {
                  someImage(files);
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputComponent(
              width: 0.45.sw,
              controller: priceController,
              hint: 'ادخل السعر بالدولار',
              isRequired: true,
              textInputType: TextInputType.number,
              validation: (txt) {
                if (txt?.length == 0) {
                  return "الحقل مطلوب";
                }
                return null;
              },
            ),
            Column(
              children: [
                Obx(() {
                  return Select2Component(
                    label: 'يختفي  بعد',
                    width: 0.45.sw,
                  selectDataController: logic.periodController.value,
                    onChanged: (values) {
                      logic.periodProduct(int.tryParse("${values.first}"));
                    },
                  );
                }),
                Obx(() =>
                    Visibility(
                      child: Text(
                        '${errorEndDate.value}',
                        style: H4RedTextStyle,
                      ),
                      visible: errorEndDate.value != null,
                    )),
              ],
            )
          ],
        ),
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.02.sw),
                color: GrayDarkColor,
              ),
              width: 0.45.sw,
              height: 0.05.sh,
              child: MaterialButton(
                  onPressed: () {
                    saveToDraft();
                  },
                  child: Text(
                    'إكمال لاحقاً',
                    style: H4WhiteTextStyle,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.02.sw),
                color: RedColor,
              ),
              width: 0.45.sw,
              height: 0.05.sh,
              child: MaterialButton(
                  onPressed: () {
                    errorEndDate('');
                    print(logic.periodProduct.value);
                    if (logic.periodProduct.value==null) {
                      errorEndDate('يرجى تحديد مدة المنشور');

                      return;
                    }
                    formState.currentState?.validate();
                    nextPage();
                  },
                  child: Text(
                    'التالي',
                    style: H4WhiteTextStyle,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
