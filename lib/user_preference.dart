import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'entity/Customer.dart';

class RememberUserPrefs {
  static Future<void> saveRememberUser(Customer custInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String custJsonData = jsonEncode(custInfo.toJson());
    await preferences.setString("currentUser", custJsonData);
  }

  static Future<Customer> loadCurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // Retrieve the user information as a JSON string
    String? currentUserJson = preferences.getString('currentUser');

    // If the 'currentUser' key is not found or the value is null, return a default Customer object
    if (currentUserJson == null) {
      print("lmao");
      return Customer(); // You may want to define a default constructor for Customer
    }

    // Parse the JSON string and create a Customer object
    Map<String, dynamic> currentUserMap = jsonDecode(currentUserJson);
    Customer currentUser = Customer.fromJson(currentUserMap);

    return currentUser;
  }

  static Future<void> updateCurrentUser(Customer newUserInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String custJsonData = jsonEncode(newUserInfo.toJson());
    await preferences.setString("currentUser", custJsonData);
  }

  static Future<void> deleteCurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentUser");
  }
}
