import 'package:ali_pasha_graph/models/user_model.dart';

class AdviceModel {
  int? id;
  String? name;
  String? url;
  String? expired_date;
  int? views_count;
  String? image;
  UserModel? user;

  AdviceModel(
      {this.image,
      this.user,
      this.name,
      this.id,
      this.views_count,
      this.url,
      this.expired_date});

  factory AdviceModel.fromJson(Map<String, dynamic> data) {
    dynamic dataUser = null;
    if (data['user'] != null) {
      dataUser = UserModel.fromJson(data['user']);
    }
    return AdviceModel(
        id: int.tryParse("${data['id']}"),
        image: "${data['image'] ?? ''}",
        name: "${data['name'] ?? ''}",
        url: "${data['url'] ?? ''}",
        expired_date: "${data['expired_date'] ?? ''}",
        views_count: int.tryParse("${data['views_count'] ?? ''}"),
        user: dataUser);
  }
}
