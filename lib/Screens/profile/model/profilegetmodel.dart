import 'dart:convert';

// ProfileGetModel profileGetModelFromJson(String str) =>
//     ProfileGetModel.fromJson(json.decode(str));

class ProfileGetModel {
  ProfileGetModel(
      {this.email,
      this.username,
      this.userpro,
      this.experience,
      this.education,
      this.message});

  String? email;
  String? username;
  Userpro? userpro;
  List<dynamic>? experience;
  List<dynamic>? education;
  String? message;

  factory ProfileGetModel.fromJson(Map<String, dynamic> json) =>
      ProfileGetModel(
        email: json["email"],
        username: json["username"],
        userpro: Userpro.fromJson(json["userpro"]),
        experience: List<dynamic>.from(json["experience"].map((x) => x)),
        education: List<dynamic>.from(json["education"].map((x) => x)),
      );
}

class Userpro {
  Userpro({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.profilePhoto,
    this.cv,
    this.about,
    this.user,
  });

  int? id;
  String? firstName;
  String? lastName;
  DateTime? dateOfBirth;
  String? profilePhoto;
  String? cv;
  String? about;
  int? user;

  factory Userpro.fromJson(Map<String, dynamic> json) => Userpro(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        profilePhoto: json["profile_photo"],
        cv: json["cv"],
        about: json["about"],
        user: json["user"],
      );
}
