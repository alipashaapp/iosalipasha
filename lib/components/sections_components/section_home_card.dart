import 'package:ali_pasha_graph/helpers/colors.dart';
import 'package:ali_pasha_graph/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/style.dart';

class SectionHomeCard extends StatelessWidget {
  const SectionHomeCard({super.key, this.section});

  final CategoryModel? section;


  @override
  Widget build(BuildContext context) {
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
              color: String2Hex(section?.color),
              borderRadius: BorderRadius.circular(0.03.sw),
            ),
            child: Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage("${section?.img}"))),
            ),
          ),
          Text(
            "${section?.name}",
            overflow: TextOverflow.ellipsis,
            style: SectionNameTextStyle,
          )
        ],
      ),
    );
  }
}
