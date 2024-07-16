import 'package:ali_pasha_graph/models/city_model.dart';
import 'package:ali_pasha_graph/models/plan_model.dart';
import 'package:ali_pasha_graph/models/product_model.dart';

class UserModel {
  int? id;
  String? name;
  String? seller_name;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? logo;
  String? email_verified_at;
  String? open_time;
  String? close_time;
  bool? is_delivery;
  bool? is_restaurant;
  bool? is_active;
  String? affiliate;
  String? info;
  String? customImg;
  List<ProductModel>? products;

  List<PlanModel>? plans;
  CityModel? city;
  bool? is_special;

  UserModel({
    this.name,
    this.id,
    this.seller_name,
    this.email,
    this.email_verified_at,
    this.phone,
    this.address,
    this.image,
    this.logo,
    this.open_time,
    this.close_time,
    this.is_active,
    this.is_delivery,
    this.is_restaurant,
    this.is_special,
    this.affiliate,
    this.info,
    this.city,
    this.products,
    this.plans,
    this.customImg,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    List<ProductModel> listProducts = [];
    List<PlanModel> listPlans = [];
    if (data['products'] != null) {
      for (var item in data['products']) {
        listProducts.add(ProductModel.fromJson(item));
      }
    }
    if (data['plans'] != null) {
      for (var item in data['plans']) {
        listPlans.add(PlanModel.fromJson(item));
      }
    }
    return UserModel(
      id: int.tryParse("${data['id']}"),
      info: "${data['info']}",
      affiliate: "${data['affiliate']}",
      is_special: bool.tryParse("${data['is_special']}"),
      is_restaurant: bool.tryParse("${data['is_restaurant']}"),
      is_delivery: bool.tryParse("${data['is_delivery']}"),
      is_active: bool.tryParse("${data['is_active']}"),
      close_time: "${data['close_time']}",
      open_time: "${data['open_time']}",
      image: "${data['image']}",
      address: "${data['address']}",
      phone: "${data['phone']}",
      email: "${data['email']}",
      seller_name: "${data['seller_name']}",
      name: "${data['name']}",
      logo: "${data['logo']}",
      customImg: "${data['custom']}",
      email_verified_at: "${data['email_verified_at']}",
      city: data['city'] != null ? CityModel.fromJson(data['city']) : null,
      products: listProducts.toList(),
      plans: listPlans.toList(),
    );
  }
}
