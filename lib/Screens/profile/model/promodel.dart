import 'dart:io';

class ProfileModel {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? dateOfBirth;
  final File? profilephoto;
  final File? cv;
  final String? about;
  final String? message;

  ProfileModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.dateOfBirth,
      this.profilephoto,
      this.cv,
      this.about,
      this.message});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      id: json["id"],
      firstname: json["first_name"],
      lastname: json["last_name"],
      dateOfBirth: json["date_of_birth"],
      profilephoto: json["profile_photo"],
      cv: json["cv"],
      about: json["about"]);

  // Map<String, dynamic> tojson() => {
  //       "first_name": firstname,
  //       "last_name": lastname,
  //       "date_of_birth ": dateOfBirth,
  //       "profile_photo  ": profilephoto,
  //       "cv": cv,
  //       "about": about,
  //     };

  // Map<String, dynamic> toFormData() {
  //   return {
  //     "first_name": firstname,
  //     "last_name": lastname,
  //     "date_of_birth ": dateOfBirth,
  //     "profile_photo  ": MultipartFile.fromFile(profilephoto!.path,
  //         filename: profilephoto!.path.split('/').last),
  //     "cv": MultipartFile.fromFile(cv!.path,
  //         filename: getFileName(profilephoto!)),
  //     "about": about
  //   };
  // }

  String getFileName(File file) => file.path.split('/').last;
}
