import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mall_assistant_app/service/bookmark_service.dart';
import 'package:mall_assistant_app/user_preference.dart';
import '../api/mysql.dart';
import '../entity/Customer.dart';
import '../entity/Voucher.dart';


class VoucherService {
  static Future<List<Voucher>> getVouchers(String mallid) async {
    try {

      var map = Map<String, dynamic>();
      
      map['mall_id'] = mallid;
      final response = await http.post(Uri.parse(API.getAllVoucher), body: map);


      if (200 == response.statusCode) {
        List<Voucher> list = parseResponse(response.body);
        return list;
      } else {
        print("Error: ${response.statusCode}");
        throw Exception(
            'Failed to load Vouchers. HTTP Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in get Voucher: $e");
      return [];
    }
  }

  static List<Voucher> parseResponse(String responseBody) {
    try {
      final parsed = json.decode(responseBody);


      if (parsed['data'] is List) {

        List<Voucher> list = (parsed['data'] as List)
            .map<Voucher>((json) => Voucher.fromJson(json))
            .toList();
        return list;
      } else {

        print("Invalid data format: 'data' is not a list.");
        return [];
      }
    } catch (e) {
      // Handle any parsing errors
      print("Error parsing response: $e");
      return [];
    }
  }

  // static List<Voucher> parseResponse(String responseBody){
  //   final parsed = json.decode(responseBody);
  //   return parsed.map<Voucher>((json) => Voucher.fromJson(json)).toList();
  // }

  static Future<Voucher> getVoucherById(String i) async {
    try {
      var map = Map<String, dynamic>();

      map['voucher_id'] = i;
      final response = await http.post(Uri.parse(API.getVoucherById), body: map);

      if (200 == response.statusCode) {
        
        Voucher voucher = parseResponse(response.body)[0];

        
          // You may want to return a default UserVoucher or throw an exception
          return voucher;
        }

        
      else {
        print("Response not 200");
        return Voucher();
      }
    } catch (e) {
      print("Error Appeared");
      return Voucher();
    }
  }
}
