import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Utility {
  static displaySnackbar({required BuildContext context, required String msg}) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String? jwt;
  static const storage = FlutterSecureStorage();
}
