import 'dart:convert';

import 'package:dr_gym/models/entities/exercise.dart';

import '../configs/constants.dart';
import 'package:http/http.dart' as http;
import '../configs/http_api_exception.dart';
import '../models/entities/body_part.dart';
import '../models/http/exercise_body_part_amount.dart';

class MemberService {
  Future<ExerciseBodyPartAmount> fetchAmoutExercicesAndBodyParts(
      {int memberId = 0}) async {
    String url = "${BASE_URL}member/exercises_body_parts?member_id=$memberId";
    ExerciseBodyPartAmount amounts;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('MemberService if ++++++++++++++++++++++++++++++++++');
      print(response.body);
      amounts = ExerciseBodyPartAmount.fromJson(json.decode(response.body));
      print(amounts.toString());
      return amounts;
    } else {
      print('else ++++++++++++++++++++++++++++++++++');
      throw HttpApiException(response.statusCode, response.body);
    }
  }

   Future<List<Exercise>> fetchExercises(
      {int bodyPartId = 0, int memberId = 0}) async {
    String url = "${BASE_URL}member/exercises" +
        ((bodyPartId == 0) ? '' : '?body_part_id=$bodyPartId') +
        ((memberId == 0)
            ? ''
            : (bodyPartId == 0)
                ? '?member_id=$memberId'
                : '&member_id=$memberId');
    List<Exercise> bodyParts = [];
    final response = await http.get(Uri.parse(url));
    print('response ++++++++++++++++++++++++++++++++++');
    if (response.statusCode == 200) {
      print('if ++++++++++++++++++++++++++++++++++');
      print(response.body);
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

  Future<List<BodyPart>> fetchBodyParts({int memberId = 0}) async {
    String url = "${BASE_URL}member/body_parts?member_id=$memberId";
    List<BodyPart> bodyParts = [];
    final response = await http.get(Uri.parse(url));
    print('response ++++++++++++++++++++++++++++++++++');
    if (response.statusCode == 200) {
      print('if ++++++++++++++++++++++++++++++++++');
      final List<dynamic> parsedData = json.decode(response.body);
      bodyParts = parsedData
          .map((bodyPartJson) => BodyPart.fromJson(bodyPartJson))
          .toList();
      print(bodyParts);
      return bodyParts;
    } else {
      print('else ++++++++++++++++++++++++++++++++++');
      throw HttpApiException(response.statusCode, response.body);
    }
  }
}
