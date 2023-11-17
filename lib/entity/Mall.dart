class Mall {
  int mallId;
  String mallName;
  String mallLocation;
  String mallDesc;
  String mallEmail;
  String mallPhone;
  String mallMap;
  String mallLogo;

  Mall({
    required this.mallId,
    required this.mallName,
    required this.mallLocation,
    required this.mallDesc,
    required this.mallEmail,
    required this.mallPhone,
    required this.mallMap,
    required this.mallLogo,
  });

  factory Mall.fromJson(Map<String, dynamic> json) {
    return Mall(
      mallId: json['mall_id'],
      mallName: json['mall_name'],
      mallLocation: json['mall_location'],
      mallDesc: json['mall_desc'],
      mallEmail: json['mall_email'],
      mallPhone: json['mall_phone'],
      mallMap: json['mall_map'],
      mallLogo: json['mall_logo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mall_id': mallId,
      'mall_name': mallName,
      'mall_location': mallLocation,
      'mall_desc': mallDesc,
      'mall_email': mallEmail,
      'mall_phone': mallPhone,
      'mall_map': mallMap,
      'mall_logo': mallLogo,
    };
  }
}
