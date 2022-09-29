import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jobit/Screens/signup/models/model.dart';
import 'package:jobit/Screens/signup/models/signup_responsemo.dart';
import 'package:jobit/api_url/api_url.dart';

class Apiservice {
  /////-------------SignUp----------------/////

  Future<SignUpResponseModel>? signupPostFunction(
    SignupModel obj,
  ) async {
    const uri = ApiUrl.baseUrl + ApiUrl.signUp;
    try {
      final response = await Dio().post(uri, data: obj.tojson());
      log(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log('a......a');
        log(response.data.toString());
        return SignUpResponseModel.fromJson(response.data);
      } else {
        log('Something went wrong!');
        log('b.......b');
        return SignUpResponseModel(message: response.data['message']);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          log('c.......c');
          return SignUpResponseModel(message: 'Something went wrong!');
        }
        if (e.response?.data.containsKey('username')) {
          log('d.......d');
          return SignUpResponseModel(message: e.response!.data['username'][0]);
        } else if (e.response?.data.containsKey('email')) {
          return SignUpResponseModel(message: e.response!.data['email'][0]);
        } else {
          return SignUpResponseModel(message: e.response!.data['password'][0]);
        }
      } else {
        log('e.......e');
        log(e.toString());
        return SignUpResponseModel(message: 'Something went wrong!');
      }
    }
  }
}
