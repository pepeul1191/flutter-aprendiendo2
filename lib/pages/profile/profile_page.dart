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
                      GestureDetector(
                          onTap: () {
                            // Tu lógica de manejo de clic aquí
                            _bottomSheetMember(context);
                          },
                          child: Icon(
                            Icons.edit,
                            size:
                                30.0, // Ajusta el tamaño del icono según tus necesidades
                            color: Colors
                                .grey, // Ajusta el color del icono según tus necesidades
                          )),
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

  void _bottomSheetMember(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height *
                    0.5, // Ajusta según tus necesidades
              ),
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Editar Datos del Miembro',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Apellidos',
                                        border: UnderlineInputBorder(),
                                      ),
                                    )),
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Nombres',
                                        border: UnderlineInputBorder(),
                                      ),
                                    ))
                              ],
                            )
                          ]))));
        });
  }

  void _bottomSheetUser(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 180,
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
                      children: [])));
        });
  }

  void _bottomSheetPicture(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 180,
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
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Foto del perfil',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.grey),
                              onPressed: () {
                                control.closeBottomSheet(context);
                              },
                            ),
                          ),
                        ],
                      ))
                    ]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                control.takePicture(context);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: CircleBorder(),
                              ),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt_outlined,
                                      color: Colors.grey),
                                  onPressed: () {
                                    control.takePicture(context);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('Cámara')
                          ],
                        ),
                        Container(
                          width: 10,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                control.pickImageFromGallery(context);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: CircleBorder(),
                              ),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.image, color: Colors.grey),
                                  onPressed: () {
                                    control.pickImageFromGallery(context);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('Galería')
                          ],
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
                  _bottomSheetPicture(context);
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
  }
}
