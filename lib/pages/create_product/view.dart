import 'package:ali_pasha_graph/components/fields_components/choose_single_imag.dart';
import 'package:ali_pasha_graph/components/fields_components/text_area_component.dart';
import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'logic.dart';

class CreateProductPage extends StatelessWidget {
  CreateProductPage({Key? key}) : super(key: key);

  final logic = Get.find<CreateProductLogic>();

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
                  onTap: () {
                    logic.typePost('service');
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
          10.verticalSpace,
          TextAreaComponent(
            controller: logic.infoProduct,
          ),
          Row(
            children: [
              ChooseSingleImage(
                width: 0.4.sw,
                onFileChanged: (XFile? file) {
                  logic.mainImage = file;
                  print(logic.mainImage?.path);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
