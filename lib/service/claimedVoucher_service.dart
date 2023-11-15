import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mall_assistant_app/entity/ClaimedVoucher.dart';
import 'package:mall_assistant_app/entity/Shop.dart';
import 'package:mall_assistant_app/entity/UserShop.dart';
import 'package:mall_assistant_app/service/shop_service.dart';
import 'package:mall_assistant_app/service/voucher_service.dart';
import 'package:mall_assistant_app/user_preference.dart';
import '../api/mysql.dart';
import '../entity/Customer.dart';
import '../entity/Voucher.dart';
import '../entity/Voucher.dart';

class ClaimedVoucherService {
  static Future<bool> voucherIsSaved(
      String voucherId, String customerId) async {
    try {
      var map = Map<String, dynamic>();

      map['customer_id'] = customerId;
      map['voucher_id'] = voucherId;

      final response = await http.post(Uri.parse(API.checkSaved), body: map);

      if (200 == response.statusCode) {
        bool saved = parseStateResponse(response.body);

        return saved;
      } else {
        print("Response not 200");
        return false;
      }
    } catch (e) {
      print("Error Appeared");
      return false;
    }
  }

  static Future<List<Voucher>> getAllClaimed() async {
    try {
     
      var map = Map<String, dynamic>();
      var map2 = Map<String, dynamic>();

      Customer customer = await  RememberUserPrefs.loadCurrentUser();

      map['customer_id'] = customer.customerId;
      map['mall_id'] = '1';

      final response = await http.post(Uri.parse(API.getAllClaimed), body: map);
      
      

      if (200 == response.statusCode) {
        List<ClaimedVoucher> list = parseResponse(response.body);
        

        final List<String> voucherIdStrings =
            list.map((voucher) => voucher.voucherId.toString()).toList();

        map2['voucher_ids'] = json.encode(voucherIdStrings);
        final response2 =
            await http.post(Uri.parse(API.getVouchersById), body: map2);
            print(response2.body);
        if (200 == response2.statusCode) {
          List<Voucher> voucherList = VoucherService.parseResponse(response2.body);
          return voucherList;
        } else {
          print("Response not 200");
          return [];
        }
      } else {
        print("Response not 200");
        return [];
      }
    } catch (e) {
      print("Error Appeared");
      return [];
    }
  }

  static bool parseStateResponse(String responseBody) {
    try {
      final parsed = json.decode(responseBody);

      // Check if the 'data' key exists and is a list
      if (parsed['condition'] is bool) {
        return parsed['condition'];
      } else {
        // Handle the case where 'data' is not a list
        print("Invalid data format: 'data' is not a list.");
        return true;
      }
    } catch (e) {
      // Handle any parsing errors
      print("Error parsing response: $e"); //here
      return true;
    }
  }

  static List<ClaimedVoucher> parseResponse(String responseBody) {
    try {
      final parsed = json.decode(responseBody);
     

      // Check if the 'data' key exists and is a list
      if (parsed['data'] is List) {
        // Extract the list of Vouchers

        List<ClaimedVoucher> list = (parsed['data'] as List)
            .map<ClaimedVoucher>((json) => ClaimedVoucher.fromJson(json))
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

  static void save(String mallid, String customerid, String voucherid) async {
    try {
      var map = Map<String, dynamic>();


      map['mall_id'] = mallid;
      map['customer_id'] = customerid;
      map['voucher_id'] = voucherid;

      final response = await http.post(Uri.parse(API.saveVoucher), body: map);

      if (200 == response.statusCode) {
        Fluttertoast.showToast(msg: "Voucher added");
        return;
      } else {
        print("Response not 200");
      }
    } catch (e) {
      print("Error Appeared");
    }
  }

  static void remove(String customerid, String itemid, String category) async {
    try {
      var map = Map<String, dynamic>();

      map['customer_id'] = customerid;
      map['item_id'] = itemid;
      map['category'] = category;
      final response = await http.post(Uri.parse(API.removeVoucher), body: map);

      if (200 == response.statusCode) {
        Fluttertoast.showToast(msg: "Voucher removed");
        return;
      } else {
        print("Response not 200");
      }
    } catch (e) {
      print("Error Appeared");
    }
  }
}
