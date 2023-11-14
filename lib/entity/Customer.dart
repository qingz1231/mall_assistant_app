class Customer {
  String? customerId;
  String? customerName;
  String? username;
  String? password;
  String? address;
  String? tags;
  DateTime? dob;
  String? phone;
  String? gender;
  

  // Constructor
  Customer({
    this.customerId,
    this.customerName,
    this.username,
    this.password,
    this.address,
    this.tags,
    this.dob,
    this.phone,
    this.gender,
  });

  // Factory method to create a Customer instance from JSON
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      username: json['username'],
      password: json['password'],
      address: json['address'],
      tags: json['tags'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      phone: json['phone'],
      gender: json['gender'],
    );
  }

  // Convert Customer instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'customer_name': customerName,
      'username': username,
      'password': password,
      'address': address,
      'tags': tags,
      'dob': dob?.toIso8601String(),
      'phone': phone,
      'gender': gender,
    };
  }
}
