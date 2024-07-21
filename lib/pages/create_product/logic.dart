import 'package:ali_pasha_graph/Global/main_controller.dart';
import 'package:ali_pasha_graph/models/attribute_model.dart';
import 'package:ali_pasha_graph/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:select2dot1/select2dot1.dart';
import 'package:dio/dio.dart' as dio;

class CreateProductLogic extends GetxController {
  final MainController mainController = Get.find<MainController>();
  RxnString errorEndDate = RxnString(null);
  GetStorage box = GetStorage('ali-pasha');

  // global
  RxList<CategoryModel> categories = RxList<CategoryModel>([]);
  RxList<SingleItemCategoryModel> listSingleCategoryPeriod =
      RxList<SingleItemCategoryModel>([]);
  RxInt page = RxInt(1);

  // formData
  //product
  RxString typePost = RxString('product');
  Rxn<XFile?> mainImage = Rxn<XFile?>();
  RxList<XFile?> images = RxList<XFile?>();
  TextEditingController infoProduct = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  RxnInt periodProduct = RxnInt(null);
  RxnInt mainCategory = RxnInt(null);
  RxnInt subCategory = RxnInt(null);
  RxnInt sub2Category = RxnInt(null);
  RxnInt sub3Category = RxnInt(null);
  RxList<int?> limitAttributeSelected = RxList<int?>([]);

  // controllers for select2
  Rx<SelectDataController> periodController =
      Rx<SelectDataController>(SelectDataController(
    data: [],
    isMultiSelect: false,
  ));
  Rx<SelectDataController> categoryController =
      Rx<SelectDataController>(SelectDataController(
    data: [],
    isMultiSelect: false,
  ));
  Rx<SelectDataController> subCategoryController =
      Rx<SelectDataController>(SelectDataController(
    data: [],
    isMultiSelect: false,
  ));

  Rx<SelectDataController> sub2CategoryController =
      Rx<SelectDataController>(SelectDataController(
    data: [],
    isMultiSelect: false,
  ));

  Rx<SelectDataController> sub3CategoryController =
      Rx<SelectDataController>(SelectDataController(
    data: [],
    isMultiSelect: false,
  ));
  RxList<SelectDataController> limitAttributesController =RxList<SelectDataController>([]);
  final List<Map<String, dynamic>> periodProductList = [
    {"name": "7 أيام", "value": 7},
    {"name": "15 يوم", "value": 15},
    {"name": "شهر واحد", "value": 30},
    {"name": "شهرين", "value": 60},
    {"name": "3 أشهر", "value": 90},
  ];
  RxList<AttributeModel> attributesLimit = RxList<AttributeModel>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fillPeriodController();

    fillDataFromDraft();
    ever(typePost, (value) {
      clearMainCategorySelected();

      page(1);
      List<SingleItemCategoryModel> list = [];
      for (var item in categories.where((el) => el.type == value).toList()) {
        list.add(SingleItemCategoryModel(
            nameSingleItem: item.name!, value: item.id));
      }
      categoryController.value = SelectDataController(
          data: [SingleCategoryModel(singleItemCategoryList: list)],
          isMultiSelect: false);
    });

    // listen category
    ever(mainCategory, (value) {
      clearSubCategorySelected();
      clearSub2CategorySelected();
      clearSub3CategorySelected();
      CategoryModel? selectedCategory =
          categories.where((el) => el.id == value).firstOrNull;
      if (selectedCategory != null && selectedCategory.children != null) {
        List<SingleItemCategoryModel> list = [];
        for (var item in selectedCategory.children!.toList()) {
          list.add(SingleItemCategoryModel(
              nameSingleItem: item.name!, value: item.id));
        }
        subCategoryController.value = SelectDataController(
            data: [SingleCategoryModel(singleItemCategoryList: list)],
            isMultiSelect: false);
      }
    });

    // listen subCategory
    ever(subCategory, (value) {
      if (subCategory.value != null) {
        getLimitAttributes();
      }
      clearSub2CategorySelected();
      clearSub3CategorySelected();
      CategoryModel? selectedMainCategory =
          categories.where((el) => el.id == mainCategory.value).firstOrNull;
      CategoryModel? selectedCategory = selectedMainCategory?.children!
          .where((el) => el.id == subCategory.value)
          .firstOrNull;
      if (selectedCategory != null && selectedCategory.children != null) {
        List<SingleItemCategoryModel> list = [];
        for (var item in selectedCategory.children!.toList()) {
          list.add(SingleItemCategoryModel(
              nameSingleItem: item.name!, value: item.id));
        }
        sub2CategoryController.value = SelectDataController(
            data: [SingleCategoryModel(singleItemCategoryList: list)],
            isMultiSelect: false);
      }
    });

    //  listen sub2Category
    ever(sub2Category, (value) {
      clearSub3CategorySelected();
      CategoryModel? selectedMainCategory =
          categories.where((el) => el.id == mainCategory.value).firstOrNull;
      CategoryModel? selectedSubCategory = selectedMainCategory?.children!
          .where((el) => el.id == subCategory.value)
          .firstOrNull;
      CategoryModel? selectedCategory = selectedSubCategory?.children!
          .where((el) => el.id == sub2Category.value)
          .firstOrNull;
      if (selectedCategory != null && selectedCategory.children != null) {
        List<SingleItemCategoryModel> list = [];
        for (var item in selectedCategory.children!.toList()) {
          list.add(SingleItemCategoryModel(
              nameSingleItem: item.name!, value: item.id));
        }
        sub3CategoryController.value = SelectDataController(
            data: [SingleCategoryModel(singleItemCategoryList: list)],
            isMultiSelect: false);
      }
    });

