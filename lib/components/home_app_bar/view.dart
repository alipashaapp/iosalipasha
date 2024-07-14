import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

// 2226 heght all screen
class HomeAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final bool is_visible_thing;

  HomeAppBarComponent({Key? key, this.is_visible_thing = false})
      : super(key: key);
  double max_height = 0.115.sh;

  // final logic = Get.find<HomeAppBarLogic>();
  // final state = Get.find<HomeAppBarLogic>().state;
/*
*
38.90px
62.25px
62.25px
89.48px
147.83px
465.29px
* */
  @override
  Widget build(BuildContext context) {
    return Container(
      color: WhiteColor,
      padding: EdgeInsets.symmetric(horizontal: 0.003.sw, vertical: 2),
      width: double.infinity,
      height: is_visible_thing ? 0.2.sh : 0.184.sh,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: WhiteColor,
            height: 0.044.sh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 0.35.sw,
                  child: Image(
                    image: Svg('assets/images/svg/ali-pasha-horizantal-logo.svg',
                        color: RedColor, source: SvgSource.asset),
                    color: RedColor,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 0.01.sw),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FontAwesomeIcons.search,
                        size: 70.w,
                        color: RedColor,
                      ),
                      20.horizontalSpace,
                      SizedBox(
                        width: 0.21.sw,
                        child: MaterialButton(
                          color: RedColor,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FontAwesomeIcons.towerCell,
                                color: WhiteColor,
                                size: 50.w,
                              ),
                              15.horizontalSpace,
                              Text(
                                'Live',
                                style: LiveTextStyle,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          10.verticalSpace,
          Container(
            width: double.infinity,
            height: 0.071.sh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.home,
                          size: 65.w,
                        ))),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: RedColor,
                                style: BorderStyle.solid,
                                width: 0.002.sh))),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.bookOpen,
                          size: 65.w,
                          color: RedColor,
                        ))),
                Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.headset,
                          size: 65.w,
                        ))),
                Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.arrowTrendDown,
                          size: 65.w,
                        ))),
                Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.comments,
                          size: 65.w,
                        ))),
                Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.bars,
                          size: 75.w,
                        ))),
              ],
            ),
          ),
          Divider(
            color: GrayDarkColor,
            height: 0.0017.sh,
          ),
          if (is_visible_thing)
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.013.sh),
                width: double.infinity,
                height: 0.071.sh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/png/user.png'),
                      height: 100.h,
                    ),
                    10.horizontalSpace,
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      alignment: Alignment.centerRight,
                      height: 0.055.sh,
                      decoration: BoxDecoration(
                        color: WhiteColor,
                        boxShadow: [
                          BoxShadow(color: GrayDarkColor,blurRadius: 3),
                          BoxShadow(color: GrayDarkColor.withOpacity(0.4),blurRadius: 3)
                        ],
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Text('ماذا تفكر أن تنشر ...',style: HintTextStyle,),
                    ))
                  ],
                ),
              ),
            ),
          if (is_visible_thing)
            Divider(
              color: GrayDarkColor,
              height: 0.0017.sh,
            ),
        ],
      ),
    );
    /*return Container(
      width: 100.w,
      height: 0.18.sh,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal:  3.w ,vertical:  2.h),
            height: height,
            width: double.infinity,
           color: ScafoldColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.w,
                  child:  Image(
                    width: 100.w,
                    image:
                        Svg('assets/images/svg/ali-pasha-horizantal-logo.svg'),
                    color: PrimaryColor,
                  ),
                ),
                Container(
                  width: 150.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.search,
                          color: RedColor,
                          size: 25,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: RedColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Live',
                              style: IconTextStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              FontAwesomeIcons.towerCell,
                              color: WhiteColor,
                              size: 18,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            height: 50.h,
            decoration: BoxDecoration(
                color: ScafoldColor,
                border: Border(bottom: BorderSide(color: GrayDarkColor,width: 1.h,style: BorderStyle.solid))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.home,
                    color: IconColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.bookOpen,
                    color: IconColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.arrowTrendDown,
                    color: IconColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.comments,
                    color: IconColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: GrayLightColor)),
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 15,
                      foregroundColor: RedColor,
                      backgroundColor: GrayLightColor,
                      child: Image(
                        image: AssetImage('assets/images/png/user.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          if (is_visible_thing)
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.038),
              height: height * 0.0718,
              color: ScafoldColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: GrayLightColor)),
                    child: CircleAvatar(
                      minRadius: 10.h,
                      maxRadius: 15.h,
                      foregroundColor: RedColor,
                      backgroundColor: GrayLightColor,
                      child: Image(
                        image: AssetImage('assets/images/png/user.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:  1.w,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: GrayLightColor,
                          borderRadius: BorderRadius.circular(7)),
                      height: 0.5.h,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'ماذا تفكر أن تنشر ...',
                        style: ParagraphTextStyle,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          if (is_visible_thing)
            Divider(
              height: height * 0.0092992,
              color: GrayDarkColor,
            ),
        ],
      ),
    );*/
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    if (is_visible_thing) {
      max_height = 0.19.sh;
    }
    return Size(double.infinity, Get.height * max_height);
  }
}
