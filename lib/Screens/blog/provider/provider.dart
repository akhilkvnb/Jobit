import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/blog/model/getmodel.dart';
import 'package:jobit/Screens/blog/model/model.dart';
import 'package:jobit/services/api_blog.dart';
import 'package:jobit/utilitty/utility.dart';

class BlogProvider with ChangeNotifier {
  // BlogProvider() {
  //   getListBlogs();
  // }
  bool isloading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

////////////-------------PostBlog------------------////////////

  Future<void> blogadd(BuildContext context) async {
    final blogData = BlogModel(
      title: titleController.text,
      content: contentController.text,
    );
    final response = await ApiBlog().blogPostfunction(blogData);
    if (response != null) {
      if (response.content != null) {
        log(response.content.toString());

        Utility.displaySnackbar(
            context: context, msg: "Blog added Successfully");
        getListBlogs();
        Navigator.of(context).pop();
        notifyListeners();
      } else {
        Utility.displaySnackbar(
            context: context, msg: response.message ?? "something went wrong!");
      }
    } else {
      Utility.displaySnackbar(context: context, msg: "No Network Found!");
    }
  }

////////--------------ReadBlog----------------------//////////

  Future<List<BlogGetModel>?> getListBlogs() async {
    final response = await ApiBlog().getBlog();
    if (response != null) {
      return response;
    }
    return null;
  }
}
