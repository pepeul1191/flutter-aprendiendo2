import 'package:dr_gym/pages/map/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapPage extends StatelessWidget {
  MapController control = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    control.getLocation();

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Regresar'),
        ),
      ),
    );
  }
}
