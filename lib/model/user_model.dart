import '../app.export.dart';

// UserInfo from stored json...
UserModel? userInfoFromStoredJson(String str) =>
    str.isEmpty ? null : UserModel.fromJson(json.decode(str));

// UserInfo to raw json (Json to json string)...
String userInfoToRawJson(UserModel userInfo) => json.encode(userInfo.toJson());

class UserModel {
  // User model's keys...
  static const String _kId = "user_id";
  static const String _kEmail = "email";
  static const String _kUserName = "username";
  static const String _kPassword = "password";

  UserModel({
    this.id,
    this.displayName = "",
    this.email = "",
    this.password = "",
  });

  // Vars...
  String? id, displayName, email, password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json[_kId],
        displayName: json[_kUserName] ?? "",
        email: json[_kEmail] ?? "",
        password: json[_kPassword],
      );

  // To json...
  Map<String, dynamic> toJson() => {
        _kId: id,
        _kUserName: displayName?.trim() ?? "",
        _kEmail: email?.trim() ?? "",
        _kPassword: password?.trim() ?? "",
      };

  // To login json...
  Map<String, dynamic> toLoginJson() => {
        _kUserName: email?.trim() ?? "",
        _kPassword: password?.trim() ?? "",
      };

  // To signUp json...
  Map<String, dynamic> toSignUpJson() => {
        _kEmail: email?.trim() ?? "",
        _kPassword: password?.trim() ?? "",
      };
}
