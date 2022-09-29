import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/view/login.dart';
import 'package:jobit/Screens/home/view/jobs.dart';
import 'package:jobit/Screens/main/screemain.dart';
import 'package:jobit/Screens/signup/models/model.dart';
import 'package:jobit/Screens/signup/models/signup_responsemo.dart';
import 'package:jobit/services/api_signup.dart';
import 'package:jobit/utilitty/utility.dart';

class SignUpProvider with ChangeNotifier {
  bool isloading = false;
  final signupformkey = GlobalKey<FormState>();
  // GlobalKey<FormState> signupkey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passworController = TextEditingController();
  TextEditingController conformpasswordController = TextEditingController();
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

  String? validatorUsername(String value) {
    if (value.isEmpty) {
      msg = 'field is required';
      return msg;
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value.isEmpty) {
      msg = 'field is required';
      return msg;
    } else if (value.length < 8) {
      msg = 'Please enter atleast 8 characters';
      return msg;
    }
    return null;
  }

  String? validatorConformPassword(String value) {
    if (value.isEmpty) {
      msg = 'field is required';
      return msg;
    } else if (passworController.text != conformpasswordController.text) {
      msg = 'The password is not match';
      return msg;
    }
    return null;
  }

  signupValidation(BuildContext context) {
    if (signupformkey.currentState!.validate() == false) {
      return;
    } else {
      signupFunction(context);
    }
  }

  ////-----------------Signup function-------------------////

  signupFunction(context) async {
    final signupData = SignupModel(
        username: usernameController.text.trim(),
        emailid: emailController.text.trim(),
        password: passworController.text.trim());
    isloading = true;
    SignUpResponseModel? response =
        await Apiservice().signupPostFunction(signupData);
    if (response != null) {
      isloading = false;
      notifyListeners();
      if (response.email != null) {
        log('f........f');
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('message'),
                  actions: [
                    Text('Succefully registered'),
                    // Text('Now complete your mail verification')
                  ],
                ));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ScreenLogin()));
      } else {
        // log('log7');
        Utility.displaySnackbar(
            context: context, msg: response.message ?? 'Something went wrong!');
      }
    } else {
      isloading = false;
      notifyListeners();
      log('g........g');
      Utility.displaySnackbar(context: context, msg: 'No network found!');
    }
  }
}
