

import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/link_api.dart';

class ForgetPasswordData
{
  CRUD crud;
  ForgetPasswordData(this.crud);

  postData(String email)async
  {
    var response = await crud.postData(
      AppLink.checkEmail ,
      {
        "email":email,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}