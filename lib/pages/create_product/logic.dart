import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductLogic extends GetxController {
  RxString typePost = RxString('product');
  TextEditingController infoProduct = TextEditingController();
  XFile? mainImage;
}
