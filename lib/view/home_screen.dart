import 'package:delivery_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  int _counter = 0;

  void _incrementCounter() {
      _counter++;
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController=Get.put(HomeController());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme
                .of(context)
                .textTheme
                .headline4,
          ),

          TextButton(onPressed: (){homeController.logOut();}, child: Text("log out"),),
        ],
      ),
    );
  }

}
