import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/model/login_model.dart';
import 'package:jobit/Screens/jobs.dart';
import 'package:jobit/Screens/signup/models/model.dart';
import 'package:jobit/api_url/api_url.dart';

class Apiservice {
  /////-------------SignUp----------------/////

  signupPostFunction(
    SignupModel obj,
  ) async {
    const uri = ApiUrl.baseUrl + ApiUrl.signUp;
    try {
      final response = await Dio().post(uri,
          data: obj.tojson(),
          options: Options(headers: {"Content-Type": "application/json"}));
      return response;
    } on DioError catch (e) {
      if (e.response?.data.toString() ==
          '{email: [new user with this email address already exists.], username: [new user with this username already exists.]}') {
        return 'email Already Exist';
      } else if (e.response?.data.toString() ==
          '{username: [new user with this username already exists.]}') {
        return 'username Already Exist';
      } else if (e.toString().contains('Connection failed')) {
        return 'network Error';
      }
      return 'error';
    }
  }

/////---------------SignIn----------------/////

  signinPostFunction(SigninModel obj, BuildContext context) async {
    const uri = ApiUrl.baseUrl + ApiUrl.signIn;
    try {
      final response = await Dio().post(uri,
          data: obj.toJson(),
          options: Options(headers: {"Content-Type": "application/json"}));
      print(response.statusCode);
      return response;
    } on DioError catch (e) {
      if (e.toString().contains('Connection failed')) {
        return 'network Error';
      } else if (e.response?.data['error'].toString() == "invalid_grant") {
        return 'Invalid email or password';
      }
    }
  }
}
