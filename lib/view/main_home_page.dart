import 'package:delivery_app/controller/main_home_page_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/image_asset.dart';
import 'package:delivery_app/core/functions/alert_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomePageControllerImp());
    return GetBuilder<MainHomePageControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
            backgroundColor:AppColors. white,
            centerTitle: false,
            systemOverlayStyle:const SystemUiOverlayStyle(statusBarColor: AppColors.white),
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                controller.pageTitle[controller.currentPage].tr,
                style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColors.black,

                ),
              ),
            ),
           // leading: Icon(Icons.reorder),
          ),
          body: WillPopScope(
           child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.only(top: 10.0),
            child: controller.pages.elementAt(controller.currentPage),
          ),
            onWillPop:()=> alertExitApp(),
          ),

          bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentPage,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.black,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 0,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: (index){
                controller.changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImageAsset.pending,height: 25,color: controller.changeColor(0),),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImageAsset.accepted,height: 25,color: controller.changeColor(1)),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      AppImageAsset.done,
                      height: 25 ,color: controller.changeColor(2)),label: "",),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset
                    (AppImageAsset.settings,
                      height: 25,color: controller.changeColor(3)),label: "",
                ),
              ]),

        );
      },
    );
  }
}
