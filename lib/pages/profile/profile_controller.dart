import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/user_service.dart';

class ProfileController extends GetxController {
  RxString imagePath = ''.obs;
  Rx<File?> pickedImageFile = File('').obs;

  void takePicture(BuildContext context) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // Acción con la imagen capturada (p.ej. mostrarla en un widget)
      print('Control: Imagen seleccionada desde la cámara: ${pickedImage.path}');
      pickedImageFile.value = File(pickedImage.path);
      closeBottomSheet(context);
    }
  }

  void pickImageFromGallery(BuildContext context) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Acción con la imagen seleccionada (p.ej. mostrarla en un widget)
      print('Control: Imagen seleccionada desde la galería: ${pickedImage.path}');
      pickedImageFile.value = File(pickedImage.path);
      closeBottomSheet(context);
    }
  }

  void closeBottomSheet(BuildContext context){
    Navigator.pop(context); 
  }

  void saveChanges(BuildContext context) async{
    print('saveChanges');
    UserService service = UserService();
    await service.uploadProfileImage(pickedImageFile.value!.path);
  }
}