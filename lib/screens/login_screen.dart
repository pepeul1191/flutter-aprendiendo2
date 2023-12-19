import 'package:flutter/material.dart';
import '../screens/sign_in_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Left Section',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              double.infinity, 50), // Ancho y alto del botón
                          shape: RoundedRectangleBorder(
                            // Personalizar los bordes
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Text('Ir a la segunda pantalla'),
                      ),
                    ],
                  )),
            )),
      ]),
    );
  }
}
