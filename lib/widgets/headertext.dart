import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headertext extends StatelessWidget {
  Headertext({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: GoogleFonts.blackOpsOne(fontSize: 22));
  }
}
