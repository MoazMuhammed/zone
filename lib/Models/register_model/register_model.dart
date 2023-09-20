import 'dart:convert';
/// message : "User successfully registered"
/// user : {"name":"moaz","email":"moaz@gmail.com","phone":"01022741849","gender":"male","device_token":"1","updated_at":"2023-09-18T02:48:39.000000Z","created_at":"2023-09-18T02:48:39.000000Z","id":11}

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());
class RegisterModel {
  RegisterModel({
      String? message, 
      User? user,}){
    _message = message;
    _user = user;
}

  RegisterModel.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _message;
  User? _user;
RegisterModel copyWith({  String? message,
  User? user,
}) => RegisterModel(  message: message ?? _message,
  user: user ?? _user,
);
  String? get message => _message;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// name : "moaz"
/// email : "moaz@gmail.com"
/// phone : "01022741849"
/// gender : "male"
/// device_token : "1"
/// updated_at : "2023-09-18T02:48:39.000000Z"
/// created_at : "2023-09-18T02:48:39.000000Z"
/// id : 11

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? name, 
      String? email, 
      String? phone, 
      String? gender, 
      String? deviceToken, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _name = name;
    _email = email;
    _phone = phone;
    _gender = gender;
    _deviceToken = deviceToken;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _gender = json['gender'];
    _deviceToken = json['device_token'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _email;
  String? _phone;
  String? _gender;
  String? _deviceToken;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
User copyWith({  String? name,
  String? email,
  String? phone,
  String? gender,
  String? deviceToken,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => User(  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  gender: gender ?? _gender,
  deviceToken: deviceToken ?? _deviceToken,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String get name => _name ?? '';
  String get email => _email ?? '';
  String get phone => _phone ?? '';
  String get gender => _gender ?? '';
  String get deviceToken => _deviceToken ?? '';
  String get updatedAt => _updatedAt ?? '';
  String get createdAt => _createdAt ?? '';
  num get id => _id ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['device_token'] = _deviceToken;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}