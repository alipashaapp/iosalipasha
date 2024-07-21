import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:ali_pasha_graph/routes/routes_url.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  final logic = Get.find<MenuLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(1.sw,0.4.sh), child:  Container(
          padding: EdgeInsets.symmetric(
              horizontal: 0.02.sw, vertical: 0.02.sw),
          color: WhiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Get.offAndToNamed(PROFILE_PAGE);
                },
                child: Container(
                  width: 0.6.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.005.sw),
                        decoration: BoxDecoration(
                            color: GrayDarkColor, shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundColor: WhiteColor,
                          minRadius: 0.05.sw,
                          maxRadius: 0.07.sw,
                          child: Container(
                            width: 0.13.sw,
                            height: 0.13.sw,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: GrayDarkColor,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/png/user.png',
                                  ),
                                )),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        'مجموعة شيبان التجارية',
                        style: HintTextStyle,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
              badges.Badge(
                child: Icon(
                  FontAwesomeIcons.bell,
                  size: 0.08.sw,
                ),
                onTap: () {},
                badgeContent: Text(
                  '10',
                  style: LiveTextStyle,
                ),
              )
            ],
          ),
        ),),
        backgroundColor: GrayDarkColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Divider(
                color: GrayDarkColor,
                height: 0.0001.sw,
              ),
              Container(
                width: 1.sw,
                height: 0.3.sw,
                color: RedColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'رصيدك الحالي : ',
                            style: PriceTextStyle.copyWith(fontSize: 0.04.sw)),
                        TextSpan(
                            text: '10 \$',
                            style: PriceTextStyle.copyWith(
                                fontSize: 0.04.sw,
                                fontWeight: FontWeight.w200)),
                      ]),
                    ),
                    30.verticalSpace,
                    Container(
                      alignment: Alignment.center,
                      width: 0.5.sw,
                      height: 0.06.sh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.02.sw),
                          color: WhiteColor),
                      child: Text(
                        'شحن رصيد الإعلانات',
                        style: FollowTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.01.sw, vertical: 0.002.sh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildWidget(
                        image: 'assets/images/png/home.png',
                        title: 'عرض متجري'),
                    _buildWidget(
                        image: 'assets/images/png/cart.png',
                        title: 'سلة المشتريات'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.01.sw, vertical: 0.002.sh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildWidget(
                        image: 'assets/images/png/create.png',
                        title: 'إضافة منتج'),
                    _buildWidget(
                        image: 'assets/images/png/dependancy.png',
                        title: 'المراكز المعتمدة'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.01.sw, vertical: 0.002.sh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildWidget(
                        image: 'assets/images/png/share.png',
                        title: 'مشاركة التطبيق'),
                    _buildWidget(
                        image: 'assets/images/png/shipping.png',
                        title: 'خدمة الشحن'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.01.sw, vertical: 0.002.sh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildWidget(
                        image: 'assets/images/png/upgrade.png',
                        title: 'ترقية الحساب'),
                    _buildWidget(
                        image: 'assets/images/png/last_news.png',
                        title: 'آخر الأخبار'),
                  ],
                ),
              ),
              _dropDownButton(
                title: 'المساعدة والدعم',
                img: 'assets/images/png/asks.png',
                items: [
                  DropdownMenuItem<String>(
                    value: 'asks',
                    onTap: () {
                      print('TAB');
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 0.06.sw,
                          child: Image(
                            image: AssetImage('assets/images/png/support.png'),
                          ),
                        ),
                        20.horizontalSpace,
                        Text(
                          'الأسئلة الشائعة',
                          style: HintTextStyle,
                        )
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'contact_us',
                    onTap: () {
                      print('TAB');
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 0.06.sw,
                          child: Image(
                            image:
                                AssetImage('assets/images/png/contact_us.png'),
                          ),
                        ),
                        20.horizontalSpace,
                        Text(
                          'إتصل بنا',
                          style: HintTextStyle,
                        )
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'privacy',
                    onTap: () {
                      print('TAB');
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 0.06.sw,
                          child: Image(
                            image: AssetImage('assets/images/png/privacy.png'),
                          ),
                        ),
                        20.horizontalSpace,
                        Text(
                          'سياسة الخصوصية',
                          style: HintTextStyle,
                        )
                      ],
                    ),
                  )
                ],
              ),
              _dropDownButton(
                  img: 'assets/images/png/settings.png',
                  items: [
                    DropdownMenuItem<String>(
                      value: 'settings',
                      onTap: () {
                        print('TAB');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 0.06.sw,
                            child: Image(
                              image:
                                  AssetImage('assets/images/png/settings.png'),
                            ),
                          ),
                          20.horizontalSpace,
                          Text(
                            'الإعدادات',
                            style: HintTextStyle,
                          )
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'about',
                      onTap: () {
                        print('TAB');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 0.06.sw,
                            child: Image(
                              image: AssetImage('assets/images/png/about.png'),
                            ),
                          ),
                          20.horizontalSpace,
                          Text(
                            'من نحن',
                            style: HintTextStyle,
                          )
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'logOut',
                      onTap: () {
                        print('TAB');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 0.06.sw,
                            child: Image(
                              image:
                                  AssetImage('assets/images/png/log_out.png'),
                            ),
                          ),
                          20.horizontalSpace,
                          Text(
                            'تسجيل الخروج',
                            style: HintTextStyle,
                          )
                        ],
                      ),
                    )
                  ],
                  title: 'الإعدادات'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidget({
    required String image,
    required String title,
    Function()? onTap,
  }) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 0.49.sw,
          height: 0.3.sw,
          child: Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 0.095.sw,
                      height: 0.095.sw,
                      child: Image(image: AssetImage(image))),
                  Text(
                    title,
                    style: HeadingTextStyle,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _dropDownButton(
      {required List<DropdownMenuItem<String>> items,
      required String title,
      required String img}) {
    String? selectedValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.01.sw, vertical: 0.002.sh),
      width: 1.sw,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 0.06.sw,
                      child: Image(
                        image: AssetImage(
                          img,
                        ),
                      ),
                    ),
                    20.horizontalSpace,
                    Text(
                      title,
                      style: HintTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          items: items,
          value: selectedValue,
          onChanged: (value) {
            print(value);
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 160,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: WhiteColor,
            ),
            elevation: 2,
          ),
          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            iconSize: 0.07.sw,
            iconEnabledColor: DarkColor,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 1.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: WhiteColor,
            ),
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
