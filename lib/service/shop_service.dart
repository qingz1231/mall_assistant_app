import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api/mysql.dart';
import '../entity/Shop.dart';

class ShopService{
  

  static Future<List<Shop>> getShops(String i) async {
    try {
      print("Hello");
      var map = Map<String,dynamic>();
      
      map['mall_id'] = i;
      final response = await http.post(Uri.parse(API.getShops),body:map);
      print("finish posting");

      if(200 == response.statusCode){
     
        List<Shop> list = parseResponse(response.body);
        return list;
      }else{
        print("Error: ${response.statusCode}");
        throw Exception('Failed to load shops. HTTP Status Code: ${response.statusCode}');
      }
    }catch(e){
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
      List<Shop> list = (parsed['data'] as List).map<Shop>((json) => Shop.fromJson(json)).toList();
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

  static Future<Shop> getShopById(int i) async {
    try {
      var map = Map<String,dynamic>();
      
      map['shop_id'] = i;
      final response = await http.post(Uri.parse(API.getShopById),body:map);

      if(200 == response.statusCode){
        print("Result not found");
        Shop shop = parseResponse(response.body)[0];
        return Shop();
      }else{
        print("Response not 200");
        return Shop();
      }
    }catch(e){
      print("Error Appeared");
      return Shop();
    }
  }

  
}