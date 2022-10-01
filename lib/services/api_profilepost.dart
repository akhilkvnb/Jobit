import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jobit/api_url/api_url.dart';
import 'package:jobit/utilitty/utility.dart';
import '../Screens/profile/model/profilegetmodel.dart';
import '../Screens/profile/model/promodel.dart';

class Createprofile {
  Future<ProfileModel>? profilepostfunction(
    ProfileModel obj,
  ) async {
    log('lllllllllllllll');
    FormData formdata = FormData.fromMap({
      "profile_photo": await MultipartFile.fromFile(obj.profilephoto!.path,
          filename: obj.profilephoto!.path.split('/').last),
      "cv": await MultipartFile.fromFile(obj.cv!.path,
          filename: ProfileModel().getFileName(obj.cv!)),
      "first_name": obj.firstname,
      "last_name": obj.lastname,
      "date_of_birth": obj.dateOfBirth,
      "about": obj.about
    });
    final dio = Dio();
    const uri = ApiUrl.baseUrl + ApiUrl.profile;
    final jwt = await Utility.storage.read(key: 'access');
    try {
      dio.options.headers["Authorization"] = "Bearer $jwt";
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      final response = await dio.post(uri, data: formdata);

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log('1........1');
        log(response.data.toString());

        return ProfileModel(message: 'success');
      } else {
        log('2........2');
        log('something went wrong!');
        return ProfileModel(message: response.data['message']);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          return ProfileModel(message: 'Something went wrong!');
        }
        log('3........3');
        log(e.response!.data.toString());
        return ProfileModel(message: "Something went wrong");
      } else {
        log('4.........4');
        log(e.toString());
        return ProfileModel(message: e.toString());
      }
    }
  }

//////////-----------ProfileRead---------------//////////
  Future<ProfileGetModel>? getProfile() async {
    final dio = Dio();
    const url = ApiUrl.baseUrl + ApiUrl.profileRead;
    final token = await Utility.storage.read(key: 'access');
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.contentType = 'application/json';
      final response = await dio.get(url);
      log('wwwwwwwwww');
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        log('sucess111');

        return ProfileGetModel.fromJson(response.data);
      } else {
        log('22eeeeeeeee');
        return ProfileGetModel(message: "Something went wrong");
      }
    } catch (e) {
      if (e is DioError) {
        log('1oooooo1oo1o');
        if (e.response?.data == null) {
          log(e.response.toString());
          return ProfileGetModel(message: "Something went wrong!!!!");
        } else {
          log('qqqqq');
          log(e.response!.data.toString());
          return ProfileGetModel(message: "Something went wrong");
        }
      } else {
        log("333eeeeeeee");
        log(e.toString());
        return ProfileGetModel(message: "Something went wrong");
      }
    }
  }
}
