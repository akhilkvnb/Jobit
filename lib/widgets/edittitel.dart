import 'package:flutter/material.dart';

class Edittitle extends StatelessWidget {
  Edittitle({
    Key? key,
    this.title,
  }) : super(key: key);
  String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title!,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
