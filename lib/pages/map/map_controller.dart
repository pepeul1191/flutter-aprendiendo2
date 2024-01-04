import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';


class MapController extends GetxController {
  Location location = Location();
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  Future<void> getLocation() async {
    try {
      var currentLocationData = await location.getLocation();
      print('getLocation');
      print(currentLocationData.latitude);
      print(currentLocationData.longitude);
    } catch (e) {
      print('Error al obtener la ubicación: $e');
    }
  }
}