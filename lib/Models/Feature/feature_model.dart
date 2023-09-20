import 'dart:convert';
/// id : 1
/// shop_id : 4
/// category_id : 1
/// subcategory_id : 1
/// section_id : 5
/// name : "explicabo"
/// details : "Aliquid cumque et natus officiis fuga et. Necessitatibus aut explicabo ut ad iusto. Id corporis et quidem soluta ratione qui. Amet est accusamus sit fugiat enim rerum."
/// price : 965.42
/// active : 0
/// is_featured : 1
/// type : "ut"
/// tags : "Nihil aut nisi labore dolores reiciendis minima consequatur. Cumque est voluptates cum sit iure est rerum hic. Distinctio nemo id aliquid velit modi vel."
/// unit : "similique"
/// image : "/var/folders/9g/t7_m4mkj3j1b7758t7hb68z40000gn/T/5be7ef6476c317f34a424bd9b5ead5a0.png"
/// created_at : "2001-02-11T01:02:07.000000Z"
/// updated_at : "2015-12-02T08:14:22.000000Z"

FeatureModel featureModelFromJson(String str) => FeatureModel.fromJson(json.decode(str));
String featureModelToJson(FeatureModel data) => json.encode(data.toJson());
class FeatureModel {
  FeatureModel({
      num? id, 
      num? shopId, 
      num? categoryId, 
      num? subcategoryId, 
      num? sectionId, 
      String? name, 
      String? details, 
      num? price, 
      num? active, 
      num? isFeatured, 
      String? type, 
      String? tags, 
      String? unit, 
      String? image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _shopId = shopId;
    _categoryId = categoryId;
    _subcategoryId = subcategoryId;
    _sectionId = sectionId;
    _name = name;
    _details = details;
    _price = price;
    _active = active;
    _isFeatured = isFeatured;
    _type = type;
    _tags = tags;
    _unit = unit;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  FeatureModel.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _categoryId = json['category_id'];
    _subcategoryId = json['subcategory_id'];
    _sectionId = json['section_id'];
    _name = json['name'];
    _details = json['details'];
    _price = json['price'];
    _active = json['active'];
    _isFeatured = json['is_featured'];
    _type = json['type'];
    _tags = json['tags'];
    _unit = json['unit'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _shopId;
  num? _categoryId;
  num? _subcategoryId;
  num? _sectionId;
  String? _name;
  String? _details;
  num? _price;
  num? _active;
  num? _isFeatured;
  String? _type;
  String? _tags;
  String? _unit;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
FeatureModel copyWith({  num? id,
  num? shopId,
  num? categoryId,
  num? subcategoryId,
  num? sectionId,
  String? name,
  String? details,
  num? price,
  num? active,
  num? isFeatured,
  String? type,
  String? tags,
  String? unit,
  String? image,
  String? createdAt,
  String? updatedAt,
}) => FeatureModel(  id: id ?? _id,
  shopId: shopId ?? _shopId,
  categoryId: categoryId ?? _categoryId,
  subcategoryId: subcategoryId ?? _subcategoryId,
  sectionId: sectionId ?? _sectionId,
  name: name ?? _name,
  details: details ?? _details,
  price: price ?? _price,
  active: active ?? _active,
  isFeatured: isFeatured ?? _isFeatured,
  type: type ?? _type,
  tags: tags ?? _tags,
  unit: unit ?? _unit,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id ?? 0;
  num get shopId => _shopId ?? 0;
  num get categoryId => _categoryId ?? 0;
  num get subcategoryId => _subcategoryId ?? 0;
  num get sectionId => _sectionId ?? 0;
  String get name => _name ?? '';
  String get details => _details ?? '';
  num get price => _price ?? 0;
  num get active => _active ?? 0;
  num get isFeatured => _isFeatured ?? 0;
  String get type => _type ?? '';
  String get tags => _tags ?? '';
  String get unit => _unit ?? '';
  String get image => _image ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['category_id'] = _categoryId;
    map['subcategory_id'] = _subcategoryId;
    map['section_id'] = _sectionId;
    map['name'] = _name;
    map['details'] = _details;
    map['price'] = _price;
    map['active'] = _active;
    map['is_featured'] = _isFeatured;
    map['type'] = _type;
    map['tags'] = _tags;
    map['unit'] = _unit;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}