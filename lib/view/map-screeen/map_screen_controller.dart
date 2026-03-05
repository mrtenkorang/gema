import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController{



  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(38.6082331, -77.3092544),
    zoom: 18.0,
    tilt: 30,
    // bearing: 270.0,
  );
}