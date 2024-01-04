

import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/image_asset.dart';
import 'package:delivery_app/view/orders/accepted.dart';
import 'package:delivery_app/view/orders/archived.dart';
import 'package:delivery_app/view/orders/pending.dart';
import 'package:delivery_app/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainHomePageController extends GetxController
{
  changePage(int index);
  changeColor(int index);
  changeTitle(int index);
  goToCart();
}

class MainHomePageControllerImp extends MainHomePageController
{
  int currentPage=0;

  List<Widget> pages=[
   const Pending(),
    const Accepted(),
    const Archived(),
    const SettingsScreen(),
  ];



  List<String> pageIcon=[
    AppImageAsset.pending,
    AppImageAsset.accepted,
    AppImageAsset.done,
    AppImageAsset.settings,
  ];

  List<String> pageTitle=[
    "New Orders",
    "Accepted Orders",
    "Delivered Orders",
    "Settings",
    ];

  @override
  changePage(int index) {
    currentPage=index;
    update();
  }

  @override
  changeTitle(int index) {
    currentPage=index;
    update();
  }

  @override
  Color changeColor(int index) {
    if(currentPage==index)
      {
        return AppColors.primaryColor;
      }
    else
      {
        return AppColors.black;
      }
  }

  @override
  goToCart() {
   // Get.toNamed(AppRoutes.cartScreen);
  }

}