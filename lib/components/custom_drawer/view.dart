import 'package:ali_pasha_graph/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CustomDrawerComponent extends StatelessWidget {
  CustomDrawerComponent({Key? key}) : super(key: key);

  /*final logic = Get.find<CustomDrawerLogic>();
  final state = Get.find<CustomDrawerLogic>().state;*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(accountName: Text('Adnan',style: H1BlackTextStyle,), accountEmail: Text('adnan@gmail.com',style: H2GrayTextStyle,))
        ],
      ),
    );
  }
}
