import 'dart:io';

import 'package:dr_gym/models/entities/exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/entities/body_part.dart';
import '../../services/body_part_services.dart';
import '../../configs/http_api_exception.dart';
import '../../services/exercise_service.dart';

class ExersiceController extends GetxController {
  RxList<BodyPart> bodyParts = <BodyPart>[].obs;
  RxList<Exercise> exercises = <Exercise>[].obs;

  Future<void> listBodyParts(BuildContext) async {
    BodyPartService service = BodyPartService();
    try {
      print('try ++++++++++++++++++++++++++++++++++');
      service.fetchAll().then((list) {
        bodyParts.clear();
        bodyParts.assignAll(list);
      });
    } catch (e) {
      print('excpection ++++++++++++++++++++++++++++++++++++');
      print(e);
      if (e is SocketException) {
        Get.snackbar('Error de comunicación con el servidor',
            'Probablemente esté no se encuentre disponbile');
      } else if (e is HttpApiException) {
        Get.snackbar('Respuesta HTTP con errores', e.toString());
      } else {
        Get.snackbar('Error no esperado', e.toString());
      }
    }
  }

  Future<void> listExercises(BuildContext) async {
    ExerciseService service = ExerciseService();
    try {
      print('try ++++++++++++++++++++++++++++++++++');
      service.fetchAll().then((list) {
        exercises.clear();
        exercises.assignAll(list);
      });
    } catch (e) {
      print('excpection ++++++++++++++++++++++++++++++++++++');
      print(e);
      if (e is SocketException) {
        Get.snackbar('Error de comunicación con el servidor',
            'Probablemente esté no se encuentre disponbile');
      } else if (e is HttpApiException) {
        Get.snackbar('Respuesta HTTP con errores', e.toString());
      } else {
        Get.snackbar('Error no esperado', e.toString());
      }
    }
  }
}