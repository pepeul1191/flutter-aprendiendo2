import 'dart:convert';
import 'dart:ffi';

import 'package:get_storage/get_storage.dart';

import '../../models/datastore/local_user.dart';
import '../../models/entities/body_part.dart';
import '../../configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routine_controller.dart';

class RoutinePage extends StatelessWidget {
  RoutineController control = Get.put(RoutineController());
  int memberId = 0;
  int userId = 0;

  Widget _selectBodyPart(BuildContext context, double screenWidth) {
    return Obx(() => SizedBox(
        // O ConstrainedBox
        width: screenWidth - 40 - 30,
        child: InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Partes del Cuerpo',
            hintText: 'Select an option',
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<BodyPart>(
              isDense: true,
              isExpanded: true,
              value: null, // Establecer el valor inicial como null
              onChanged: (BodyPart? newValue) {
                control.listExercises(context, bodyPartId: newValue!.id, memberId: memberId);
                control.bodyPartSelectedText.value = newValue!.name;
              },
              items: [
                DropdownMenuItem<BodyPart>(
                  value: null, // Establecer el valor del hint como null
                  child: Text(
                    control.bodyPartSelectedText.value,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                ...control.bodyParts
                    .map<DropdownMenuItem<BodyPart>>((BodyPart item) {
                  return DropdownMenuItem<BodyPart>(
                    value: item,
                    child: Text(item.name),
                  );
                }).toList(),
              ],
            ),
          ),
        )));
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

  Widget _resetButton(BuildContext context) {
    return Container(
        width: 40,
        child: IconButton(
          icon: Icon(Icons.refresh), // Icono a mostrar
          onPressed: () {
            print('XDDDDDDDDDDDDDd');
            control.listExercises(context, memberId: memberId);
            control.bodyPartSelectedText.value =
                "Seleccione un parte del cuerpo";
          }, // Función a ejecutar al hacer clic
        ));
  }

  Widget _routineResume(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Expanded(
          flex: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Parte del Cuerpo\n Entrenadas',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Obx(() =>
              Text(
                control.bodyPartsAmount.value.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
        Expanded(flex: 10, child: SizedBox(height: 0)),
        Expanded(
          flex: 45,
          child: Column(
            children: [
              Text(
                'Total de\n Ejercicios',
                style: TextStyle(fontSize: 16),
              ),
              Obx(() =>Text(
                control.exercisesAmount.value.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // load user stored
    final userString = GetStorage().read('user');
    final storedLocalUser = LocalUser.fromJson(jsonDecode(userString));
    memberId = storedLocalUser.memberId!;
    userId = storedLocalUser.userId!;
    // list per user
    control.listBodyParts(context, memberId);
    control.getAmoutExercicesAndBodyParts(context, memberId: memberId);
    control.listExercises(context, memberId: memberId);
    double screenWidth = MediaQuery.of(context).size.width;
    //Get.snackbar('Respuesta HTTP con errores', 'XD');
    return Padding(
        padding:
            EdgeInsets.all(10.0), // Puedes ajustar el valor según sea necesario
        child: Column(
          children: <Widget>[
            Row(children: [
              _routineResume(context),
            ]),
            Divider( // Aquí se utiliza el widget Divider
                color: Colors.grey, // Puedes personalizar el color
                thickness: 2, // Grosor de la línea
                indent: 20, // Espaciado a la izquierda
                endIndent: 20, // Espaciado a la derecha
              ),
            SizedBox(height: 15),
            Row(
              children: [
                _selectBodyPart(context, screenWidth),
                _resetButton(context)
              ],
            ),
            SizedBox(height: 20),
            _exercisesGrid(context),
            SizedBox(height: 15)
          ],
        ));
  }
}
