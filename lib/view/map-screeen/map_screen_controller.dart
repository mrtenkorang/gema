import 'package:flutter/material.dart';
import 'package:gema/view/register/register_init_screen.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController{

  BuildContext? mapScreenContext;

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
          onTap: ()async  {
            await actionBottomSheet();
            Get.snackbar('${titles[i]} Polygon', 'You clicked the ${titles[i]} polygon!', 
                backgroundColor: colors[i].withOpacity(0.8), colorText: Colors.white);
          },
        ),
      );
    }
    update();
  }


  Future<dynamic> actionBottomSheet() {
    return showModalBottomSheet(
      context: mapScreenContext!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "P-1002-a20",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.hintColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Unvisited",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text("Div 12 | Block 40 | Prop. 234 | Kasoa"),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.pin_drop),
                  SizedBox(width: 10),
                  Text("Unaccessed property"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RegisterInitScreen();
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Register",
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: theme.colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Pass",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }

}
