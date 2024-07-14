import 'dart:math';

import 'package:ali_pasha_graph/Global/main_controller.dart';

import 'package:ali_pasha_graph/components/home_app_bar/view.dart';
import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/enums.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:ali_pasha_graph/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final mainController = Get.find<MainController>();
  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScafoldColor,
      appBar: HomeAppBarComponent(
        is_visible_thing: true,
      ),
      /*endDrawer: CustomDrawerComponent(),
      */
      body: Container(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent * 0.80 &&
                !mainController.loading.value &&
                logic.hasMorePage.value) {
              logic.nextPage();
            }
            return true;
          },
          child: Obx(() {
            return ListView(
              children: [
                Container(
                  color: WhiteColor,
                  height: 0.103.sh,
                  padding: EdgeInsets.symmetric(vertical: 0.002.sh),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSection(
                          section: 'مركبات',
                          color: CarColor,
                          img: 'assets/images/png/car.png'),
                      _buildSection(
                          section: 'ألبسة',
                          color: ClothesColor,
                          img: "assets/images/png/cloth.png"),
                      _buildSection(
                          section: 'هواتف وإكسسوارات',
                          color: MobileColor,
                          img: "assets/images/png/mobile.png"),
                      _buildSection(
                          section: 'أثاث ومفروشات',
                          color: FurnetureColor,
                          img: "assets/images/png/furneture.png"),
                      _viewMoreButton(
                          title: 'عرض المزيد',
                          color: ShowMoreColor,
                          img: "assets/images/png/show_more.jpg"),
                    ],
                  ),
                ),
                Container(
                  height: 0.157.sh,
                  width: double.infinity,
                  color: WhiteColor,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    semanticChildCount: 4,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(10, (i) {
                        return _buildSeelr();
                      }),
                    ],
                  ),
                ),
                Divider(
                  color: GrayDarkColor,
                  height: 0.0017.sh,
                ),
                ...List.generate(logic.products.length,
                    (index) => _buildPost(post: logic.products[index])),
                if (logic.mainController.loading.value)
                  Center(child: CircularProgressIndicator()),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _viewMoreButton(
      {required Color color, required String title, String? img}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.001.sw),
      height: 0.096.sh,
      width: 0.185.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.w),
      ),
      margin: EdgeInsets.symmetric(horizontal: 0.0059.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.all(0.007.sw),
            height: 0.150.sw,
            width: 0.150.sw,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(0.5.sw),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.5.sw),
                image: DecorationImage(
                  image: AssetImage("${img}"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Text(
            title!,
            overflow: TextOverflow.ellipsis,
            style: SectionNameTextStyle,
          )
        ],
      ),
    );
  }

  Widget _buildSection({String? section, required Color color, String? img}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.001.sw),
      height: 0.096.sh,
      width: 0.185.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.w),
      ),
      margin: EdgeInsets.symmetric(horizontal: 0.0059.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(0.02.sw),
            height: 0.150.sw,
            width: 0.150.sw,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(0.03.sw),
            ),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("${img}"))),
            ),
          ),
          Text(
            section!,
            overflow: TextOverflow.ellipsis,
            style: SectionNameTextStyle,
          )
        ],
      ),
    );
  }

  Widget _buildSeelr({String? seller}) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 0.27.sw,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: GrayLightColor,
            borderRadius: BorderRadius.circular(25.h),
            image: DecorationImage(
                image: AssetImage('assets/images/png/seller.jpeg'),
                fit: BoxFit.fill,
                opacity: 0.7)),
        child: Container(
          padding: EdgeInsets.only(top: 20.h, right: 20.w),
          alignment: Alignment.topRight,
          child: CircleAvatar(
            backgroundColor: WhiteColor,
            radius: 40.w,
            child: Image(
              image: AssetImage('assets/images/png/user.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPost({ProductModel? post}) {
    print(post?.name);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.h),
      padding: EdgeInsets.symmetric(vertical: 0.002.sh, horizontal: 0.002.sw),
      width: double.infinity,
      height: 0.556.sh,
      color: GrayLightColor,
      child: Column(
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: 0.018.sw, vertical: 0.008.sh),
            width: double.infinity,
            color: WhiteColor,
            height: 0.12.sh,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: GrayLightColor,
                          backgroundImage: NetworkImage("${post?.user?.logo}"),
                          minRadius: 0.018.sh,
                          maxRadius: 0.023.sh,
                        ),
                        10.horizontalSpace,
                        Column(
                          children: [
                            Container(
                              width: 0.6.sw,
                              child: Text(
                                "${post?.user?.seller_name}",
                                style: TitleTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: 0.6.sw,
                              child: Text(
                                '${post?.city?.name??''} - ${post?.category?.name??''} - ${post?.sub1?.name??''}',
                                style: HintTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.007.sw, vertical: 0.001.sh),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.02.sw),
                            border: Border.all(color: RedColor)),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.bell,
                              color: RedColor,
                              size: 0.05.sw,
                            ),
                            3.horizontalSpace,
                            Text(
                              "متابعة",
                              style: FollowTextStyle,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                15.verticalSpace,
                Container(
                  width: 1.sw,
                  height: 0.044.sh,
                  child: Text(
                    "${post?.expert}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: ParagraphTextStyle,
                    /* trimCollapsedText: "عرض المزيد",
                    trimExpandedText: "عرض أقل",


                    trimLines: 1,
                    trimMode: TrimMode.Line,*/
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 0.38.sh,
              decoration: BoxDecoration(
                  color: GrayDarkColor,
                  image: DecorationImage(
                      image: NetworkImage(
                        "${post?.image}",
                      ),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    top: 20.h,
                    left: 10.w,
                    child: Container(
                      decoration: BoxDecoration(
                          color: OrangeColor,
                          borderRadius: BorderRadius.circular(10.w)),
                      height: 70.h,
                      width: 150.w,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'مميز',
                            style: SpecialTextStyle,
                          ),
                          10.horizontalSpace,
                          Icon(
                            FontAwesomeIcons.solidStar,
                            color: GoldColor,
                            size: 50.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 10.w,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: RedColor,
                              borderRadius: BorderRadius.circular(10.w)),
                          height: 90.h,
                          width: 280.w,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            '\$ ${post?.price?.toPrecision(2) ?? 0}',
                            style: PriceTextStyle,
                          ),
                        ),
                        20.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                              color: RedColor,
                              borderRadius: BorderRadius.circular(10.w)),
                          height: 90.h,
                          width: 120.w,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Icon(
                            FontAwesomeIcons.cartShopping,
                            color: WhiteColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 0.05.sh,
            alignment: Alignment.center,
            color: WhiteColor,
            padding:
                EdgeInsets.symmetric(horizontal: 0.001.sw, vertical: 0.005.sh),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.eye),
                      10.horizontalSpace,
                      Text(
                        '${post?.views_count ?? 0}'.toFormatNumber(),
                        style: IconTextStyle,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.comment),
                      10.horizontalSpace,
                      Text(
                        'تعليق',
                        style: IconTextStyle,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.headset,
                      ),
                      10.horizontalSpace,
                      Text(
                        'محادثة',
                        style: IconTextStyle,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.share),
                      10.horizontalSpace,
                      Text(
                        'مشاركة',
                        style: IconTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
