import 'package:ali_pasha_graph/helpers/enums.dart';
import 'package:ali_pasha_graph/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../helpers/colors.dart';
import '../../helpers/style.dart';

class PostCard extends StatelessWidget {
  final ProductModel? post;

  const PostCard({super.key, this.post});

  @override
  Widget build(BuildContext context) {
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
                                style: H1BlackTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: 0.6.sw,
                              child: Text(
                                '${post?.city?.name ?? ''} - ${post?.category?.name ?? ''} - ${post?.sub1?.name ?? ''}',
                                style: H4GrayOpacityTextStyle,
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
                            borderRadius: BorderRadius.circular(15.r),
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
                              style: H5RedTextStyle,
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
                    style: H3GrayTextStyle,
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
                  if (post?.level == 'special')
                    Positioned(
                      top: 20.h,
                      left: 10.w,
                      child: Container(
                        decoration: BoxDecoration(
                            color: OrangeColor,
                            borderRadius: BorderRadius.circular(15.r)),
                        height: 70.h,
                        width: 150.w,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'مميز',
                              style: H4WhiteTextStyle,
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
                  Visibility(
                    visible: post?.type == 'product',
                    child: Positioned(
                      bottom: 20.h,
                      right: 10.w,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: RedColor,
                                borderRadius: BorderRadius.circular(15.r)),
                            height: 90.h,
                            width: 280.w,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(text: ' ${post?.price ?? 0} ',style: H2WhiteTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                TextSpan(text: '\$',style: H2WhiteTextStyle.copyWith(fontWeight: FontWeight.bold)),
                              ]),
                            ),

                            /*  Text(
                              ,
                              style: H3WhiteTextStyle,
                            ),*/
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
                        style: H4BlackTextStyle,
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
                        style: H4BlackTextStyle,
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
                        style: H4BlackTextStyle,
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
                        style: H4BlackTextStyle,
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
