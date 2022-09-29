class SignInResponseModel {
  SignInResponseModel({this.accessToken, this.refreshToken, this.message});

  final String? accessToken;
  final String? refreshToken;
  final String? message;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
          accessToken: json["access"],
          refreshToken: json["refresh"],
          message: json["message"]);

  Map<String, dynamic> toJson() =>
      {"access": accessToken, "refresh": refreshToken};
}
