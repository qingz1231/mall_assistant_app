import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mall_assistant_app/user_preference.dart';
import '../api/mysql.dart';
import '../entity/Customer.dart';

class CustomerService{
  

  


static List<Customer> parseResponse(String responseBody) {
  try {
    final parsed = json.decode(responseBody);

    // Check if the 'data' key exists and is a list
    if (parsed['data'] is List) {
      // Extract the list of Customers
      List<Customer> list = (parsed['data'] as List).map<Customer>((json) => Customer.fromJson(json)).toList();
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



  static Future<void> login(String username, String password) async {
    try {
      var map = Map<String,dynamic>();
      
      map['username'] = username;
      map['password'] = password;
      final response = await http.post(Uri.parse(API.login),body:map);

      if(200 == response.statusCode){


        
        List<Customer> customers = parseResponse(response.body);
        if(customers.isNotEmpty){
          Customer customer = customers[0];
          await RememberUserPrefs.saveRememberUser(customer);
          Fluttertoast.showToast(msg:"Login successfully");
        }

        else{
          Fluttertoast.showToast(msg:"Invalid credential");
        }

        

        


      }else{
        Fluttertoast.showToast(msg:"Error 404");
   
      }
    }catch(e){
      Fluttertoast.showToast(msg:"Error appeared");
   
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