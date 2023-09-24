import 'dart:convert';
/// id : 1
/// name : "West Velmafort"
/// created_at : "1994-04-29T15:00:00.000000Z"
/// updated_at : "2000-09-06T14:00:00.000000Z"

CitiesModel citiesModelFromJson(String str) => CitiesModel.fromJson(json.decode(str));
String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());
class CitiesModel {
  CitiesModel({
      num? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CitiesModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
CitiesModel copyWith({  num? id,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => CitiesModel(  id: id ?? _id,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id ?? 0;
  String? get name => _name ?? '';
  String? get createdAt => _createdAt ?? '';
  String? get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}