import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/constants.dart';
import 'exercise_controller.dart';

class ExercisePage extends StatelessWidget {
  ExersiceController control = Get.put(ExersiceController());
  String selectedOption = '';

  Widget _selectBodyPart() {
    return Text('XD');
  }

  Widget _exercisesGrid(BuildContext context) {
    return Container(
        height: MediaQuery.of(context)
            .size
            .height, // Asignar altura basada en el tamaño de la pantalla
        child: Obx(() => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              mainAxisSpacing: 8.0, // Spacing between rows
              crossAxisSpacing: 8.0, // Spacing between columns
            ),
            itemCount: control.exercises.value.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    // Handle the tap event.
                    print(
                        'Grid tile ${control.exercises.value[index].id} tapped');
                    //Navigator.pushNamed(context, '/pokemon/detail',
                    //arguments: {'id': control.exercises.value[index].id});
                  },
                  child: GridTile(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Column(
                        children: [
                          Expanded(
                              child: Image.network(
                            BASE_URL + control.exercises.value[index].imageUrl,
                            fit: BoxFit.cover,
                          )),
                          SizedBox(height: 8),
                          Text(
                            control.exercises.value[index].name,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )),
                    ),
                  ));
            })));
  }

  @override
  Widget build(BuildContext context) {
    control.listBodyParts(context);
    control.listExercises(context);
    //Get.snackbar('Respuesta HTTP con errores', 'XD');
    return Column(
      children: [_selectBodyPart(), _exercisesGrid(context)],
    );
  }
}
