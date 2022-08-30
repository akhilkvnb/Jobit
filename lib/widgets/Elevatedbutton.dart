import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
  CustomElevatedButtom({
    Key? key,
    required this.buttonname,
    required this.onpressed,
  }) : super(key: key);
  String buttonname;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            onpressed();
          },
          child: Text(
            buttonname,
            style: const TextStyle(fontSize: 15),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 11, 6, 26)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )))),
    );
  }
}
