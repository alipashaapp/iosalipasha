import 'package:ali_pasha_graph/pages/create_product/binding.dart';
import 'package:ali_pasha_graph/pages/create_product/view.dart';
import 'package:ali_pasha_graph/pages/home/binding.dart';
import 'package:ali_pasha_graph/pages/home/view.dart';
import 'package:ali_pasha_graph/routes/routes_url.dart';


import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: HOME_PAGE, page:  ()=>HomePage(),binding:HomeBinding() ),
    GetPage(name: CREATE_PRODUCT, page:  ()=>CreateProductPage(),binding:CreateProductBinding() )
  ];
}
