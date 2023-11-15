import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mall_assistant_app/entity/Shop.dart';
import 'package:mall_assistant_app/entity/UserShop.dart';
import 'package:mall_assistant_app/service/shop_service.dart';
import 'package:mall_assistant_app/user_preference.dart';
import '../api/mysql.dart';
import '../entity/Bookmark.dart';

class BookmarkService{
  
static Future<bool> shopIsSaved(String itemId,String customerId ) async {
    try {
      var map = Map<String,dynamic>();
      
   
      map['customer_id'] = customerId;
      map['item_id'] = itemId;
      map['category'] = '1';
      final response = await http.post(Uri.parse(API.checkBookmark),body:map);

      if(200 == response.statusCode){
        
        bool saved = parseStateResponse(response.body);
    
        return saved;
      }else{
        print("Response not 200");
        return true;
      }
    }catch(e){
      print("Error Appeared");
      return true;
    }
  }

  
  static bool parseStateResponse(String responseBody) {
  try {
    final parsed = json.decode(responseBody);

    // Check if the 'data' key exists and is a list
    if (parsed['exist'] is bool) {
      // Extract the list of Bookmarks
     
      return parsed['exist'];
    } else {
      // Handle the case where 'data' is not a list
      print("Invalid data format: 'data' is not a list.");
      return true;
    }
  } catch (e) {
    // Handle any parsing errors
    print("Error parsing response: $e");
    return true;
  }
}


static List<Bookmark> parseResponse(String responseBody) {
  try {

    final parsed = json.decode(responseBody);

    // Check if the 'data' key exists and is a list
    if (parsed['data'] is List) {
      // Extract the list of Bookmarks

      List<Bookmark> list = (parsed['data'] as List).map<Bookmark>((json) => Bookmark.fromJson(json)).toList();
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


static Future<List<UserShop>> getBookmarks() async {
    try {


      var customer = await RememberUserPrefs.loadCurrentUser();
      var map = Map<String, dynamic>();

       map['customer_id'] = customer.customerId;

      map['category'] = '1';

      final response = await http.post(Uri.parse(API.getAllBookmark), body: map);

      if (200 == response.statusCode) {

        List<Bookmark> list = parseResponse(response.body);
   
        List<UserShop> items = await convertShop(list);
        print(items.length);
        
        return items;
      } else {
        print("Error: ${response.statusCode}");
        throw Exception(
            'Failed to load shops. HTTP Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in get bookmark: $e");
      return [];
    }
  }


  static Future<List<UserShop>> convertShop(List<Bookmark> bookmarks) async{

    try{
    List<UserShop> shops = [];
   
    for(int i = 0;i<bookmarks.length;i++){
   
     
       UserShop shop = await ShopService.getShopById(bookmarks[i].itemId!);
       shops.add(shop);
  
    }
    return shops;
    }catch (e){
      print("Error in loop: $e");
      return [];
    }
  }
  

    static void save(String customerid, String itemid, String category) async {
    try {
      var map = Map<String,dynamic>();
      
      map['customer_id'] = customerid;
      map['item_id'] = itemid;
      map['category'] = category;
      final response = await http.post(Uri.parse(API.saveBookmark),body:map);

      if(200 == response.statusCode){
          Fluttertoast.showToast(msg: "Bookmark added");
          return;
      }else{
        print("Response not 200");

      }
    }catch(e){
      print("Error Appeared");

    }
  }

  static void remove(String customerid, String itemid, String category) async {
    try {
      var map = Map<String,dynamic>();
      
      map['customer_id'] = customerid;
      map['item_id'] = itemid;
      map['category'] = category;
      final response = await http.post(Uri.parse(API.removeBookmark),body:map);

      if(200 == response.statusCode){
          Fluttertoast.showToast(msg: "Bookmark removed");
          return;
      }else{
        print("Response not 200");

      }
    }catch(e){
      print("Error Appeared");

    }
  }

  
}