import 'dart:io';

import 'package:get_storage/get_storage.dart';

import './profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../configs/theme.dart';

class ProfilePage extends StatelessWidget {
  ProfileController control = Get.put(ProfileController());

  Widget _memberForm(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        size:
                            48.0, // Ajusta el tamaño del icono según tus necesidades
                        color: Colors
                            .yellow, // Ajusta el color del icono según tus necesidades
                      ),
                    ])),
            Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Nombre',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Pepe Valdivia',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Código',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '20051191',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Telefono',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '987731975',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Correo',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'pepe.valdivia.caballero@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Icon(
                        Icons.edit,
                        size:
                            30.0, // Ajusta el tamaño del icono según tus necesidades
                        color: Colors
                            .grey, // Ajusta el color del icono según tus necesidades
                      ),
                    ]))
          ],
        ),
      ],
    );
  }

  Widget _userForm(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.tag,
                        size:
                            48.0, // Ajusta el tamaño del icono según tus necesidades
                        color: Colors
                            .yellow, // Ajusta el color del icono según tus necesidades
                      ),
                    ])),
            Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Usuario',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '20051191',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Icon(
                        Icons.edit,
                        size:
                            30.0, // Ajusta el tamaño del icono según tus necesidades
                        color: Colors
                            .grey, // Ajusta el color del icono según tus necesidades
                      ),
                    ]))
          ],
        ),
      ],
    );
  }

  void _showBottomSheetPicture(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height *
                    0.5, // Ajusta según tus necesidades
              ),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Row(children: [
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
                    ]),
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
                  ])));
        });
  }

  Widget _buildCircularImageWithIcon(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(() => Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: control.pickedImageFile.value!.path == ''
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://www.ulima.edu.pe/sites/default/files/a_info_menu/image/ingresantes.jpg'))
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(control.pickedImageFile.value!))),
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
                  _showBottomSheetPicture(context);
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 30,
                )),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        backgroundColor: secondaryColor,
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildCircularImageWithIcon(context),
              SizedBox(height: 15),
              _memberForm(context),
              SizedBox(height: 15),
              _userForm(context),
              SizedBox(height: 15),
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
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 35),
                  backgroundColor: secondaryColor,
                ),
                child: Text(
                  'Cambiar Contraseña',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              )
            ],
          )),
    );
    /*
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            _buildCircularImageWithIcon(context),
            Column(
              children: [
                Text('Carlos Tevez'),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.black54),
                    SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                    Text(
                      '20051191',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Text('20051191'),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.phone, color: Colors.black54),
                SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                Text(
                  '91823901283',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.mail, color: Colors.black54),
                SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                Text(
                  '20051191@ulima.edu.pe',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
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
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        )
      ],
    ));
    */
  }
}
