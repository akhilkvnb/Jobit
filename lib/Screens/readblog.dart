import 'package:flutter/material.dart';

class ScreenReadBlog extends StatelessWidget {
  const ScreenReadBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 15, 15, 15),
                      blurRadius: 5.0,
                      spreadRadius: 5)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
