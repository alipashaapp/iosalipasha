class AttributeModel {
  int? id;
  String? name;
  List<AttributeModel>? attributes;

  AttributeModel({this.name, this.id, this.attributes});

  factory AttributeModel.fromJson(Map<String, dynamic> data) {
    List<AttributeModel> list = [];
    if(data['attributes']!=null){
      for (var item in data['attributes']) {
        list.add(AttributeModel.fromJson(item));
      }
    }

    return AttributeModel(
        name: "${data['name'] ?? ''}",
        id: int.tryParse("${data['id']}"),
        attributes: list.toList());
  }
}
