
import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/link_api.dart';

class OrderDetailsData
{
  CRUD crud;
  OrderDetailsData(this.crud);

  getData(String orderId)async
  {
    var response = await crud.postData( AppLink.details , {
      "order_id":orderId,
    });
    return response.fold((l) => l, (r) => r);
  }

}