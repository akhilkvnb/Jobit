import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/model/login_model.dart';
import 'package:jobit/Screens/jobs.dart';
import 'package:jobit/api_url/api_url.dart';
import 'package:jobit/services/api_service.dart';

class SigninProvider with ChangeNotifier {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passworController = TextEditingController();

  late String msg;
  String? validatorEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      msg = 'field is required';
      return msg;
    } else if (!regex.hasMatch(value)) {
      msg = 'Please provide a valid email id';
      return msg;
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value.isEmpty) {
      msg = 'field is required';
      return msg;
    }
    return null;
  }

  signinValidation(BuildContext context) {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      signinFunction(context);
    }
  }

  ///--------------SignInFunction-----------------////
  signinFunction(BuildContext context) async {
    final resp = await Apiservice().signinPostFunction(
        SigninModel(
            username: emailController.text.trim(),
            password: passworController.text.trim(),
            grantType: 'password',
            clientId: ApiUrl.clientId,
            clientSecret: ApiUrl.clientSecret),
        context);
    if (resp is Response) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ScreenJobs()));
    } else if (resp == 'network Error') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(resp.toString())));
    } else if (resp == 'Invalid email or password') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(resp.toString())));
    }
  }
}
