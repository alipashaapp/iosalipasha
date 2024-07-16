class CategoryModel {
  int? id;
  String? name;
  String? img;
  String? color;
  List<CategoryModel>? parent;
  List<CategoryModel>? children;

  CategoryModel({this.name, this.id, this.img, this.children, this.parent,this.color});

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    List<CategoryModel> listParent = [];
    List<CategoryModel> listChildren = [];
    if (data['parents'] != null) {
      for (var item in data['parents']) {
        listParent.add(CategoryModel.fromJson(item));
      }
    }

    if (data['children'] != null) {
      for (var item in data['children']) {
        listChildren.add(CategoryModel.fromJson(item));
      }
    }
    return CategoryModel(
        name: "${data['name']}",
        img: "${data['image']}",
        color: "${data['color']}",
        id: int.tryParse("${data['id']}"),
        children: listChildren.toList(),
        parent: listParent.toList());
  }
}
