import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:select2dot1/select2dot1.dart';

class CreateProductLogic extends GetxController {
  RxString typePost = RxString('product');
  TextEditingController infoProduct = TextEditingController();
  QuillEditorController editorController = QuillEditorController();
  SelectDataController cityController = SelectDataController(data: [],isMultiSelect: false,);
  Rxn<XFile?> mainImage = Rxn<XFile?>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cityController.data.add(SingleCategoryModel(singleItemCategoryList: [
      SingleItemCategoryModel(nameSingleItem: "عدنان", value: 1),
      SingleItemCategoryModel(nameSingleItem: "علي", value: 2)
    ]));

  }
}
