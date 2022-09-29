import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/model/login_response.dart';
import '../Screens/Login/model/login_model.dart';
import '../api_url/api_url.dart';
import '../utilitty/utility.dart';

class ApisignIn {
/////---------------SignIn----------------/////

  Future<SignInResponseModel> signinPostFunction(
      SigninModel obj, BuildContext context) async {
    const uri = ApiUrl.baseUrl + ApiUrl.signIn;
    try {
      final response = await Dio().post(uri,
          data: obj.toJson(),
          options: Options(headers: {"Content-Type": "application/json"}));

      if (response.statusCode == 200) {
        await Utility.storage
            .write(key: 'access', value: response.data['access']);
        log(response.data['access'].toString());
        return SignInResponseModel.fromJson(response.data);
      } else {
        return SignInResponseModel(message: "Something went wrong");
      }
    } catch (e) {
      if (e is DioError) {
        if (e is SocketException) {
          log('no inter');
        }
        if (e.response?.data == null) {
          return SignInResponseModel(message: "something went wrong");
        } else {
          log(e.response.toString());
          return SignInResponseModel(message: e.response!.data['detail']);
        }
      }
      log(e.toString());
      return SignInResponseModel(message: "something went wrong");
    }
  }
}
