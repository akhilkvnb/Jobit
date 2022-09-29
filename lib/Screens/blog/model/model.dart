class BlogModel {
  String? title = '';
  String? content = '';
  String? id = '';
  String? message = '';

  BlogModel({
    this.title,
    this.content,
    this.id,
    this.message,
  });
  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        title: json["title"] ?? '',
        content: json["content"] ?? '',
        id: json["id"].toString(),
      );
  Map<String, dynamic> tojson() => {
        "title": title,
        "content": content,
      };
}
