import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jobit/Screens/profile/model/promodel.dart';
import 'package:jobit/Screens/profile/view/profile.dart';
import 'package:jobit/services/api_profilepost.dart';
import 'package:jobit/utilitty/utility.dart';
import '../model/profilegetmodel.dart';

class ProfileProvider with ChangeNotifier {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  File? imageFile;
  File? cvFile;
  // ProfileModel? profiledetails;

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
    log('lllllllllllllll99999');
    ProfileModel? response = await Createprofile().profilepostfunction(
      profileData,
    );
    if (response != null) {
      log('ppp');

      if (response.message == 'success') {
        log('hiiiiiii');
        Utility.displaySnackbar(
            context: context, msg: "Profile added Successfully");
        getProfileList();
        log('3we3');
        // Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScreenProfile()));
        notifyListeners();
        // profiledetails = response;

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

  Future<ProfileGetModel?> getProfileList() async {
    final response = await Createprofile().getProfile();
    if (response != null) {
      if (response.message != null) {
        throw response.message!;
      }
      return response;
    }
    return null;
  }
}
