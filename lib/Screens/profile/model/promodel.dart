import 'dart:io';

class ProfileModel {
  final String? firstname;
  final String? lastname;
  final String? dateOfBirth;
  final File? profilephoto;
  final File? cv;
  final String? about;
  final String? message;

  ProfileModel(
      {this.firstname,
      this.lastname,
      this.dateOfBirth,
      this.profilephoto,
      this.cv,
      this.about,
      this.message});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      firstname: json["first_name"] ?? '',
      lastname: json["last_name"] ?? '',
      dateOfBirth: json["date_of_birth"] ?? '',
      profilephoto: json["profile_photo"],
      cv: json["cv"] ?? '',
      about: json["about"] ?? '');

  String getFileName(File file) => file.path.split('/').last;
}
