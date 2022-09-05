// class SigninModel {
//   String emailid = '';
//   String password = '';

//   SigninModel({required this.emailid, required this.password});

//   Map<String, dynamic> tojson() => {"emailid": emailid, "password": password};
// }
// To parse this JSON data, do
//
//     final signin = signinFromJson(jsonString);
// To parse this JSON data, do
//
//     final signin = signinFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

String signinToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
  SigninModel({
    required this.clientId,
    required this.clientSecret,
    required this.grantType,
    required this.username,
    required this.password,
  });

  String clientId;
  String clientSecret;
  String grantType;
  String username;
  String password;

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "grant_type": grantType,
        "username": username,
        "password": password,
      };
}
