class Voucher {
  String? voucherId;
  String? mallId;
  String? voucherName;
  String? voucherDesc;
  String? tags;
  int? voucherCount;
  bool? active;
  DateTime? dateEnd;
  DateTime? dateStart;
  DateTime? dateCreated;

  Voucher({
    this.voucherId,
    this.mallId,
    this.voucherName,
    this.voucherDesc,
    this.tags,
    this.voucherCount,
    this.active,
    this.dateEnd,
    this.dateStart,
    this.dateCreated,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      voucherId: json['voucher_id'],
      mallId: json['mall_id'],
      voucherName: json['voucher_name'],
      voucherDesc: json['voucher_desc'],
      tags: json['tags'],
      voucherCount: int.parse(json['voucher_count']),
      active: json['active'] == 'true'?true:false,
      dateEnd: DateTime.parse(json['dateEnd']),
      dateStart: DateTime.parse(json['dateStart']),
      dateCreated: DateTime.parse(json['dateCreated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voucher_id': voucherId,
      'mall_id': mallId,
      'voucher_name': voucherName,
      'voucher_desc': voucherDesc,
      'tags': tags,
      'voucher_count': voucherCount,
      'active': active,
      'dateEnd': dateEnd?.toIso8601String(),
      'dateStart': dateStart?.toIso8601String(),
      'dateCreated': dateCreated?.toIso8601String(),
    };
  }
}
