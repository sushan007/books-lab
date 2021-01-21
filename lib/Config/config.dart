import 'package:shared_preferences/shared_preferences.dart';


class EcommerceApp{

  static const String appName = "e-shop";

  static SharedPreferences sharedPreferences;

  static String collectionUser = "users";
  static String collectionOrders = "orders";
  static String userCartList = 'userCartList';
  static String subCollectionAddress = "userAddress";

  static final String userName = "name";
  static final String userEmail = "email";
  static final String userPhotoUrl = "photoUrl";
  static final String userUID = "uid";
  static final String userAvatarUrl = "url";

  static final String addressId = "addressID";
  static final String totalAmount = "totalAmount";
  static final String productId = "productIDs";
  static final String paymentDetails = "paymentDetails";
  static final String orderTime = "orderTime";
  static final String isSuccess = "isSuccess";

}