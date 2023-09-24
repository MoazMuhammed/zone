import 'dart:convert';
/// status : 200
/// message : "you have logged in successfully"

UpdateDataUserModel updateDataUserModelFromJson(String str) => UpdateDataUserModel.fromJson(json.decode(str));
String updateDataUserModelToJson(UpdateDataUserModel data) => json.encode(data.toJson());
class UpdateDataUserModel {
  UpdateDataUserModel({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  UpdateDataUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
UpdateDataUserModel copyWith({  num? status,
  String? message,
}) => UpdateDataUserModel(  status: status ?? _status,
  message: message ?? _message,
);
  num get status => _status ?? 0;
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}