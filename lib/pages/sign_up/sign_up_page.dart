import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../sign_in_screen.dart';
import '../../configs/theme.dart';
import './sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpController control = Get.put(SignUpController());

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 2,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Términos y Condiciones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Markdown(
                    data: control.markdownData.value,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              flex: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  control.aceptTerms();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35),
                                  backgroundColor: secondaryColor,
                                ),
                                child: Text(
                                  'Acepto',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              )),
                          Expanded(flex: 10, child: SizedBox(height: 0)),
                          Expanded(
                              flex: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  control.declineTerms();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35),
                                  backgroundColor: secondaryColor,
                                ),
                                child: Text(
                                  'No Acepto',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _formLandscape(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Container(child:),
                      Container(
                        margin: EdgeInsets.only(
                            bottom:
                                20.0), // Margen inferior de 20.0 (puedes ajustar este valor)
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Llene el formulario',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 48,
                              child: Obx(() => TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Usuario',
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: control.userController,
                                    onChanged: (value) {},
                                    enabled: control.termsCheck.value,
                                  ))),
                          Expanded(flex: 4, child: Container()),
                          Expanded(
                              flex: 48,
                              child: Obx(() => TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: control.emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Correo',
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {},
                                    enabled: control.termsCheck.value,
                                  ))),
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 48,
                            child: Obx(() => TextFormField(
                                  obscureText: true,
                                  controller: control.password1Controller,
                                  decoration: InputDecoration(
                                    labelText: 'Contraseña',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {},
                                  enabled: control.termsCheck.value,
                                )),
                          ),
                          Expanded(flex: 4, child: Container()),
                          Expanded(
                              flex: 48,
                              child: Obx(() => TextFormField(
                                    obscureText: true,
                                    controller: control.password2Controller,
                                    decoration: InputDecoration(
                                      labelText: 'Repita su contraseña',
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {},
                                    enabled: control.termsCheck.value,
                                  ))),
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 48,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() => Checkbox(
                                        value: control.termsCheck.value,
                                        onChanged: (value) {
                                          _showBottomSheet(context);
                                        },
                                      )),
                                  Expanded(
                                    child: Text(
                                      'He leido y acepto los Términos y Condiciones',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(flex: 4, child: Container()),
                          Expanded(
                            flex: 48,
                            child: Obx(() {
                              return ElevatedButton(
                                onPressed: control.termsCheck.value
                                    ? () {
                                        control.signUp();
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  backgroundColor: secondaryColor,
                                ),
                                child: Text(
                                  'Crear Cuenta',
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      _links(context)
                    ]))));
  }

  Widget _formPortrait(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Container(child:),
              Container(
                margin: EdgeInsets.only(
                    bottom:
                        20.0), // Margen inferior de 20.0 (puedes ajustar este valor)
                alignment: Alignment.centerLeft,
                child: Text(
                  'Llene el formulario',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Obx(() => TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      border: OutlineInputBorder(),
                    ),
                    controller: control.userController,
                    onChanged: (value) {},
                    enabled: control.termsCheck.value,
                  )),
              SizedBox(height: 10),
              Obx(() => TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: control.emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    enabled: control.termsCheck.value,
                  )),
              SizedBox(height: 10),
              Obx(() => TextFormField(
                    obscureText: true,
                    controller: control.password1Controller,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    enabled: control.termsCheck.value,
                  )),
              SizedBox(height: 10),
              Obx(() => TextFormField(
                    obscureText: true,
                    controller: control.password2Controller,
                    decoration: InputDecoration(
                      labelText: 'Repita su contraseña',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    enabled: control.termsCheck.value,
                  )),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Checkbox(
                        value: control.termsCheck.value,
                        onChanged: (value) {
                          _showBottomSheet(context);
                        },
                      )),
                  Expanded(
                    child: Text(
                      'He leido y acepto los Términos y Condiciones',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Obx(() {
                return ElevatedButton(
                  onPressed: control.termsCheck.value
                      ? () {
                          control.signUp();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: secondaryColor,
                  ),
                  child: Text(
                    'Crear Cuenta',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }),
              _links(context)
            ],
          )),
    ));
  }

  Widget _links(BuildContext context) {
    return Container(
      height: 20,
      margin: EdgeInsets.only(top: 30.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  // Acciones a realizar cuando se haga clic en el Text
                  control.goToLoginPage(context);
                  // Puedes agregar cualquier acción que desees realizar aquí
                },
                child: Text(
                  'Iniciar Sesión',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  // Acciones a realizar cuando se haga clic en el Text
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );*/
                  control.goToResetPasswordPage(context);
                  // Puedes agregar cualquier acción que desees realizar aquí
                },
                child: Text(
                  'Recuperar Contraseña',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget _imagePortrait(BuildContext conext) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login-portrait.png'),
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del Container
          ),
        ),
        child: null);
  }

  Widget _imageLandscape(BuildContext conext) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login-portrait.png'),
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del Container
          ),
        ),
        child: null);
  }

  Widget _buildBody(Orientation orientation, BuildContext context) {
    if (orientation == Orientation.portrait) {
      return SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: _imagePortrait(context),
          ),
          Expanded(flex: 2, child: _formPortrait(context)),
        ]),
      );
    } else {
      return SafeArea(
        child: Row(children: [
          Expanded(
            flex: 1,
            child: _imageLandscape(context),
          ),
          Expanded(flex: 2, child: _formLandscape(context)),
        ]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    control.getTerms();
    return Scaffold(
        appBar: null,
        body: OrientationBuilder(builder: (context, orientation) {
          return _buildBody(orientation, context);
        }));
  }
}
