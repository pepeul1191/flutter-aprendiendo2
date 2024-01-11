import 'dart:ffi';

import '../../models/entities/body_part.dart';
import '../../configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/entities/exercise.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'exercise_controller.dart';

class ExercisePage extends StatelessWidget {
  ExersiceController control = Get.put(ExersiceController());

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
                control.listExercises(context, bodyPartId: newValue!.id);
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

  Widget _exerciseDetail(BuildContext context, Exercise exercise) {
    print('https://www.youtube.com/embed/${exercise.videoUrl.split('?v=')[1]}');
    return Padding(
        padding: EdgeInsets.all(16.0), // Ajusta aquí el tamaño del padding
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 5),
          Center(
              child: Text(
            exercise.name,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          )),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(exercise.description)),
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.8 * 0.4,
            child: WebView(
              initialUrl:
                  'https://www.youtube.com/embed/${exercise.videoUrl.split('?v=')[1]}',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          )
        ]));
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
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors
                                  .transparent, // Opcional: establece un color de fondo si lo deseas
                              child: FractionallySizedBox(
                                heightFactor: 0.65,
                                widthFactor:
                                    1, // Puedes ajustar la altura como desees
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(20.0),
                                      topRight: const Radius.circular(20.0),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                      child: _exerciseDetail(
                                          context,
                                          control.exercises.value[
                                              index])), // Reemplaza 'TuContenidoAquí' con tu contenido deseado
                                ),
                              ),
                            );
                          },
                        );
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
            control.listExercises(context);
            control.bodyPartSelectedText.value =
                "Seleccione un parte del cuerpo";
          }, // Función a ejecutar al hacer clic
        ));
  }

  @override
  Widget build(BuildContext context) {
    control.listBodyParts(context);
    control.listExercises(context);
    double screenWidth = MediaQuery.of(context).size.width;
    //Get.snackbar('Respuesta HTTP con errores', 'XD');
    return Padding(
        padding:
            EdgeInsets.all(10.0), // Puedes ajustar el valor según sea necesario
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Row(
              children: [
                _selectBodyPart(context, screenWidth),
                _resetButton(context)
              ],
            ),
            SizedBox(height: 20),
            _exercisesGrid(context),
            SizedBox(height: 10)
          ],
        ));
  }
}
