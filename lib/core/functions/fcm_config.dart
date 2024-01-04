
/*
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestNotificationPermission()async
{
  NotificationSettings settings=await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}


fcmConfig()
{
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("***************Notification********************");
    print(remoteMessage.notification!.title);
    print(remoteMessage.notification!.body);
    Get.snackbar(remoteMessage.notification!.title!, remoteMessage.notification!.body!);
    FlutterRingtonePlayer.playNotification();
    refreshPageNotification(remoteMessage.data);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
    print("***************Notification********************");
    // print(remoteMessage.notification!.title);
    // print(remoteMessage.notification!.body);
    // Get.snackbar(remoteMessage.notification!.title!, remoteMessage.notification!.body!);
    // refreshPageNotification(remoteMessage.data);
  });


}


refreshPageNotification(data)
{
  log("**************************${data['pagename']}");
  log("**************************${Get.currentRoute}");

  if(Get.currentRoute=="/orders" && data['pagename']=="refreshOrderPending")
    {
     // PendingController controller=Get.find();
     // controller.getData();
    }

  /// ways to do realtime updating
  /// firebase + stream
  /// socket io
  /// notification
}


*/

/*
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

FlutterRingtonePlayer.play(
  android: AndroidSounds.notification,
  ios: IosSounds.glass,
  looping: true, // Android only - API >= 28
  volume: 0.1, // Android only - API >= 28
  asAlarm: false, // Android only - all APIs
);

FlutterRingtonePlayer.play(fromAsset: "assets/ringtone.wav");

FlutterRingtonePlayer.play(
 fromAsset: "assets/ringtone.wav", // will be the sound on Android
 ios: IosSounds.glass 			   // will be the sound on iOS
 );


 */