import 'package:flutter/material.dart';
import '../screens/sign_in_screen.dart';
import '../view_models/login_form_view_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login.png'),
                  fit:
                      BoxFit.cover, // Ajustar la imagen al tamaño del Container
                ),
              ),
              child: null),
        ),
        Expanded(
            flex: 1,
            child: SingleChildScrollView(
                child: Container(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          print('LOGIN!!!');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Ingresar'),
                      ),
                      Container(
                        height: 130,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Acciones a realizar cuando se haga clic en el Text
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()),
                                        );
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()),
                                        );
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
                      )
                    ],
                  )),
            ))),
      ]),
    );
  }
}
