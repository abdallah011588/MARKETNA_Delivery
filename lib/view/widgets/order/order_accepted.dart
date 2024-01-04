
import 'dart:ui';

import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/controller/orders/archived_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/data/model/order_model.dart';
import 'package:delivery_app/view/widgets/auth/custom_button_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class AcceptedCard extends GetView<AcceptedController> {
  final OrderModel orderModel;
  const AcceptedCard( {Key? key ,required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("Number".tr+" : ${orderModel.orderId}",
                      style:const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.primaryColor),
                  ),
                ),
                Text(Jiffy(orderModel.orderDatetime,"yyyy-MM-dd h:mm:ss").fromNow(),),
                SizedBox(
                  child: DropdownButton(
                      underline:const SizedBox(),
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.black,
                      ),
                      items: [
                        DropdownMenuItem(
                          onTap: (){
                           // controller.deleteOrder(orderModel.orderId!,orderModel.orderStatus!);
                          },
                          value: 'Delete',
                          child: Text(
                            'Delete'.tr,
                            style:const TextStyle(color: Colors.black,),
                          ),
                        ),
                        DropdownMenuItem(
                          onTap: (){
                          },
                          value: 'rate',
                          child: Text(
                            'Rate Us'.tr,
                            style:const TextStyle(color: Colors.black,),
                          ),
                        ),
                      ],
                      onChanged: (value){
                      }
                  ),
                ),
              ],
            ),
            const Divider(),
            Text("Order Type".tr+" : ${controller.getOrderType( orderModel.orderType!)}",),
            Text("Order Price".tr+" : ${orderModel.orderPrice}\$",),
            Text("Delivery Price".tr+" : ${orderModel.orderDeliveryPrice}\$",),
            Text("Payment Method".tr+" : ${controller.getPaymentType(orderModel.orderPaymentMethod!)}",),
            Text("Order Status".tr+" : ${controller.getOrderStatus(orderModel.orderStatus!)}",),
            Text("Total price : ${orderModel.orderTotalPrice}\$",
                style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)
            ),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height:40 ,child: CustomButtonAuth(onPressed: (){
                  controller.deliverOrderSuccessfully(orderModel.orderUserId!, orderModel.orderId!);
                }, text: "Done".tr,color: AppColors.green,)),

                SizedBox(height:40 ,child: CustomButtonAuth(onPressed: (){
                  controller.goToOrderDetails(orderModel);
                }, text: "Details".tr)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
