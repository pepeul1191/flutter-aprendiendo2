import 'dart:convert';
import 'dart:io';

import 'package:dr_gym/configs/theme.dart';
import 'package:dr_gym/pages/exercise/exercise_page.dart';
import 'package:dr_gym/pages/user/user_page.dart';
import 'package:dr_gym/pages/finger_print/finger_print_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/datastore/local_user.dart';
import '../profile/profile_page.dart';
import '../routine/routine_page.dart';
import '../location/location_page.dart';
import '../scanner/scanner_page.dart';

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

  Widget _popUpMenu(BuildContext context) {
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
          case 'profile':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            break;
          case 'maps':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationPage()),
            );
            break;
          case 'scanner':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScannerPage()),
            );
            break;
          case 'fingerprint':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FingerPrintPage()),
            );
            break;
          default:
            print('Unknown fruit');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'profile',
          child: Text('Mi perfil'),
        ),
        PopupMenuItem<String>(
          value: 'about',
          child: Text('Acerca de'),
        ),
        PopupMenuItem<String>(
          value: 'maps',
          child: Text('Ver mapa'),
        ),
        PopupMenuItem<String>(
          value: 'scanner',
          child: Text('Leer Código QR'),
        ),
        PopupMenuItem<String>(
          value: 'fingerprint',
          child: Text('Leer Huella'),
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
            _popUpMenu(context)
          ]),
      /*body: WillPopScope(
          onWillPop: () async {
            exit(0);
            return false; 
          },
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )),*/
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
      bottomNavigationBar: _navigationBottom(),
    );
  }
}
