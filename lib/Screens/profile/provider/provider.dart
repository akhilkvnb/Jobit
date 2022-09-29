import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jobit/Screens/profile/model/promodel.dart';
import 'package:jobit/services/api_profilepost.dart';
import 'package:jobit/utilitty/utility.dart';

class ProfileProvider with ChangeNotifier {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  File? imageFile;
  File? cvFile;
  ProfileModel? profiledetails;

///////////----------------ProfilePost---------------//////////////

  Future<void> savebutton(context) async {
    final profileData = ProfileModel(
      firstname: firstnameController.text,
      lastname: lastnameController.text,
      dateOfBirth: '2000-04-12',
      profilephoto: imageFile!,
      cv: imageFile!,
      about: aboutController.text,
    );
    log('lllllllllllllll');
    ProfileModel? response =
        await Createprofile().profilepostfunction(profileData, context);
    if (response != null) {
      if (response.lastname != null) {
        log('hiiiiiii');
        profiledetails = response;
      } else {
        Utility.displaySnackbar(context: context, msg: response.message!);
      }
    } else {
      Utility.displaySnackbar(context: context, msg: 'no Network Found!');
    }
  }

  pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    imageFile = File(image.path);
    notifyListeners();
  }

  void datePicker(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2025));
    if (pickedDate != null) {
      String formatDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
      controller.text = formatDate;
    }
  }

//////----------------ProfileRead-------------------////////

  Future<List<ProfileModel>?> getProfileList() async {
    final response = await ;
    if (response != null) {
      return response;
    }
    return null;
  }
}
