import 'dart:convert';

import 'package:dr_gym/models/entities/exercise.dart';

import '../configs/constants.dart';
import 'package:http/http.dart' as http;
import '../configs/http_api_exception.dart';
import '../models/entities/body_part.dart';

class ExerciseService {
  Future<List<Exercise>> fetchAll({int bodyPartId = 0}) async {
    String url = "${BASE_URL}exercise/list" +
        ((bodyPartId == 0) ? '' : '?body_part_id=$bodyPartId');
    List<Exercise> bodyParts = [];
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('if ++++++++++++++++++++++++++++++++++');
      final List<dynamic> parsedData = json.decode(response.body);
      bodyParts = parsedData
          .map((bodyPartJson) => Exercise.fromJson(bodyPartJson))
          .toList();
      return bodyParts;
    } else {
      print('else ++++++++++++++++++++++++++++++++++');
      throw HttpApiException(response.statusCode, response.body);
    }
  }
}
