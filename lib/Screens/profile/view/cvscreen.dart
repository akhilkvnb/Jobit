import 'package:flutter/material.dart';

class ScreenCv extends StatelessWidget {
  const ScreenCv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height * .8,
          width: double.infinity,
        ),
      ),
    );
  }
}
