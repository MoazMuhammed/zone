import 'dart:convert';
/// id : 28
/// name : "hoss"
/// email : "hossamsss@gmail.com"
/// phone : "01151958782"
/// email_verified_at : ""
/// birthdate : ""
/// gender : ""
/// image : ""
/// address_id : ""
/// device_token : "cfIKLGHKTHWNEwQvp4x3DI:APA91bEGkvQT-ng1pVVVYXcRDzWrsDwkumDVpCdjpKklr-cDkSAml41M1zjaXYJFptrloTLRomGLuhaOfvCJQqjuzq_n497rQStzHOrMEnTD28V-axRT0wAMd592kwXgCrhKZWxX-usY"
/// created_at : "2023-09-18T17:48:42.000000Z"
/// updated_at : "2023-09-18T17:48:42.000000Z"
/// media : [""]

DataProfile dataProfileFromJson(String str) => DataProfile.fromJson(json.decode(str));
String dataProfileToJson(DataProfile data) => json.encode(data.toJson());
class DataProfile {
  DataProfile({
      num? id, 
      String? name, 
      String? email, 
      String? phone, 
      String? emailVerifiedAt, 
      String? birthdate, 
      String? gender, 
      String? image, 
      String? addressId, 
      String? deviceToken, 
      String? createdAt, 
      String? updatedAt, 
      List<String>? media,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _emailVerifiedAt = emailVerifiedAt;
    _birthdate = birthdate;
    _gender = gender;
    _image = image;
    _addressId = addressId;
    _deviceToken = deviceToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _media = media;
}

  DataProfile.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _emailVerifiedAt = json['email_verified_at'];
    _birthdate = json['birthdate'];
    _gender = json['gender'];
    _image = json['image'];
    _addressId = json['address_id'];
    _deviceToken = json['device_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _media = json['media'] != null ? json['media'].cast<String>() : [];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _emailVerifiedAt;
  String? _birthdate;
  String? _gender;
  String? _image;
  String? _addressId;
  String? _deviceToken;
  String? _createdAt;
  String? _updatedAt;
  List<String>? _media;
DataProfile copyWith({  num? id,
  String? name,
  String? email,
  String? phone,
  String? emailVerifiedAt,
  String? birthdate,
  String? gender,
  String? image,
  String? addressId,
  String? deviceToken,
  String? createdAt,
  String? updatedAt,
  List<String>? media,
}) => DataProfile(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  birthdate: birthdate ?? _birthdate,
  gender: gender ?? _gender,
  image: image ?? _image,
  addressId: addressId ?? _addressId,
  deviceToken: deviceToken ?? _deviceToken,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  media: media ?? _media,
);
  num get id => _id ?? 0;
  String get name => _name ?? '';
  String get email => _email ?? '';
  String get phone => _phone ?? '';
  String get emailVerifiedAt => _emailVerifiedAt ?? '';
  String get birthdate => _birthdate ?? '';
  String get gender => _gender ?? '';
  String get image => _image ?? '';
  String get addressId => _addressId ?? '';
  String get deviceToken => _deviceToken ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';
  List<String> get media => _media ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['email_verified_at'] = _emailVerifiedAt;
    map['birthdate'] = _birthdate;
    map['gender'] = _gender;
    map['image'] = _image;
    map['address_id'] = _addressId;
    map['device_token'] = _deviceToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['media'] = _media;
    return map;
  }

}