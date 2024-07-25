import 'package:ali_pasha_graph/Global/main_binding.dart';
import 'package:ali_pasha_graph/Global/main_controller.dart';
import 'package:ali_pasha_graph/routes/route_pages.dart';
import 'package:ali_pasha_graph/routes/routes_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // لون الشريط
  ));
 await GetStorage.init('ali-pasha');
  Get.put( MainController(), permanent: true);
  await initializeDateFormatting('ar');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(1080, 2225),
        builder: (_, child) => GetMaterialApp(

          initialBinding: MainBinding(),
          title: 'علي باشا',
          locale: Locale('ar'),
          getPages: AppPages.pages,
          initialRoute: HOME_PAGE,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
