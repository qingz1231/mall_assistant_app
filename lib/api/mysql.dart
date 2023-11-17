

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class API {
  static const hostConnect = "http://192.168.5.125/api_mall_app";
  static const hostConnectShop = "$hostConnect/api_mall_app/shop";

  static const getShops = "http://192.168.5.125/api_mall_app/shop/getShops.php";
  static const getShopById = "http://192.168.5.125/api_mall_app/shop/getShopById.php";
  static const likeShop = "$hostConnectShop/likeShop.php";


  static const register = "http://192.168.5.125/api_mall_app/customer/register.php";
  static const login = "http://192.168.5.125/api_mall_app/customer/login.php";

  static const checkBookmark = "http://192.168.5.125/api_mall_app/bookmark/isExist.php";
  static const saveBookmark = "http://192.168.5.125/api_mall_app/bookmark/save.php";
  static const removeBookmark = "http://192.168.5.125/api_mall_app/bookmark/remove.php";
  static const getAllBookmark = "http://192.168.5.125/api_mall_app/bookmark/getAll.php";

  static const checkSaved = "http://192.168.5.125/api_mall_app/voucher/isClaimed.php";
  static const saveVoucher = "http://192.168.5.125/api_mall_app/voucher/save.php";
  static const removeVoucher = "http://192.168.5.125/api_mall_app/voucher/remove.php";
  static const getAllClaimed= "http://192.168.5.125/api_mall_app/voucher/getAllSaved.php";
  static const getAllVoucher= "http://192.168.5.125/api_mall_app/voucher/getAll.php";
  static const getVoucherById= "http://192.168.5.125/api_mall_app/voucher/getVoucherById.php";
  static const getVouchersById= "http://192.168.5.125/api_mall_app/voucher/getVouchersById.php";
}
