
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/middleware/middleware.dart';
import 'package:delivery_app/view/auth/forget_password/forget_password.dart';
import 'package:delivery_app/view/auth/forget_password/reset_password.dart';
import 'package:delivery_app/view/auth/forget_password/reset_password_success.dart';
import 'package:delivery_app/view/auth/forget_password/verify_code.dart';
import 'package:delivery_app/view/auth/login.dart';
import 'package:delivery_app/view/auth/login_success.dart';
import 'package:delivery_app/view/home_screen.dart';
import 'package:delivery_app/view/language.dart';
import 'package:delivery_app/view/main_home_page.dart';
import 'package:delivery_app/view/orders/details.dart';
import 'package:delivery_app/view/orders/tracking.dart';
import 'package:delivery_app/view/splash.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> ? routes=[
  GetPage(name: AppRoutes.splash, page: ()=> Splash()),
  GetPage(name: AppRoutes.language, page: ()=> Language(),
    middlewares: [
      MyMiddleWare(),
    ],),
  GetPage(name: AppRoutes.homePage, page: ()=> MainHomePage()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.resetPasswordSuccess, page: () => const ResetPasswordSuccess()),
  GetPage(name: AppRoutes.loginSuccess, page: () => const LoginSuccess()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoutes.tracking, page: () => const TrackingScreen()),

];