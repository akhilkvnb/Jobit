import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/provider/login_provider.dart';
import 'package:jobit/Screens/blog/provider/provider.dart';
import 'package:jobit/Screens/signup/provider/signup_provider.dart';
import 'package:jobit/splash.dart';
import 'package:provider/provider.dart';
import 'Screens/home/provider/categoryprovider.dart';
import 'Screens/home/provider/jobprovider.dart';
import 'Screens/profile/provider/provider.dart';
import 'Screens/settings/provider/signoutprovi.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => SigninProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => SignoutProvider()),
        ChangeNotifierProvider(create: (_) => BlogProvider()),
        ChangeNotifierProvider(create: (_) => JobProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
