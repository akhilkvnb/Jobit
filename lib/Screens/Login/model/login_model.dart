import 'dart:convert';

String signinToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
  SigninModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