    // listen Limit Attributes
   /* ever(attributesLimit, (value) {
      limitAttributeSelected.clear();
      if (value.isNotEmpty) {
        List<SingleCategoryModel> categoriesAttributes = [];

        for (var item in attributesLimit) {
          List<SingleItemCategoryModel> list = [];
          for (var single in item.attributes!) {
            list.add(SingleItemCategoryModel(
                nameSingleItem: single.name!, value: single.id!));
          }
          categoriesAttributes.add(SingleCategoryModel(
              singleItemCategoryList: list, nameCategory: item.name));
        }
        limitAttributesController.value =
            SelectDataController(data: categoriesAttributes,isMultiSelect: false);
      } else {
        limitAttributesController.value =
            SelectDataController(data: [], isMultiSelect: false);
      }
    });*/
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getDataForCreate();
  }

  fillDataFromDraft() {
    var data = box.read<Map<String, dynamic>>('draft');

    for (var item in periodProductList) {
      listSingleCategoryPeriod.add(SingleItemCategoryModel(
          nameSingleItem: item['name'], value: item['value']));
    }

    if (data != null) {
      infoProduct = TextEditingController(text: data['info']);
      priceProduct = TextEditingController(text: data['price']);

      if (data['mainImage'] != null) {
        mainImage(XFile(data['mainImage']));
      }
    }
  }

  Future<void> getDataForCreate() async {
    mainController.query.value = r'''
query Categories {
    categories {
        id
        name
         type
        children {
            id
            name
            children {
                id
                name
                children {
                    id
                    name
                }
            }
        }
       
    }
}

''';
    dio.Response? res = await mainController.fetchData();

    if (res?.data != null && res?.data['data'] != null) {
      for (var item in res?.data['data']['categories']) {
        categories.add(CategoryModel.fromJson(item));
      }
      fillCategory();
    }
  }

  Future<void> saveToDraft() async {
    var data = {
      'type': typePost.value,
      'info': infoProduct.text,
      'price': priceProduct.text,
      'selectedEndDate': periodProduct.value,
      'mainImage': mainImage.value?.path
    };
    await box.write('draft', data);
  }

  fillPeriodController() {
    var data = box.read<Map<String, dynamic>>('draft');
    List<SingleItemCategoryModel> list = [];
    for (var item in periodProductList) {
      list.add(SingleItemCategoryModel(
          nameSingleItem: item['name'], value: item['value']));
    }
    periodController.value = SelectDataController(
        data: [SingleCategoryModel(singleItemCategoryList: list.toList())],
        isMultiSelect: false);
    if (data?['selectedEndDate'] != null) {
      var selectedPeriod = periodProductList
          .where((el) => el['value'] == data?['selectedEndDate'])
          .toList()
          .first;
      periodController.value.setSingleSelect(SingleItemCategoryModel(
          nameSingleItem: selectedPeriod['name'],
          value: selectedPeriod['value']));
      periodProduct(int.tryParse("${selectedPeriod['value']}"));
    }
  }

  fillCategory() {
    List<SingleItemCategoryModel> list = [];
    for (var item
        in categories.where((el) => el.type == typePost.value).toList()) {
      list.add(
          SingleItemCategoryModel(nameSingleItem: item.name!, value: item.id!));
    }
    categoryController.value = SelectDataController(
        data: [SingleCategoryModel(singleItemCategoryList: list)],
        isMultiSelect: false);
  }

  clearMainCategorySelected() {
    mainCategory.value = null;
    categoryController.value.setSingleSelect(null);
  }

  clearSubCategorySelected() {
    subCategory.value = null;
    subCategoryController.value = SelectDataController(
        data: <SingleCategoryModel>[], isMultiSelect: false);
    subCategoryController.value.setSingleSelect(null);
  }

  clearSub2CategorySelected() {
    sub2Category.value = null;
    sub2CategoryController.value = SelectDataController(
        data: <SingleCategoryModel>[], isMultiSelect: false);
    sub2CategoryController.value.setSingleSelect(null);
  }

  clearSub3CategorySelected() {
    sub3Category.value = null;
    sub3CategoryController.value = SelectDataController(
        data: <SingleCategoryModel>[], isMultiSelect: false);
    sub3CategoryController.value.setSingleSelect(null);
  }

// get Limit attribute when change subCategory
  getLimitAttributes() async {
    mainController.query.value = '''
    query Attributes {
    attributes(category_id: ${subCategory.value}) {
        id
        name
        attributes {
            id
            name
        }
    }
}
    ''';
    attributesLimit.clear();
    dio.Response? res = await mainController.fetchData();
    print("RES");
    print(res?.data);
    if (res?.data?['data'] != null) {
      for (var item in res?.data['data']?['attributes']) {
        attributesLimit.add(AttributeModel.fromJson(item));
      }
    }
  }
}
