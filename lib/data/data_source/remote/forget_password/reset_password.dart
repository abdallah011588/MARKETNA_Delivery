


import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/link_api.dart';

class ResetPasswordData
{
  CRUD crud;
  ResetPasswordData(this.crud);

  postData(String email ,String password)async
  {
    var response = await crud.postData(
      AppLink.resetPassword ,
      {
        "email":email,
        "password":password,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}