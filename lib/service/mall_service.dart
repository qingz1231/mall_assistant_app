// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:mall_assistant_app/service/bookmark_service.dart';
// import 'package:mall_assistant_app/user_preference.dart';
// import '../api/mysql.dart';
// import '../entity/Customer.dart';
// import '../entity/Mall.dart';
// import '../entity/Mall.dart';
// import '../entity/UserMall.dart';

// class MallService {
//   static Future<List<Mall>> getMalls() async {
//     try {

//       var map = Map<String, dynamic>();
      
//       final response = await http.post(Uri.parse(API.getMalls), body: map);


//       if (200 == response.statusCode) {
//         List<Mall> list = parseResponse(response.body);
//         return list;
//       } else {
//         print("Error: ${response.statusCode}");
//         throw Exception(
//             'Failed to load Malls. HTTP Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Error in get Mall: $e");
//       return [];
//     }
//   }

//   static List<Mall> parseResponse(String responseBody) {
//     try {
//       final parsed = json.decode(responseBody);


//       if (parsed['data'] is List) {

//         List<Mall> list = (parsed['data'] as List)
//             .map<Mall>((json) => Mall.fromJson(json))
//             .toList();
//         return list;
//       } else {

//         print("Invalid data format: 'data' is not a list.");
//         return [];
//       }
//     } catch (e) {
//       // Handle any parsing errors
//       print("Error parsing response: $e");
//       return [];
//     }
//   }

//   // static List<Mall> parseResponse(String responseBody){
//   //   final parsed = json.decode(responseBody);
//   //   return parsed.map<Mall>((json) => Mall.fromJson(json)).toList();
//   // }

//   static Future<UserMall> getMallById(String i) async {
//     try {
//       var map = Map<String, dynamic>();

//       map['Mall_id'] = i;
//       final response = await http.post(Uri.parse(API.getMallById), body: map);

//       if (200 == response.statusCode) {
//         Future<Customer> customerFuture = RememberUserPrefs.loadCurrentUser();
//         Mall Mall = parseResponse(response.body)[0];

//         try {
//           Customer customer = await RememberUserPrefs.loadCurrentUser();
//           bool saved =
//               await BookmarkService.MallIsSaved(i, customer.customerId!);

//           UserMall userMall = UserMall(Mall: Mall, isSaved: saved);
//           return userMall;
//         } catch (e) {
//           // Handle errors
//           print("Error: $e");
//           // You may want to return a default UserMall or throw an exception
//           return UserMall(Mall: Mall, isSaved: false);
//         }

        
//       } else {
//         print("Response not 200");
//         return UserMall();
//       }
//     } catch (e) {
//       print("Error Appeared");
//       return UserMall();
//     }
//   }
// }
