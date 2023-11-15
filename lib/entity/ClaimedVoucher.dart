class ClaimedVoucher {
  String? mallId;
  String? voucherId;
  String? customerId;
  DateTime? timestamp;
  bool? claimed;
  bool? alert;

  ClaimedVoucher({
    this.mallId,
    this.voucherId,
    this.customerId,
    this.timestamp,
    this.claimed,
    this.alert,
  });

  factory ClaimedVoucher.fromJson(Map<String, dynamic> json) {
    return ClaimedVoucher(
      mallId: json['mall_id'],
      voucherId: json['voucher_id'],
      customerId: json['customer_id'],
      timestamp: DateTime.parse(json['timestamp']),
      claimed: json['claimed'] == 'true'?true:false,
      alert: json['alert'] == 'true'?true:false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mall_id': mallId,
      'voucher_id': voucherId,
      'customer_id': customerId,
      'timestamp': timestamp?.toIso8601String(),
      'claimed': claimed,
      'alert': alert,
    };
  }
}
