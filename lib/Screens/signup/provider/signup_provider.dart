import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/jobs.dart';
import 'package:jobit/Screens/signup/models/model.dart';
import 'package:jobit/services/api_service.dart';

class SignUpProvider with ChangeNotifier {
  final formkey = GlobalKey<FormState>();
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
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      signupFunction(context);
    }
  }

  ////-----------------Signup function-------------------////

  signupFunction(context) async {
    final res = await Apiservice().signupPostFunction(SignupModel(
        username: usernameController.text.trim(),
        emailid: emailController.text.trim(),
        password: passworController.text.trim()));
    if (res is Response) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ScreenJobs()));
    } else if (res == 'email Already Exist') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res.toString())));
    } else if (res == 'username Already Exist') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res.toString())));
    } else if (res == 'network Error') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res.toString())));
    } else if (res == 'error') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Something went wrong ! Please try again later')));
    }
  }
}
