import 'package:ali_pasha_graph/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/colors.dart';

class SellerHomePageCard extends StatelessWidget {
  const SellerHomePageCard({super.key, this.seller});

  final UserModel? seller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 0.27.sw,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: GrayLightColor,
            borderRadius: BorderRadius.circular(25.h),
            image: DecorationImage(
                image: NetworkImage('${seller?.customImg}'),
                fit: BoxFit.fill,
                opacity: 0.7)),
        child: Container(
          padding: EdgeInsets.only(top: 20.h, right: 20.w),
          alignment: Alignment.topRight,
          child: CircleAvatar(
            backgroundColor: WhiteColor,
            radius: 40.w,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black,blurRadius: 5,blurStyle: BlurStyle.outer),
                  BoxShadow(color: GrayDarkColor,blurRadius: 2),
                ],
                color: GrayLightColor,
                borderRadius: BorderRadius.circular(1.sh),
                image: DecorationImage(
                  image: NetworkImage('${seller?.logo}')
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
