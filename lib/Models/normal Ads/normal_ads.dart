import 'dart:convert';
/// id : 3
/// vendor_id : 5
/// shop_id : 10
/// name : "velit"
/// duration : 4
/// budget : 80.75
/// image : "http://zone.volume-realestate.com/1.png"
/// active : 1
/// is_premuim : 0
/// created_at : "1979-10-09T14:00:17.000000Z"
/// updated_at : "2008-09-23T13:18:47.000000Z"

NormalAds normalAdsFromJson(String str) => NormalAds.fromJson(json.decode(str));
String normalAdsToJson(NormalAds data) => json.encode(data.toJson());
class NormalAds {
  NormalAds({
      this.id, 
      this.vendorId, 
      this.shopId, 
      this.name, 
      this.duration, 
      this.budget, 
      this.image, 
      this.active, 
      this.isPremuim, 
      this.createdAt, 
      this.updatedAt,});

  NormalAds.fromJson(dynamic json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    shopId = json['shop_id'];
    name = json['name'];
    duration = json['duration'];
    budget = json['budget'];
    image = json['image'];
    active = json['active'];
    isPremuim = json['is_premuim'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? vendorId;
  int? shopId;
  String? name;
  int? duration;
  double? budget;
  String? image;
  int? active;
  int? isPremuim;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['shop_id'] = shopId;
    map['name'] = name;
    map['duration'] = duration;
    map['budget'] = budget;
    map['image'] = image;
    map['active'] = active;
    map['is_premuim'] = isPremuim;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}