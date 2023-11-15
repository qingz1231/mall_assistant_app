class Shop{
  String? id;
  String? shopName;
  String? shopLocation;
  String? shopDesc;
  String? imageUrl;
  String? tags;

  Shop({this.id, this.shopName,this.shopLocation,this.shopDesc,this.imageUrl,this.tags});

  factory Shop.fromJson(Map<String,dynamic> json){
    return Shop(
      id: json['shop_id'] as String,
      shopName: json['shop_name'] as String,
      shopLocation: json['shop_location'] as String,
      shopDesc: json['shop_desc'] as String,
      imageUrl: json['image_url'] as String,
      tags: json['tags'] as String,

    );
  }
}