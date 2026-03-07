import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController{



  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(38.6082331, -77.3092544),
    zoom: 18.0,
    tilt: 30,
    // bearing: 270.0,
  );

  Set<Polygon> polygons = {};

  @override
  void onInit() {
    super.onInit();
    _initPolygons();
  }

  void _initPolygons() {
    final center = initialCameraPosition.target;
    final double offset = 0.0003;

    final colors = [
      Get.theme.colorScheme.secondary,
      Get.theme.primaryColor,
      Colors.orange,
      Colors.blueGrey,
      Colors.red,
    ];

    final titles = ["Unvisited", "Visited", "Partial", "Drafts", "Passed"];

    final displacements = [
      const Offset(-0.0005, 0.0004),
      const Offset(0.0006, -0.0003),
      const Offset(-0.0002, -0.0007),
      const Offset(0.0004, 0.0007),
      const Offset(0.0000, 0.0002),
    ];

    for (int i = 0; i < 5; i++) {
      final lat = center.latitude + displacements[i].dx;
      final lng = center.longitude + displacements[i].dy;

      final points = [
        LatLng(lat, lng),
        LatLng(lat, lng + offset),
        LatLng(lat + offset, lng + offset),
        LatLng(lat + offset, lng),
      ];

      polygons.add(
        Polygon(
          polygonId: PolygonId('poly_$i'),
          points: points,
          fillColor: colors[i].withOpacity(0.5),
          strokeColor: colors[i],
          strokeWidth: 2,
          consumeTapEvents: true,
          onTap: () {
            Get.snackbar('${titles[i]} Polygon', 'You clicked the ${titles[i]} polygon!', 
                backgroundColor: colors[i].withOpacity(0.8), colorText: Colors.white);
          },
        ),
      );
    }
    update();
  }
}