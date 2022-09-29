import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/view/login.dart';
import 'package:jobit/Screens/main/screemain.dart';
import 'package:jobit/utilitty/utility.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    splash();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Utility.jwt == null
                ? const ScreenLogin()
                : const ScreenMain())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('asset/splash_.png'),
        ),
      ),
    );
  }

  splash() async {
    Utility.jwt = await Utility.storage.read(key: 'access');
  }
}
