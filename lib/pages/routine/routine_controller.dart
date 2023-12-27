import 'dart:io';

import 'package:dr_gym/models/entities/exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/entities/body_part.dart';
import '../../services/member_service.dart';
import '../../configs/http_api_exception.dart';

class RoutineController extends GetxController {
  RxList<BodyPart> bodyParts = <BodyPart>[].obs;
  RxList<Exercise> exercises = <Exercise>[].obs;
  Rx<BodyPart> bodyPartSelected = BodyPart(id: 0, name: "").obs;
  RxString bodyPartSelectedText = "Seleccione un parte del cuerpo".obs;

  Future<void> listBodyParts(BuildContext context, int memberId) async {
    MemberService service = MemberService();
    try {
      print('try ++++++++++++++++++++++++++++++++++');
      service.fetchBodyParts(memberId: memberId).then((list) {
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

  Future<void> listExercises(BuildContext context,
      {int bodyPartId = 0, int memberId = 0}) async {
    MemberService service = MemberService();
    try {
      print('try ++++++++++++++++++++++++++++++++++');
      service
          .fetchExercies(bodyPartId: bodyPartId, memberId: memberId)
          .then((list) {
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
