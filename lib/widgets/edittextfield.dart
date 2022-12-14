import 'package:flutter/material.dart';

class EdtTextField extends StatelessWidget {
  EdtTextField({Key? key, this.title, required this.controller1})
      : super(key: key);
  String? title;
  TextEditingController controller1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(
          controller: controller1,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            hintText: title,
            fillColor: Colors.grey[200],
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 11, 6, 26))),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(),
            ),
          ),
        ),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black,
            offset: Offset(
              5.0,
              5.0,
            ),
          )
        ]),
      ),
    );
  }
}
