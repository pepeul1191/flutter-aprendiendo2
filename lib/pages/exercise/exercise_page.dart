import 'dart:ffi';

import '../../models/entities/body_part.dart';
import '../../configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'exercise_controller.dart';

class ExercisePage extends StatelessWidget {
  ExersiceController control = Get.put(ExersiceController());
  String selectedOption = '';

  Widget _selectBodyPart(BuildContext context) {
    return Obx(() => InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            // Utilizar solo 'label' en lugar de 'labelText'
            labelText: 'Partes del Cuerpo',
            hintText: 'Select an option',
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<BodyPart>(
              isDense: true,
              isExpanded: true,
              value: null,
              onChanged: (BodyPart? newValue) {
                control.listExercises(context, bodyPartId: newValue!.id);
              },
              items: control.bodyParts
                  .map<DropdownMenuItem<BodyPart>>((BodyPart item) {
                return DropdownMenuItem<BodyPart>(
                  value: item,
                  child: Text(item.name),
                );
              }).toList(),
            ),
          ),
        ));
  }

  Widget _exercisesGrid(BuildContext context) {
    return Expanded(
        child: Container(
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
                                BASE_URL +
                                    control.exercises.value[index].imageUrl,
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
                }))));
  }

  @override
  Widget build(BuildContext context) {
    control.listBodyParts(context);
    control.listExercises(context);
    //Get.snackbar('Respuesta HTTP con errores', 'XD');
    return Padding(
        padding:
            EdgeInsets.all(10.0), // Puedes ajustar el valor según sea necesario
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            _selectBodyPart(context),
            SizedBox(height: 20),
            _exercisesGrid(context),
            SizedBox(height: 10)
          ],
        ));
  }
}
