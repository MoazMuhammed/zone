import 'dart:convert';
/// id : 1
/// name : "molestiae"
/// image : "/var/folders/9g/t7_m4mkj3j1b7758t7hb68z40000gn/T/8e85403d03d10ecf9fcfb78c9c488e46.png"
/// created_at : "2016-03-26T11:39:52.000000Z"
/// updated_at : "2014-03-25T15:33:28.000000Z"

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));
String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());
class CategoriesModel {
  CategoriesModel({
      num? id, 
      String? name, 
      String? image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CategoriesModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
CategoriesModel copyWith({  num? id,
  String? name,
  String? image,
  String? createdAt,
  String? updatedAt,
}) => CategoriesModel(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id ?? 0;
  String get name => _name ?? '';
  String get image => _image ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}