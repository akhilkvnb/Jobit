import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jobit/Screens/blog/model/getmodel.dart';
import 'package:jobit/Screens/blog/model/model.dart';
import 'package:jobit/api_url/api_url.dart';
import 'package:jobit/utilitty/utility.dart';

class ApiBlog {
  /////------------BlogPost--------------------////////

  Future<BlogModel>? blogPostfunction(BlogModel obj) async {
    final dio = Dio();
    const uri = ApiUrl.baseUrl + ApiUrl.blogPost;
    final token = await Utility.storage.read(key: 'access');
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.contentType = 'application/json';
      final response = await dio.post(uri, data: obj.tojson());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log('aaaaa......');
        log(response.data.toString());
        return BlogModel.fromJson(response.data);
      } else {
        // log('Something went wrong!');
        log('bb......');
        return BlogModel(message: 'Something went wrong');
      }
    } catch (e) {
      if (e is SocketException) {
        log('network error');
        return BlogModel(message: 'network error');
      }
      if (e is DioError) {
        if (e.response?.data == null) {
          log('111111111111');
          return BlogModel(message: 'Smething went wrong');
        }
        log('2222');
        log(e.response.toString());
        return BlogModel(message: 'something went wrong');
      } else {
        log('333333333333');
        return BlogModel(message: e.toString());
      }
    }
  }
//////--------BlogRead----------------------------//////

  Future<List<BlogGetModel>>? getBlog() async {
    final dio = Dio();
    const url = ApiUrl.baseUrl + ApiUrl.blogRead;
    final token = await Utility.storage.read(key: 'access');
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.contentType = 'application/json';
      final response = await dio.get(url);
      log('wwwwwwwwww');
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        log('sucess');
        return BlogGetModel().blogGetModelFromjson(response.data);
      } else {
        log('22eeeeeeeee');
        return [BlogGetModel(message: "Something went wrong")];
      }
    } catch (e) {
      if (e is DioError) {
        log('1oooooo1oo1o');
        if (e.response?.data == null) {
          log(e.response.toString());
          return [BlogGetModel(message: "Something went wrong!!!!")];
        } else {
          log('qqqqq');
          log(e.response!.data.toString());
          return [BlogGetModel(message: "Something went wrong")];
        }
      } else {
        log("333eeeeeeee");
        log(e.toString());
        return [BlogGetModel(message: "Something went wrong")];
      }
    }
  }
}
