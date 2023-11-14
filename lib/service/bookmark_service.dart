import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
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



  

    static void register(String name, String username, String password) async {
    try {
      var map = Map<String,dynamic>();
      
      map['name'] = name;
      map['username'] = username;
      map['password'] = password;
      final response = await http.post(Uri.parse(API.register),body:map);

      if(200 == response.statusCode){
          print("success");
          return;
      }else{
        print("Response not 200");

      }
    }catch(e){
      print("Error Appeared");

    }
  }

  
}