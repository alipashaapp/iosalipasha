import 'package:ali_pasha_graph/Global/main_controller.dart';
import 'package:ali_pasha_graph/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class ProfileLogic extends GetxController {
  RxInt pageSelected = RxInt(0);
  TextEditingController searchController = TextEditingController();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  RxString search = RxString('');
  MainController mainController = Get.find<MainController>();
  RxInt page = 1.obs;
  RxBool hasMorePage = RxBool(false);
  PageController pageController = PageController(
    initialPage: 0,
  );

  nextPage() {
    page.value = page.value + 1;
  }

  @override
  void onInit() {
    super.onInit();

    ever(page, (value) {
      getProduct();
    });
    ever(search, (value) {
      if (page.value == 1) {
        getProduct();
      } else {
        page.value = 1;
      }
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if (pageSelected.value == 0 && page.value == 1) {
      getProduct();
    }
  }

  getProduct() async {
    if (page.value == 1) {
      products.clear();
    }
    mainController.query('''
    query Products {
    products(first:15, page: ${page},search:"${search.value??''}") {
        data {
            id
            expert
            type
            is_discount
            is_delivary
            is_available
            price
            views_count
            discount
            end_date
            type
            level
            image
            created_at
            user {
                seller_name
                logo
            }
          
            city {
                name
            }
            start_date
              sub1 {
                name
            }
            category {
                name
            }
        }
        paginatorInfo {
            hasMorePages
        }
    }
   ${page == 1 ? r'''
    mainCategories{
    name
    color
    id
    image
    }
    specialSeller{
    id
    name
    logo
    custom
    }
   ''' : ''}
}
    ''');
    dio.Response? res = await mainController.fetchData();
    print(res?.data);
    if (res != null) {
      hasMorePage(
          res.data['data']['products']['paginatorInfo']['hasMorePages']);
      for (var item in res.data['data']['products']['data']) {
        products.add(ProductModel.fromJson(item));
      }
    }
  }
}
