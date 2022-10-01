import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/view/login.dart';
import 'package:jobit/utilitty/utility.dart';

class SignoutProvider extends ChangeNotifier {
  signOut(BuildContext context) async {
    await Utility.storage.delete(key: 'access');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ScreenLogin()));
  }
}
