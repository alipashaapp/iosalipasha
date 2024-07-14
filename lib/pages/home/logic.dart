import 'package:ali_pasha_graph/Global/main_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/product_model.dart';

class HomeLogic extends GetxController {
  String getProductsQuery = '';
  MainController mainController = Get.find<MainController>();
  RxList<ProductModel> products = RxList([]);
  RxBool hasMorePage = RxBool(false);
  int page = 1;

  @override
  void onInit() {
    super.onInit();

    getProduct();
  }

  nextPage() {
    page++;
    print("NEXt PAGE $page");
    getProduct();
  }

  getProduct() async {
    if (page == 1) {
      products.clear();
    }
    mainController.query('''
    query Products {
    products(first: 1, page: ${page}) {
        data {
            id
            expert
            is_discount
            is_delivary
            is_available
            price
            views_count
            discount
            end_date
            type
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
    mainCategories{
    name
    id
    image
    }
}
    ''');
    dio.Response? res = await mainController.fetchData();

    if (res != null) {
      hasMorePage(
          res.data['data']['products']['paginatorInfo']['hasMorePages']);
      for (var item in res.data['data']['products']['data']) {
        products.add(ProductModel.fromJson(item));
      }
    }
  }
}
