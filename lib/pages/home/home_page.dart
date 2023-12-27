import 'dart:io';

import 'package:dr_gym/configs/theme.dart';
import 'package:dr_gym/pages/exercise/exercise_page.dart';
import 'package:dr_gym/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import '../routine/routine_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    RoutinePage(),
    ExercisePage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _navigationBottom() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined),
          label: 'Mi Rutina',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.addchart_outlined),
          label: 'Ejercicios',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mi Cuenta',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  Widget _popUpMenu() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // Manejar la opción seleccionada
        switch (value) {
          case 'about':
            print('It\'s an orange');
            break;
          case 'signOut':
            print('Cerrar Sesión');
            break;
          default:
            print('Unknown fruit');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'about',
          child: Text('Acerca de'),
        ),
        PopupMenuItem<String>(
          value: 'signOut',
          child: Text('Cerrar Sesión'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Dr Gym'),
          automaticallyImplyLeading: false,
          backgroundColor: secondaryColor,
          actions: [
            // Agregar un menú desplegable al AppBar
            _popUpMenu()
          ]),
      body: WillPopScope(
          onWillPop: () async {
            exit(0);
            return false; // Cambiar a `false` si quieres bloquear el retroceso
          },
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )),
      bottomNavigationBar: _navigationBottom(),
    );
  }
}
