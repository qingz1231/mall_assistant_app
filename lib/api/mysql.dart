

class API {
  static const hostConnect = "http://192.168.0.179/api_mall_app";
  static const hostConnectShop = "$hostConnect/api_mall_app/shop";

  static const getShops = "http://192.168.0.179/api_mall_app/shop/getShops.php";
  static const getShopById = "http://192.168.0.179/api_mall_app/shop/getShopById.php";
  static const likeShop = "$hostConnectShop/likeShop.php";


  static const register = "http://192.168.0.179/api_mall_app/customer/register.php";
  static const login = "http://192.168.0.179/api_mall_app/customer/login.php";

  static const checkBookmark = "http://192.168.0.179/api_mall_app/bookmark/isExist.php";
  static const saveBookmark = "http://192.168.0.179/api_mall_app/bookmark/save.php";
}
