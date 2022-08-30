import 'package:flutter/material.dart';

class BottmNavActiveWrapper extends StatelessWidget {
  const BottmNavActiveWrapper({Key? key, required this.icon}) : super(key: key);
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: const Color.fromARGB(255, 11, 6, 26),
          boxShadow: const [BoxShadow(blurRadius: 5)]),
      child: icon,
    );
  }
}
