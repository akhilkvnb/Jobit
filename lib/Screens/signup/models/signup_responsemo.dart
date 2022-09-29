class SignUpResponseModel {
  SignUpResponseModel({this.username, this.email, this.id, this.message});

  final String? username;
  final String? email;
  final String? id;
  final String? message;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        id: json["id"].toString(),
      );
}
