import 'package:delivery_app/controller/orders/tracking_controller.dart';
import 'package:delivery_app/core/functions/decode_polyline.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/controller/orders/order_details_controller.dart';
import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/view/widgets/appbar.dart';
import 'package:delivery_app/view/widgets/auth/custom_button_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(TrackingController());
    return Scaffold(
      appBar:customAppBar("Order Tracking".tr),
      body: GetBuilder<TrackingController>(
          builder: (controller) {
            return HandlingDataView(
             requestStatus: controller.requestStatus,
             widget: Padding(
              padding: const EdgeInsets.all( 10.0),
              child: Card(
                 child: Container(
                   child: GoogleMap(
                     mapType: MapType.normal,
                     initialCameraPosition: controller.cameraPosition!,
                     markers: controller.markers,
                     onMapCreated: (GoogleMapController googleMapController){
                       controller.mapController = googleMapController;
                       // controller.mapController.complete(googleMapController);
                     },
                    // polylines: controller.polyLineSet,
                   ),
                 ),
               ),
            ));
          }
      ),
    );
  }
}
