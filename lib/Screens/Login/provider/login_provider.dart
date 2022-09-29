import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/model/login_model.dart';
import 'package:jobit/Screens/main/screemain.dart';
import 'package:jobit/services/api_signin.dart';
import 'package:jobit/utilitty/utility.dart';

class SigninProvider with ChangeNotifier {
  final loginformkey = GlobalKey<FormState>();
  // GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
    if (loginformkey.currentState!.validate() == false) {
      return;
    } else {
      signinFunction(context);
    }
  }

  ///--------------SignInFunction-----------------////
  signinFunction(BuildContext context) async {
    final signinData = SigninModel(
      email: emailController.text.trim(),
      password: passworController.text.trim(),
    );
    notifyListeners();
    ApisignIn().signinPostFunction(signinData, context).then((response) {
      notifyListeners();
      if (response.accessToken != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ScreenMain()));
      } else if (response.message != null) {
        Utility.displaySnackbar(context: context, msg: response.message!);
      } else {
        Utility.displaySnackbar(context: context, msg: "No internet");
      }
    });
  }
}
