class SignupModel {
  String username = '';
  String emailid = '';
  String password = '';

  SignupModel(
      {required this.username, required this.emailid, required this.password});

  Map<String, dynamic> tojson() =>
      {"email": emailid, "username": username, "password": password};
}
