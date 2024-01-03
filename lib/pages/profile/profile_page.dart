import 'dart:io';

import 'package:get_storage/get_storage.dart';

import './profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../configs/theme.dart';

class ProfilePage extends StatelessWidget {
  ProfileController control = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCircularImageWithIcon(context),
            ElevatedButton(
              onPressed: () {
                control.saveChanges(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 35),
                backgroundColor: secondaryColor,
              ),
              child: Text(
                'Guardar Cambios',
                style: TextStyle(
                    color: Colors.black, fontSize: 14),
              ),
            )
          ],
        )
      ),
    );
  }

    void _showBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5, // Ajusta según tus necesidades
            ),
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Contenido del BottomSheet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              control.closeBottomSheet(context);
                            },
                            child: Text(
                              'Cerrar', 
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ]
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          control.pickImageFromGallery(context);
                        },
                        child: Text(
                          'Galeria', 
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          control.takePicture(context);
                        },
                        child: Text(
                          'Cámara', 
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                  
                ]
              )
            )
          );     
        }
      );
    }

  Widget _buildCircularImageWithIcon(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(() =>Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: control.pickedImageFile.value!.path == '' ?  
              DecorationImage(
                fit: BoxFit.cover,
                image: 
                  NetworkImage('https://www.ulima.edu.pe/sites/default/files/a_info_menu/image/ingresantes.jpg')
              )
              :DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(control.pickedImageFile.value!)
              )
          ),
        )),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: InkWell(
              onTap: () {
                // Acción que deseas realizar al hacer clic en el icono
                _showBottomSheet(context);
              },
              child: Icon(
                Icons.edit,
                color: Colors.black,
                size: 30,
              )
            ),
          ),
        ),
      ],
    );
  }
}
