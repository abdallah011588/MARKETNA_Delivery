import 'package:delivery_app/core/class/request_status.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/functions/handling_data.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/data_source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  forgetPassword();
  rememberMe();
}

class LoginControllerImp extends LoginController {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RequestStatus? requestStatus;
  LoginData loginData =LoginData(Get.find());
  MyServices myServices = Get.find();
  bool check=false;

  @override
  login() async{
    var formData = formKey.currentState;
    if (formData!.validate()){

      requestStatus = RequestStatus.loading;
      update();
      var response  = await loginData.postData(
        emailController.text,
        passwordController.text,
      );

      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success)
      {
        if(response['status'] == "success")
        {
           myServices.shared!.setString("id",response['data']['delivery_id'].toString());
           String deliveryId=response['data']['delivery_id'].toString();
           myServices.shared!.setString("email",response['data']['delivery_email'] );
           myServices.shared!.setString("deliveryName",response['data']['delivery_name'] );
           myServices.shared!.setString("phone",response['data']['delivery_phone'] );
           FirebaseMessaging.instance.subscribeToTopic("delivery");
           FirebaseMessaging.instance.subscribeToTopic("delivery${deliveryId}");
           myServices.shared!.setBool("isLogin" ,true);
           Get.offAllNamed(AppRoutes.loginSuccess);
        }
        else
        {
          Get.defaultDialog(
            title: "Warning".tr,
            middleText:"Email or password is incorrect!".tr ,
          );
          requestStatus = RequestStatus.failure;
        }
      }
      if(requestStatus == RequestStatus.server_failure)
      {
          Get.defaultDialog(
            title: "Warning".tr,
            middleText:"Something went wrong server failure!".tr ,
          );
        }
      if(requestStatus == RequestStatus.server_exception)
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"Something went wrong server exception!".tr ,
        );
      }
      if(requestStatus == RequestStatus.offline_failure)
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"You are offline!".tr ,
        );
      }

      update();
    }
    else {}
  }


  @override
  forgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
    //  Get.delete<LoginControllerImp>();
  }

  @override
  rememberMe() {
    check =!check;
    update();
  }
  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    // });
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    print("object***************");
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


}
