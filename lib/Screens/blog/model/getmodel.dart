class BlogGetModel {
  String? title = '';
  String? content = '';
  String? id = '';
  String? message = '';

  BlogGetModel({
    this.title,
    this.content,
    this.id,
    this.message,
  });
  factory BlogGetModel.fromJson(Map<String, dynamic> json) => BlogGetModel(
        title: json["title"] ?? '',
        content: json["content"] ?? '',
        id: json["id"].toString(),
      );
  List<BlogGetModel> blogGetModelFromjson(List data) =>
      List<BlogGetModel>.from(data.map((x) => BlogGetModel.fromJson(x)));
}
