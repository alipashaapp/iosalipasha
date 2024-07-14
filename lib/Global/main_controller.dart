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
      loading(false);
      return null;
    }
  }
}
