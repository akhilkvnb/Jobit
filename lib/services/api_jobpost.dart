import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jobit/Screens/home/model/jobmodel.dart';
import 'package:jobit/api_url/api_url.dart';
import 'package:jobit/utilitty/utility.dart';

class ApiJob {
  /////------------JobPost--------------------////////

  Future<JobModel>? jobPostfunction(JobModel obj) async {
    final dio = Dio();
    const uri = ApiUrl.baseUrl + ApiUrl.jobPost;
    final token = await Utility.storage.read(key: 'access');
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.contentType = 'application/json';
      final response = await dio.post(uri, data: obj.tojson());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log('jobsucess');
        log(response.data.toString());
        return JobModel.fromJson(response.data);
      } else {
        // log('Something went wrong!');
        log('job11111');
        return JobModel(message: 'Something went wrong');
      }
    } catch (e) {
      if (e is SocketException) {
        log('network error');
        return JobModel(message: 'network error');
      }
      if (e is DioError) {
        if (e.response?.data == null) {
          log('job222222');
          return JobModel(message: 'Smething went wrong');
        }
        log('job33333');
        log(e.response.toString());
        return JobModel(message: 'something went wrong');
      } else {
        log('job444444');
        return JobModel(message: e.toString());
      }
    }
  }

  //////------------------JobRead------------------------///////

  // Future<List<JobModel>>? getJob() async {
  //   final dio = Dio();
  //   const url = ApiUrl.baseUrl + ApiUrl.jobRead;
  //   final token = await Utility.storage.read(key: 'access');
  //   try {
  //     dio.options.headers["Authorization"] = "Bearer $token";
  //     dio.options.contentType = 'application/json';
  //     final response = await dio.get(url);
  //     log('jg1');
  //     if (response.statusCode! >= 200 || response.statusCode! <= 299) {
  //       log(response.data.toString());
  //       log('sucess');
  //       return JobModel().jobGetModelFromjson(response.data);
  //     } else {
  //       log('jg2');
  //       return [JobModel(message: "Something went wrong")];
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       log('jg3');
  //       if (e.response?.data == null) {
  //         log(e.response.toString());
  //         return [JobModel(message: "Something went wrong!!!!")];
  //       } else {
  //         log('jg4');
  //         log(e.response!.data.toString());
  //         return [JobModel(message: "Something went wrong")];
  //       }
  //     } else {
  //       log("jg5");
  //       log(e.toString());
  //       return [JobModel(message: "Something went wrong")];
  //     }
  //   }
  // }
}
