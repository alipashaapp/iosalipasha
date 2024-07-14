import 'package:ali_pasha_graph/pages/home/binding.dart';
import 'package:ali_pasha_graph/pages/home/view.dart';


import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [GetPage(name: '/', page:  ()=>HomePage(),binding:HomeBinding() )];
}
