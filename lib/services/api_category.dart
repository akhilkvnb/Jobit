import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jobit/Screens/home/model/category.dart';
import 'package:jobit/api_url/api_url.dart';
import '../utilitty/utility.dart';

class ApiCategory {
  Future<List<CategoryModel>>? getCategory() async {
    final dio = Dio();
    const url = ApiUrl.baseUrl + ApiUrl.jobcategory;
    final token = await Utility.storage.read(key: 'access');
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.contentType = 'application/json';
      final response = await dio.get(url);
      log('c1');
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        log('sucess');
        return CategoryModel().categoryGetModelFromjson(response.data);
      } else {
        log('c2');
        return [CategoryModel(message: "Something went wrong")];
      }
    } catch (e) {
      if (e is DioError) {
        log('c3');
        if (e.response?.data == null) {
          log(e.response.toString());
          return [CategoryModel(message: "Something went wrong!!!!")];
        } else {
          log('c4');
          log(e.response!.data.toString());
          return [CategoryModel(message: "Something went wrong")];
        }
      } else {
        log("c5");
        log(e.toString());
        return [CategoryModel(message: "Something went wrong")];
      }
    }
  }
}
