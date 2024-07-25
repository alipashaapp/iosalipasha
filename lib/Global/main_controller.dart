import 'package:ali_pasha_graph/models/category_model.dart';
import 'package:ali_pasha_graph/models/user_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../helpers/dio_network_manager.dart';
import '../models/city_model.dart';

class MainController extends GetxController {
  RxString token =
      RxString('1|XoDW3fzMyn4aDNe9WclH6wgYObtcuYmucJrfdAqO643da6f4');
  Rxn<UserModel> authUser = Rxn<UserModel>(null);
  NetworkManager dio_manager = NetworkManager();
  GetStorage storage = GetStorage('ali-pasha');
  RxnString query = RxnString(null);
  Rxn<Map<String, dynamic>> variables = Rxn(null);
  RxBool loading = RxBool(false);
  RxList<Map<String, dynamic>> errors = RxList<Map<String, dynamic>>([]);
  RxList<CategoryModel> categories = RxList<CategoryModel>([]);
  RxList<CityModel> cities = RxList<CityModel>([]);
  RxBool is_show_home_appbar = RxBool(true);
  Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    storage.write('token', token.value);
    ever(token, (value) {
      if (value.isEmpty) {
        storage.remove('token');
        storage.remove('user');
      } else {
        storage.write('token', token.value);
      }
    });
    ever(authUser, (value) {
      logger.i(value?.toJson());
    });
  }

  @override
  void onReady() {
    getUserFromStorage();
  }

  Future<dio.Response?> fetchData() async {
    loading.value = true;
    try {
      dio.Response res = await dio_manager.executeGraphQLQuery(query.value!,
          variables: variables.value);

      loading.value = false;

      return res;
    } catch (e) {
      loading.value = false;
      throw Exception(e);
      return null;
    }
  }

  setUser({required UserModel user, bool isWrite = false}) async {
    if (isWrite) {
      if (storage.hasData('user')) {
        await storage.remove('user');
      }
      logger.i("BEFOR WRITE");
      await storage.write('user', user.toJson());
      logger.i("AFTER WRITE");
    }
    authUser.value = user;
  }

  getUserFromStorage() {
    if (storage.hasData('user')) {
      var user = storage.read('user');
      authUser.value = UserModel.fromJson(user);
    }else{
      logger.i("Does not have user");
    }
  }
}
