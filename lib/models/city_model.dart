class CityModel {
  int? id;
  String? name;
  String? image;

  CityModel({this.name, this.image, this.id});

  factory CityModel.fromJson(Map<String, dynamic> data) {
    return CityModel(
      id: int.tryParse("${data['id']}"),
      image: "${data['image']}",
      name: "${data['name']}",
    );
  }
}
