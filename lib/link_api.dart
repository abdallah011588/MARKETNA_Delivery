
class AppLink
{
  static const String server= "http://192.168.247.5/ecommerce/delivery";
  static const String image= "http://192.168.247.5/ecommerce/upload";

  /// AUTH
  static const String test= "$server/test.php";
  static const String login= "$server/auth/login.php";

  /// Forget Password
  static const String checkEmail= "$server/forgetPassword/checkEmail.php";
  static const String verifyCodeForgetPassword= "$server/forgetPassword/verifycode.php";
  static const String resetPassword= "$server/forgetPassword/resetPassword.php";

  /// Home
  static const String homePage= "$server/home.php";

  /// Orders
  static const String pending= "$server/orders/pending.php";
  static const String approve= "$server/orders/approve.php";
  static const String accepted= "$server/orders/accepted.php";
  static const String archived= "$server/orders/archived.php";
  static const String details= "$server/orders/details.php";
  static const String done= "$server/orders/done.php";
  // static const String deleteOrder= "$server/orders/delete.php";
  // static const String rating= "$server/orders/rating.php";



}


