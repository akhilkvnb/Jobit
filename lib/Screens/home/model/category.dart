class CategoryModel {
  String? id = '';
  String? categoryname = '';
  String? message = '';

  CategoryModel({
    this.categoryname,
    this.id,
    this.message,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryname: json["category_name"] ?? '',
        id: json["id"].toString(),
      );
  List<CategoryModel> categoryGetModelFromjson(List data) =>
      List<CategoryModel>.from(data.map((x) => CategoryModel.fromJson(x)));
}
