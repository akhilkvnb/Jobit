import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 11, 6, 26)),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      fillColor: Colors.grey[200], filled: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 11, 6, 26))),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(),
      ),
      //fillColor: Colors.green
    ));
  }
}
