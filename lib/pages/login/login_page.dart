import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../sign_in_screen.dart';
import '../../configs/theme.dart';
import './login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController control = Get.put(LoginController());

  Widget _form(BuildContext context) {
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
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
                controller: control.userController,
                onChanged: (value) {},
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: control.passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  control.login(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: secondaryColor,
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: 10.0,
                      bottom:
                          30.0), // Ajusta el margen superior e inferior aquí
                  child: ElevatedButton(
                    onPressed: () {
                      print('GOOGLE!!!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 6, 132,
                          71), // Estilos del ElevatedButton, si es necesario
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons
                              .google, // Icono que se muestra a la izquierda del texto
                          // Otros atributos del icono si es necesario
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: 8), // Espaciado entre el icono y el texto
                        Text(
                          'Ingresar con Google', // Texto que se muestra a la derecha del icono
                          // Otros atributos del texto si es necesario
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )),
              _links(context),
            ],
          )),
    ));
  }

  Widget _links(BuildContext context) {
    return Container(
      height: 20,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  // Acciones a realizar cuando se haga clic en el Text
                  control.goToSignUpPage(context);
                  // Puedes agregar cualquier acción que desees realizar aquí
                },
                child: Text(
                  'Crear Cuenta',
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
            image: AssetImage('assets/images/login-landscape.png'),
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
          Expanded(flex: 1, child: _form(context)),
        ]),
      );
    } else {
      return SafeArea(
        child: Row(children: [
          Expanded(
            flex: 1,
            child: _imageLandscape(context),
          ),
          Expanded(flex: 1, child: _form(context)),
        ]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: OrientationBuilder(builder: (context, orientation) {
          return _buildBody(orientation, context);
        }));
  }
}
