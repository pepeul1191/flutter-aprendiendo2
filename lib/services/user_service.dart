import 'dart:convert';

import 'package:dr_gym/models/entities/exercise.dart';

import '../configs/constants.dart';
import 'package:http/http.dart' as http;
import '../configs/http_api_exception.dart';
import '../models/http/response_api.dart';

class UserService {
  Future<ResponseApi> login(String user, String password) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}user/validate'), // Replace with your API URL
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'user': user, 'password': password},
    );
    if (response.body == null) {
      print('No se pudo ejecutar la operación');
      return ResponseApi();
    } else {
      return ResponseApi.fromJson(json.decode(response.body));
    }
  }
}
