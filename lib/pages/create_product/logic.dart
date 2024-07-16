import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CreateProductLogic extends GetxController {
  RxString typePost = RxString('product');
  TextEditingController infoProduct = TextEditingController();
  QuillEditorController editorController=QuillEditorController();
  Rxn<XFile?> mainImage=Rxn<XFile?>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
