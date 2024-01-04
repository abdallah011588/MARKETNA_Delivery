
import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/link_api.dart';

class OrdersData
{
  CRUD crud;
  OrdersData(this.crud);

  getPendingData()async
  {
    var response = await crud.postData( AppLink.pending , {});
    return response.fold((l) => l, (r) => r);
  }


  getAcceptedData(String deliveryId)async
  {
    var response = await crud.postData( AppLink.accepted , {"delivery_id":deliveryId,});
    return response.fold((l) => l, (r) => r);
  }


  getArchivedData(String deliveryId)async
  {
    var response = await crud.postData( AppLink.archived , {"delivery_id":deliveryId,});
    return response.fold((l) => l, (r) => r);
  }



  approveOrderData(String deliveryId ,String userId , String orderId)async
  {
    var response = await crud.postData( AppLink.approve , {
          "user_id":userId,
          "order_id":orderId,
          "delivery_id":deliveryId,
    },
    );
    return response.fold((l) => l, (r) => r);
  }



  deliverOrderSuccessfullyData(String userId , String orderId)async
  {
    var response = await crud.postData( AppLink.done , {
      "user_id":userId,
      "order_id":orderId,
    },
    );
    return response.fold((l) => l, (r) => r);
  }


  /*
  deleteData(String orderId)async
  {
    var response = await crud.postData( AppLink.deleteOrder , {"order_id":orderId,});
    return response.fold((l) => l, (r) => r);
  }
  */

  /*
  ratingData(String userId ,String orderId ,double rating ,String feedback)async
  {
    var response = await crud.postData( AppLink.rating , {
      "user_id":userId,
      "order_id":orderId,
      "order_rating":rating.toString(),
      "order_rating_feedback":feedback,
    });
    return response.fold((l) => l, (r) => r);
  }
  */

}