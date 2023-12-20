import 'package:flutter/material.dart';

const Map<int, Color> myColorMap = {
  50: Color.fromRGBO(0, 128, 255, 0.1), // 10% opacidad
  100: Color.fromRGBO(0, 128, 255, 0.2), // 20% opacidad
  200: Color.fromRGBO(0, 128, 255, 0.3), // 30% opacidad
  300: Color.fromRGBO(0, 128, 255, 0.4), // 40% opacidad
  400: Color.fromRGBO(0, 128, 255, 0.5), // 50% opacidad
  500: Color.fromRGBO(0, 128, 255, 0.6), // 60% opacidad
  600: Color.fromRGBO(0, 128, 255, 0.7), // 70% opacidad
  700: Color.fromRGBO(0, 128, 255, 0.8), // 80% opacidad
  800: Color.fromRGBO(0, 128, 255, 0.9), // 90% opacidad
  900: Color.fromRGBO(0, 128, 255, 1), // 100% opacidad
};

const MaterialColor primaryColor = MaterialColor(0xfc465594, myColorMap);
const MaterialColor secondaryColor = MaterialColor(0xfcfcd940, myColorMap);

final appTheme = () => ThemeData.from(
      colorScheme: ColorScheme.light(primary: primaryColor),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          textStyle: TextStyle(
            // Cambiar color del texto
            color: Colors.black, // Color del texto del botón
            fontSize: 18.0,
            // Otros estilos de texto si es necesario
          ),
        ),
      ),
    );
