import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../sign_in_screen.dart';
import '../../configs/theme.dart';
import './sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpController control = Get.put(SignUpController());

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
                  'Llene el formulario',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'DNI',
                  border: OutlineInputBorder(),
                ),
                controller: control.dniController,
                onChanged: (value) {},
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: control.emailController,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  control.signUp();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: secondaryColor,
                ),
                child: Text(
                  'Enviar Solicitud',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    ));
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
