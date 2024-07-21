import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:ali_pasha_graph/pages/profile/tabs/tab_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ProfileLogic logic = Get.find<ProfileLogic>();
List<Widget> pages=[
  TabProduct(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1.sw, 0.35.sh),
        child: Container(

          child: Column(
            children: [
              Container(
                width: 1.sw,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: EdgeInsets.all(0.005.sw),
                      decoration: BoxDecoration(
                        color: GrayDarkColor,
                        shape: BoxShape.circle,
                      ),
                      margin: EdgeInsets.only(top: 0.05.sh),
                      child: CircleAvatar(
                        backgroundColor: WhiteColor,
                        minRadius: 0.1.sw,
                        maxRadius: 0.12.sw,
                        child: Container(
                          padding: EdgeInsets.all(0.008.sw),
                          child: Image(
                            image: AssetImage('assets/images/png/user.png'),
                          ),
                          decoration: BoxDecoration(
                              color: GrayDarkColor, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0.004.sh,
                        left: 0.01.sw,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 0.35.sw,
                            height: 0.05.sh,
                            decoration: BoxDecoration(
                                color: RedColor,
                                borderRadius: BorderRadius.circular(0.02.sw)),
                            child: Text(
                              'تعديل الحساب',
                              style:
                              PriceTextStyle.copyWith(fontSize: 0.035.sw),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Text(
                'مجموعة شيبان التجارية',
                style: SubTitleTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildWidget(title: 'أتابعه', count: 150),
                  _buildWidget(title: 'متابعين', count: 2000),
                  _buildWidget(title: 'تسجيلات الإعجاب', count: 1000),
                ],
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _pageButton(title: 'منشوراتي',
                      img: 'assets/images/png/posts.png',
                      index: 0),
                  _pageButton(title: 'الإعلانات الممولة',
                      img: 'assets/images/png/advice.png',
                      index: 1),
                  _pageButton(title: 'الإحصائيات',
                      img: 'assets/images/png/chart.png',
                      index: 2),
                ],
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: logic.pageController,
        onPageChanged: (index) {
          logic.pageSelected.value = index;
          logic.pageController.animateToPage(
              index, duration: Duration(microseconds: 400),
              curve: Curves.bounceInOut);
        },
        children: pages,
      ),
    );
  }

  Widget _pageButton({ String? title, String? img,int? index}) {
    return InkWell(
      onTap: (){
        logic.pageSelected.value = index!;
        logic.pageController.animateToPage(
            index, duration: Duration(microseconds: 400),
            curve: Curves.bounceInOut);
      },
      child: Obx(() {
        return Container(
          alignment: Alignment.center,
          width: 0.29.sw,
          height: 0.03.sh,
          padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
          decoration: BoxDecoration(
              color:logic.pageSelected==index?RedColor:GrayLightColor,
            borderRadius: BorderRadius.circular(0.02.sw)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$title',style:logic.pageSelected==index? PriceTextStyle.copyWith(fontSize: 0.018.sw):TitleTextStyle.copyWith(fontSize: 0.018.sw),overflow: TextOverflow.ellipsis,),
              20.horizontalSpace,
              SizedBox(
                  width: 0.05.sw,
                  child: Image(image: AssetImage('$img')))
            ],
          ),
        );
      }),
    );
  }

  Widget _buildWidget({String? title, int? count}) {
    return Container(
      width: 0.29.sw,
      padding: EdgeInsets.symmetric(vertical: 0.007.sh, horizontal: 0.02.sw),
      decoration: BoxDecoration(
          border: Border.all(color: GrayDarkColor),
          borderRadius: BorderRadius.circular(0.02.sw),
          color: WhiteColor,
          boxShadow: [
            BoxShadow(color: DarkColor.withOpacity(0.3),
                blurStyle: BlurStyle.outer,
                blurRadius: 10),
            BoxShadow(color: DarkColor.withOpacity(0.3),
                blurStyle: BlurStyle.solid,
                blurRadius: 4)
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$count",
            style: IconTextStyle,
          ),
          15.verticalSpace,
          Text(
            "$title",
            style: HintTextStyle.copyWith(fontSize: 0.024.sw),
          )
        ],
      ),
    );
  }
}
