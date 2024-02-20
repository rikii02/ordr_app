import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/logo_screen.dart'; // Asegúrate de importar el archivo logo_screen.dart
import 'screens/oplaces_screen.dart'; // Asegúrate de importar el archivo oplaces_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Utiliza SplashScreen como pantalla de inicio
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      // Navega a la página OPlacesPage después de 2 segundos
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OPlacesScreen()));
    });

    return LogoScreen(); // Muestra LogoScreen durante el tiempo definido
  }
}

