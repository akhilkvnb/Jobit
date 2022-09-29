import 'package:flutter/material.dart';
import 'package:jobit/Screens/blog/model/getmodel.dart';

class ScreenReadBlog extends StatelessWidget {
  ScreenReadBlog({Key? key, required this.user}) : super(key: key);
  BlogGetModel user;
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
              child: ListTile(
                title: Text(
                  user.title!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(user.content!),
              ),
            ),
          )
        ],
      ),
    );
  }
}
