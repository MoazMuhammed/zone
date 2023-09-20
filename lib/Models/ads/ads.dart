import 'dart:convert';
/// id : 1
/// vendor_id : 1
/// shop_id : 3
/// name : "quia"
/// duration : 9
/// budget : 12.67
/// image : "https://zone.volume-realestate.com/1.png"
/// active : 1
/// is_premuim : 1
/// created_at : "1971-11-06T03:44:09.000000Z"
/// updated_at : "1976-09-09T05:58:47.000000Z"

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));
String adsToJson(Ads data) => json.encode(data.toJson());
class Ads {
  Ads({
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

  Ads.fromJson(dynamic json) {
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