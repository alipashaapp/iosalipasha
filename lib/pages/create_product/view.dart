import 'package:ali_pasha_graph/components/fields_components/choose_multi_images.dart';
import 'package:ali_pasha_graph/components/fields_components/choose_single_imag.dart';
import 'package:ali_pasha_graph/components/fields_components/input_component.dart';
import 'package:ali_pasha_graph/components/fields_components/rich_editor.dart';
import 'package:ali_pasha_graph/components/fields_components/select2_component.dart';
import 'package:ali_pasha_graph/components/fields_components/text_area_component.dart';
import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/helper_class.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import 'logic.dart';

class CreateProductPage extends StatelessWidget {
  CreateProductPage({Key? key}) : super(key: key);

  final logic = Get.find<CreateProductLogic>();
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScafoldColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 0.01.sw, vertical: 0.02.sh),
        children: [
          Container(
            child: Text(
              'إنشاء منشور',
              style: TitleTextStyle,
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: GrayDarkColor, width: 0.004.sh))),
          ),
          10.verticalSpace,
          Container(
            height: 0.1.sh,
            width: 1.sw,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 0.04.sh,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/png/user.png'))),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 0.4.sw,
                              child: Text(
                                'مجموعة بن شيبان التجارية',
                                style: TitleTextStyle,
                                overflow: TextOverflow.ellipsis,
                              )),
                          40.horizontalSpace,
                          Container(
                              alignment: Alignment.centerLeft,
                              width: 0.3.sw,
                              child: Text(
                                'حدد نوع المنشور',
                                style: HintTextStyle,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          10.verticalSpace,
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    logic.typePost('product');
                  },
                  child: Container(
                    width: 0.24.sw,
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.02.sw, vertical: 0.009.sh),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: logic.typePost.value != 'product'
                              ? GrayDarkColor
                              : RedColor),
                      borderRadius: BorderRadius.circular(0.03.sw),
                      color: logic.typePost.value != 'product'
                          ? Colors.transparent
                          : RedColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.shoppingCart,
                          color: logic.typePost.value != 'product'
                              ? GrayDarkColor
                              : WhiteColor,
                          size: 0.05.sw,
                        ),
                        10.horizontalSpace,
                        Text(
                          'منتجات',
                          style: logic.typePost.value != 'product'
                              ? TabsTextStyle
                              : TabActiveTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    logic.typePost('job');
                  },
                  child: Container(
                    width: 0.24.sw,
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.02.sw, vertical: 0.009.sh),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: logic.typePost.value != 'job'
                              ? GrayDarkColor
                              : RedColor),
                      borderRadius: BorderRadius.circular(0.03.sw),
                      color: logic.typePost.value != 'job'
                          ? Colors.transparent
                          : RedColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.idCard,
                          color: logic.typePost.value != 'job'
                              ? GrayDarkColor
                              : WhiteColor,
                          size: 0.05.sw,
                        ),
                        10.horizontalSpace,
                        Text(
                          'وظائف',
                          style: logic.typePost.value != 'job'
                              ? TabsTextStyle
                              : TabActiveTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    logic.typePost('tender');
                    HelperClass.getLocation().then((LocationData? location)=>print(location?.longitude));
                  },
                  child: Container(
                    width: 0.24.sw,
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.02.sw, vertical: 0.009.sh),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: logic.typePost.value != 'tender'
                              ? GrayDarkColor
                              : RedColor),
                      borderRadius: BorderRadius.circular(0.03.sw),
                      color: logic.typePost.value != 'tender'
                          ? Colors.transparent
                          : RedColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.moneyBillTrendUp,
                          color: logic.typePost.value != 'tender'
                              ? GrayDarkColor
                              : WhiteColor,
                          size: 0.05.sw,
                        ),
                        10.horizontalSpace,
                        Text(
                          'مناقصات',
                          style: logic.typePost.value != 'tender'
                              ? TabsTextStyle
                              : TabActiveTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logic.typePost('service');
                    print(
                        "Editor => ${await logic.editorController.getText()}");
                  },
                  child: Container(
                    width: 0.24.sw,
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.02.sw, vertical: 0.009.sh),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: logic.typePost.value != 'service'
                              ? GrayDarkColor
                              : RedColor),
                      borderRadius: BorderRadius.circular(0.03.sw),
                      color: logic.typePost.value != 'service'
                          ? Colors.transparent
                          : RedColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.servicestack,
                          color: logic.typePost.value != 'service'
                              ? GrayDarkColor
                              : WhiteColor,
                          size: 0.05.sw,
                        ),
                        10.horizontalSpace,
                        Text(
                          'خدمة',
                          style: logic.typePost.value != 'service'
                              ? TabsTextStyle
                              : TabActiveTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          30.verticalSpace,
          Form(
            key: _formState,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextAreaComponent(
                  width: 1.sw,
                  hint: 'الوصف',
                  controller: logic.infoProduct,
                ),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChooseSingleImage(
                      width: 0.4.sw,
                      onFileChanged: (XFile? file) {
                        if (file != null) {
                          logic.mainImage(file);
                        } else {
                          logic.mainImage(null);
                        }
                      },
                    ),
                    ChooseMultiImages(
                        width: 0.5.sw,
                        onFileChanged: (List<XFile?> files) {
                          print(files.length);
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputComponent(
                      width: 0.45.sw,
                      hint: 'السعر',
                      isRequired: true,
                      textInputType: TextInputType.number,
                      validation: (txt) {
                        if (txt?.length == 0) {
                          return "الحقل مطلوب";
                        }
                        return null;
                      },
                    ),
                    InputComponent(
                      width: 0.45.sw,
                    ),
                  ],
                ),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Select2Component(
                      width: 0.45.sw,
                      selectDataController: logic.cityController,
                    ),
                    InputComponent(
                      width: 0.45.sw,
                      hint: 'العنوان',
                    ),
                  ],
                ),
                FilledButton(
                    onPressed: () {
                      //print(logic.cityController.selectedList[0].value);
                      _formState.currentState?.validate();
                    },
                    child: Text('Ok'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
