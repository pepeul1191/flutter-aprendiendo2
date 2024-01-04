import './location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationPage extends StatelessWidget {
  MapController mapController = MapController();
  final Key mapKey = UniqueKey();
  LocationController control = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    control.getLocation(mapController);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      key: mapKey,
      body:  Obx(() =>Column(
        children: [
           Expanded(
            child: FlutterMap(
              key: mapKey,
              options: MapOptions(
                center: LatLng(control.latitude.value, control.longitude.value),
                minZoom: 5,
                maxZoom: 25,
                zoom: 5,
              ),
              children:[
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.dr_gym',
              ),
              ], 
              mapController: mapController,
            ),
          ),]
      )),
    );
  }
}
