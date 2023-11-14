import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mall_assistant_app/service/bookmark_service.dart';
import 'package:mall_assistant_app/user_preference.dart';
import '../api/mysql.dart';
import '../entity/Customer.dart';
import '../entity/Shop.dart';
import '../entity/UserShop.dart';

class ShopService {
  static Future<List<Shop>> getShops(String i) async {
    try {
      print("Hello");
      var map = Map<String, dynamic>();

      map['mall_id'] = i;
      final response = await http.post(Uri.parse(API.getShops), body: map);
      print("finish posting");

      if (200 == response.statusCode) {
        List<Shop> list = parseResponse(response.body);
        return list;
      } else {
        print("Error: ${response.statusCode}");
        throw Exception(
            'Failed to load shops. HTTP Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in get shop: $e");
      return [];
    }
  }

  static List<Shop> parseResponse(String responseBody) {
    try {
      final parsed = json.decode(responseBody);

      // Check if the 'data' key exists and is a list
      if (parsed['data'] is List) {
        // Extract the list of shops
        List<Shop> list = (parsed['data'] as List)
            .map<Shop>((json) => Shop.fromJson(json))
            .toList();
        return list;
      } else {
        // Handle the case where 'data' is not a list
        print("Invalid data format: 'data' is not a list.");
        return [];
      }
    } catch (e) {
      // Handle any parsing errors
      print("Error parsing response: $e");
      return [];
    }
  }

  // static List<Shop> parseResponse(String responseBody){
  //   final parsed = json.decode(responseBody);
  //   return parsed.map<Shop>((json) => Shop.fromJson(json)).toList();
  // }

  static Future<UserShop> getShopById(String i) async {
    try {
      var map = Map<String, dynamic>();

      map['shop_id'] = i;
      final response = await http.post(Uri.parse(API.getShopById), body: map);

      if (200 == response.statusCode) {
        Future<Customer> customerFuture = RememberUserPrefs.loadCurrentUser();
        Shop shop = parseResponse(response.body)[0];

        try {
          Customer customer = await RememberUserPrefs.loadCurrentUser();
          bool saved =
              await BookmarkService.shopIsSaved(i, customer.customerId!);

          UserShop userShop = UserShop(shop: shop, isSaved: saved);
          return userShop;
        } catch (e) {
          // Handle errors
          print("Error: $e");
          // You may want to return a default UserShop or throw an exception
          return UserShop(shop: shop, isSaved: false);
        }

        
      } else {
        print("Response not 200");
        return UserShop();
      }
    } catch (e) {
      print("Error Appeared");
      return UserShop();
    }
  }
}
