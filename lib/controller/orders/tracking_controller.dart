


import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/class/request_status.dart';
import 'package:delivery_app/core/functions/decode_polyline.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/model/order_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController
{

  RequestStatus requestStatus =RequestStatus.none;
  OrderModel? orderModel;
  MyServices myServices=Get.find();
  // Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  GoogleMapController? mapController ;
  CameraPosition? cameraPosition ;
  Set<Marker> markers={};
  StreamSubscription<Position>? positionStream;

  Set<Polyline> polyLineSet={};
  double ? lat;
  double ? long;
  Timer? timer;


  initialData()
  {
    requestStatus=RequestStatus.loading;
    if(orderModel!.orderType =="0") {
      cameraPosition = CameraPosition(
        target: LatLng(
            double.parse(orderModel!.addressLat!),
            double.parse(orderModel!.addressLong!),
        ),
        zoom: 8,
      );
      markers.add(
        Marker(
          markerId:const MarkerId("1"),
          position: LatLng(
              double.parse(orderModel!.addressLat!),
              double.parse(orderModel!.addressLong!),
          ),
        ),
      );
      requestStatus=RequestStatus.success;
    }
    update();
  }


  getCurrentLocation()
  {
    positionStream = Geolocator.getPositionStream().listen((event) {

      markers.removeWhere((element) => element.markerId.value=="current");
      markers.add( Marker(
          markerId:const MarkerId("current"),
          position: LatLng(event.latitude , event.longitude,),
        ),);
      lat = event.latitude;
      long = event.longitude;
      if(mapController !=null)
       mapController!.animateCamera(CameraUpdate.newLatLng(LatLng(event.latitude,event.longitude)));

      print(event.latitude);
      print(event.longitude);

      update();
    });
  }


  initPolyLine()async
  {
    polyLineSet= await getPolyLine(
    lat,
    long,
    double.parse(orderModel!.addressLat!),
    double.parse(orderModel!.addressLong!),
    );

    update();
  }


  refreshLocation()async
  {
    await Future.delayed(Duration(seconds: 2));
    timer = Timer.periodic(Duration(seconds: 60), (timer) {
      FirebaseFirestore.instance.collection("delivery").doc(orderModel!.orderId).set({
        "lat": lat,
        "long": long,
        "deliveryId": myServices.shared!.getString("id"),
      }).then((value) {
       // print(orderModel!.orderId);
        print("done ********************");
      });
    });
  }



  @override
  void onInit() {
    getCurrentLocation();
    refreshLocation();
    if(Get.arguments['orderModel'] !=null) {
      orderModel = Get.arguments['orderModel'];
      initialData();
    }
    //initPolyLine();
    super.onInit();
  }



  @override
  void onClose() {
    timer!.cancel();
    positionStream!.cancel();
    mapController!.dispose();
    super.onClose();
  }

}