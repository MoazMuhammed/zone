import 'dart:convert';
/// token : "10|GDH01CefP8M9qfpn66xtoNmEYoZhg3TGfNdcCwcY"
/// status : 200
/// message : "you have logged in successfully"

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());
class LoginModel {
  LoginModel({
      this.token, 
      this.status, 
      this.message,});

  LoginModel.fromJson(dynamic json) {
    token = json['token'];
    status = json['status'];
    message = json['message'];
  }
  String? token;
  int? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}