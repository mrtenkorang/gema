import 'package:flutter/material.dart';
import 'package:gema/view/history/passed_history/passed_history.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:gema/view/theme/theme.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:gema/view/map-screeen/map_screen_controller.dart';
import 'package:gema/view/map-screeen/widgets/map_screen_widgets.dart';
import 'package:gema/view/shared/widgets/textfield.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  // Create controller ONCE
  final mapScreenController = Get.put(MapScreenController());
  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    mapScreenController.mapScreenContext = context;
    return Scaffold(
      body: Stack(
        children: [
          _mapBody(),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: _topTextField(context),
          ),
          Positioned(bottom: 40, left: 10, child: _bottomChips(context)),
        ],
      ),
    );
  }

  Widget _mapBody() {
    return GetBuilder<MapScreenController>(
      builder: (controller) {
        return GoogleMap(
          initialCameraPosition: controller.initialCameraPosition,
          mapType: MapType.satellite,
          compassEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,

          // Uncomment if you have markers/polygons
          // markers: controller.markers,
          polygons: controller.polygons,

          // onMapCreated: (GoogleMapController mapController) {
          //   controller.mapController = mapController;
          //   // controller.mapController.setMapStyle(controller.mapStyle);
          // },
        );
      },
    );
  }

  Widget _topTextField(BuildContext context) {
    return
    // Container(
    // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    // decoration: BoxDecoration(
    //   color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
    //   borderRadius: BorderRadius.circular(10),
    // ),
    // child:
    AppTextField(
      controller: TextEditingController(),
      hintText: "Search",
      prefixIcon: const Icon(Icons.search),
      fontSSize: 16,
      // ),
    );
  }

  Widget _bottomChips(BuildContext context) {
    return SizedBox(
      height: 90,
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        children: [
          Expanded(
            child: bottomChips(
              onTap: () {},
              context: context,
              title: "Unvisited",
              count: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: bottomChips(
              onTap: () {},
              context: context,
              title: "Visited",
              count: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
          // const SizedBox(width: 6),
          // Expanded(
          //   child: bottomChips(
          //     context: context,
          //     title: "Partial",
          //     count: 5,
          //     color: Colors.orange,
          //   ),
          // ),
          // const SizedBox(width: 6),
          // Expanded(
          //   child: bottomChips(
          //     context: context,
          //     title: "Drafts",
          //     count: 3,
          //     color: Colors.blueGrey,
          //   ),
          // ),
          const SizedBox(width: 6),
          Expanded(
            child: bottomChips(
              onTap: () {
                registerController.getPassPropertyDetails();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PassedHistory(),
                  ),
                );
              },
              context: context,
              title: "Passed",
              count: 10,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
