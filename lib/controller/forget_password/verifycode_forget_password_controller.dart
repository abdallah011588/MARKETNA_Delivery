import 'package:delivery_app/core/class/request_status.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/functions/handling_data.dart';
import 'package:delivery_app/data/data_source/remote/forget_password/verifycode_forget_password.dart';
import 'package:get/get.dart';

abstract class VerifyCodeForgetPasswordController extends GetxController {
  resendCode();
  goToLogin();
  goToResetPassword(String verificationCode);
}

class VerifyCodeForgetPasswordControllerImp extends VerifyCodeForgetPasswordController {

  String? email;
  RequestStatus? requestStatus;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =VerifyCodeForgetPasswordData(Get.find());

  @override
  goToResetPassword(verificationCode)async {

    requestStatus = RequestStatus.loading;
    update();
    var response  = await verifyCodeForgetPasswordData.postData(email!, verificationCode,);

    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status'] == "success")
      {
        Get.offAllNamed(AppRoutes.resetPassword,
        arguments: {
        "email":email,
        },
        );
      }
      else
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"Email verification code is not correct".tr ,
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

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  resendCode() async{

    requestStatus = RequestStatus.loading;
    update();
    var response  = await verifyCodeForgetPasswordData.resendVerifyCode(email!,);

    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status'] == "success")
      {
        Get.defaultDialog(
          title: "Information",
          middleText:"Check your email" ,
        );
      }
      else
      {
        Get.defaultDialog(
          title: "Warning",
          middleText:"Something went wrong please try again!" ,
        );
        requestStatus = RequestStatus.failure;
      }
    }

    if(requestStatus == RequestStatus.server_failure)
    {
      Get.defaultDialog(
        title: "Warning",
        middleText:"Something went wrong server failure!" ,
      );
    }
    if(requestStatus == RequestStatus.server_exception)
    {
      Get.defaultDialog(
        title: "Warning",
        middleText:"Something went wrong server exception!" ,
      );
    }
    if(requestStatus == RequestStatus.offline_failure)
    {
      Get.defaultDialog(
        title: "Warning",
        middleText:"You are offline!" ,
      );
    }

    update();
  }



  @override
  void onInit() {
    email =Get.arguments['email'];
    super.onInit();
  }


}
