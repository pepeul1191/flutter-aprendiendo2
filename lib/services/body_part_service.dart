import 'dart:convert';

import '../configs/constants.dart';
import 'package:http/http.dart' as http;
import '../configs/http_api_exception.dart';
import '../models/entities/body_part.dart';

class BodyPartService {
  Future<List<BodyPart>> fetchAll() async {
    String url = "${BASE_URL}body_part/list";
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
