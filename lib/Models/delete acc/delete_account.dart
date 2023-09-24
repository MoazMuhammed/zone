import 'dart:convert';
/// message : "your account has been deleted successfully"

DeleteAccount deleteAccountFromJson(String str) => DeleteAccount.fromJson(json.decode(str));
String deleteAccountToJson(DeleteAccount data) => json.encode(data.toJson());
class DeleteAccount {
  DeleteAccount({
      String? message,}){
    _message = message;
}

  DeleteAccount.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
DeleteAccount copyWith({  String? message,
}) => DeleteAccount(  message: message ?? _message,
);
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}