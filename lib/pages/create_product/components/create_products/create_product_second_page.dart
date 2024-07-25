import 'package:ali_pasha_graph/components/fields_components/select2_component.dart';
import 'package:ali_pasha_graph/pages/create_product/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:select2dot1/select2dot1.dart';

import '../../../../helpers/colors.dart';
import '../../../../helpers/style.dart';

class CreateProductSecondPage extends StatelessWidget {
  CreateProductSecondPage(
      {super.key,
      required this.prevPage,
      required this.width,
      required this.selectedCategory});

  final Function() prevPage;
  final Function(int value) selectedCategory;
  final double? width;
  Rx<SelectDataController> categoryController =
      Rx(SelectDataController(data: []));
  final CreateProductLogic logic = Get.find<CreateProductLogic>();

  @override
  Widget build(BuildContext context) {
    fillCategory();
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return Select2Component(
              label: 'اختر القسم الرئيسي',
              width: 1.sw,
              selectDataController: logic.categoryController.value,
              onChanged: (values) {
                print("SUB ${values}");
                logic.mainCategory.value = values.toList().firstOrNull;
              },
            );
          }),
          Obx(() {
            if (logic.subCategoryController.value.data.isNotEmpty) {
              return Visibility(
                visible: logic.subCategoryController.value.data.first
                    .singleItemCategoryList.isNotEmpty,
                child: Select2Component(
                  label: 'اختر القسم ',
                  width: 1.sw,
                  selectDataController: logic.subCategoryController.value,
                  onChanged: (values) {
                    logic.subCategory.value = values.toList().firstOrNull;
                  },
                ),
              );
            }
            return Container(
              width: 1.sw,
              height: 0.03.sh,
            );
          }),
          Obx(() {
            if (logic.sub2CategoryController.value.data.isNotEmpty) {
              return Visibility(
                visible: logic.sub2CategoryController.value.data.first
                    .singleItemCategoryList.isNotEmpty,
                child: Select2Component(
                  label: 'اختر القسم ',
                  width: 1.sw,
                  selectDataController: logic.sub2CategoryController.value,
                  onChanged: (values) {
                    logic.sub2Category.value = values.toList().firstOrNull;
                  },
                ),
              );
            }
            return Container(
              width: 1.sw,
              height: 0.03.sh,
            );
          }),
          Obx(() {
            if (logic.sub3CategoryController.value.data.isNotEmpty) {
              return Visibility(
                visible: logic.sub3CategoryController.value.data.first
                    .singleItemCategoryList.isNotEmpty,
                child: Select2Component(
                  label: 'اختر القسم',
                  width: 1.sw,
                  selectDataController: logic.sub3CategoryController.value,
                  onChanged: (values) {
                    logic.sub3Category.value = values.toList().firstOrNull;
                  },
                ),
              );
            }
            return Container(
              width: 0.4.sw,
              height: 0.03.sh,
            );
          }),
          Obx(() {
            return Column(
              children: [
                10.verticalSpace,
                Visibility(
                  child: Text('المواصفات',style: H4BlackTextStyle,),
                  visible: logic.attributesLimit.length > 0,
                ),
                10.verticalSpace,
                ...List.generate(logic.attributesLimit.length, (index) {
                  List<SingleItemCategoryModel> list = [];
                  for (var item in logic.attributesLimit[index].attributes!) {
                    list.add(SingleItemCategoryModel(
                        nameSingleItem: "${item.name}", value: item.id!));
                  }
                  logic.limitAttributesController.add(SelectDataController(
                      data: [SingleCategoryModel(singleItemCategoryList: list)],
                      isMultiSelect: false));
                  return Container(
                    width: 1.sw,
                    margin: EdgeInsets.symmetric(vertical: 0.002.sh),
                    child: Select2Component(
                        label: "${logic.attributesLimit[index].name}",
                        width: 0.45.sw,
                        onChanged: (values) {
                          logic.limitAttributeSelected(values.cast<int?>());
                        },
                        selectDataController:
                            logic.limitAttributesController[index]),
                  );
                }),
              ],
            );
          }),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.02.sw),
              color: GrayDarkColor,
            ),
            width: 0.45.sw,
            height: 0.05.sh,
            child: MaterialButton(
                onPressed: () {
                  for (var item in logic.limitAttributesController) {
                    print(item.selectedList.first.value);
                  }
                },
                child: Text(
                  'إكمال لاحقاً',
                  style: H4WhiteTextStyle,
                )),
          ),
        ],
      ),
    );
  }

  fillCategory() {
    List<SingleItemCategoryModel> mainCategoryList = [];
    for (var item
        in logic.categories.where((el) => el.type == "product").toList()) {
      mainCategoryList.add(SingleItemCategoryModel(
          nameSingleItem: "${item.name}", value: item.id));
    }
    categoryController.value = SelectDataController(data: [
      SingleCategoryModel(singleItemCategoryList: mainCategoryList.toList()),
    ]);
    ever(logic.categories, (v) {
      List<SingleItemCategoryModel> mainCategoryList = [];
      for (var item
          in logic.categories.where((el) => el.type == "product").toList()) {
        mainCategoryList.add(SingleItemCategoryModel(
            nameSingleItem: "${item.name}", value: item.id));
      }

      categoryController.value = SelectDataController(data: [
        SingleCategoryModel(singleItemCategoryList: mainCategoryList.toList()),
      ]);
    });
  }
}
