
import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/view/widgets/order/order_accepted.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
class Accepted extends StatelessWidget {
  const Accepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedController());
    return GetBuilder<AcceptedController>(builder: (controller) => HandlingDataView(
      requestStatus: controller.requestStatus,
      widget: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll){
          overscroll.disallowIndicator();
          return true;
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return AcceptedCard(orderModel: controller.orders[index]);
          },
          itemCount: controller.orders.length,
        ),
      ),
    ),
    );
  }
}

