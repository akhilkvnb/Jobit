import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/home/model/jobmodel.dart';
import 'package:jobit/services/api_jobpost.dart';
import 'package:jobit/utilitty/utility.dart';

class JobProvider with ChangeNotifier {
  bool isloading = false;
  TextEditingController categoryController = TextEditingController();
  TextEditingController jobtitleController = TextEditingController();
  TextEditingController jobdescriptionController = TextEditingController();

////////////-------------PostJobs------------------////////////

  Future<void> jobadd(BuildContext context) async {
    final jobData = JobModel(
      category: categoryController.text,
      jobtitle: jobtitleController.text,
      jobdescription: jobdescriptionController.text,
    );
    final response = await ApiJob().jobPostfunction(jobData);
    if (response != null) {
      if (response.category != null) {
        log(response.category.toString());

        Utility.displaySnackbar(
            context: context, msg: "Job added Successfully");

        Navigator.of(context).pop();
      } else {
        Utility.displaySnackbar(
            context: context, msg: response.message ?? "something went wrong!");
      }
    } else {
      Utility.displaySnackbar(context: context, msg: "No Network Found!");
    }
  }
//////////-------------JobRead--------------------/////////////

  // Future<List<JobModel>?> getListBlogs() async {
  //   final response = await ApiJob().getJob();
  //   if (response != null) {
  //     return response;
  //   }
  //   return null;
  // }
}
