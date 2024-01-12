import 'dart:convert';

import 'package:dr_gym/models/entities/exercise.dart';

import '../configs/constants.dart';
import 'package:http/http.dart' as http;
import '../configs/http_api_exception.dart';
import '../models/http/response_api.dart';

class UserService {
  Future<ResponseApi> login(String user, String password) async {
    print(BASE_URL + 'user/validate');
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

  Future<void> uploadProfileImage(String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse('${BASE_URL}file/upload'));
    request.files.add(await http.MultipartFile.fromPath('file', filePath)); // 'file' es el nombre del campo 
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        // Manejar la respuesta del servidor si es exitosa
        print('Archivo enviado exitosamente');
      } else {
        // Manejar errores
        print('Error al enviar el archivo: ${response.statusCode}');
      }
    } catch (e) {
      // Manejar excepciones
      print('Excepción al enviar el archivo: $e');
    }
  }
}
