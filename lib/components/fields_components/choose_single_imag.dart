import 'dart:io';

import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChooseSingleImage extends StatelessWidget {
  ChooseSingleImage({super.key, this.width, required this.onFileChanged});

  final double? width;
  Rxn<XFile?> file = Rxn<XFile?>(null);
  final void Function(XFile?) onFileChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.01.sh),
      width: width,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _pickImage(imagSource: ImageSource.camera);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 0.003.sh,
                horizontal: 0.018.sw,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(0.016.sw),
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.image,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'الصورة الرئيسية',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            return Container(
              width: 0.2.sw,
              height: 0.2.sw,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                image: file.value != null
                    ? DecorationImage(
                        image: FileImage(File(file.value!.path)),
                        fit: BoxFit.cover, // تحديد التكبير والتصغير
                      )
                    : DecorationImage(
                        image: AssetImage('assets/images/png/user.png'),
                      ),
              ),
              child: file.value != null? IconButton(
                onPressed: () {
                  _clear();
                },
                icon: Icon(
                  FontAwesomeIcons.remove,
                  size: 20,
                  color: RedColor,
                ),
              ):null,
            );
          })
        ],
      ),
    );
  }

  Future<void> _pickImage({required ImageSource imagSource}) async {
    file(null);
    XFile? selected = await ImagePicker().pickImage(source: imagSource);
    if (selected != null) {
      file(selected);
      await _cropImage();
    }
  }

  Future<void> _cropImage() async {
    try {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: file.value!.path,
        maxWidth: 300,
        maxHeight: 300,
        compressQuality: 80,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'قص الصورة',
            cropStyle: CropStyle.rectangle,
            activeControlsWidgetColor: Colors.red,
            backgroundColor: Colors.grey.withOpacity(0.4),
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          ),
        ],
      );
      if (cropped != null) {
        file(XFile(cropped.path));
        onFileChanged(file.value!);
      }
    } catch (e) {
      // Handle the error appropriately
      print('Error cropping image: $e');
      Get.snackbar('Error', 'Failed to crop image');
    }
  }

  void _clear() {
    file(null);
    onFileChanged(null);
  }
}
