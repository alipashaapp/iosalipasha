import 'package:ali_pasha_graph/models/category_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/dio_network_manager.dart';

class MainController extends GetxController {
  RxString token = RxString('');
  NetworkManager dio_manager = NetworkManager();
  RxnString query = RxnString(null);
  Rxn<Map<String, dynamic>> variables = Rxn(null);
  RxBool loading = RxBool(false);
  RxList<Map<String, dynamic>> errors = RxList<Map<String, dynamic>>([]);
  RxList<CategoryModel> categories = RxList<CategoryModel>([]);
  RxBool is_show_home_appbar=RxBool(true);
  @override
  void onInit() {
    super.onInit();
  }

  Future<dio.Response?> fetchData() async {
    loading(true);
    try {
      dio.Response res = await dio_manager.executeGraphQLQuery(query.value!,
          variables: variables.value);

      loading(false);
      return res;
    } catch (e) {
      errors.add({'errors': e});
      print(e);
      loading(false);
      return null;
    }
  }
}
