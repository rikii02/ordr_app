import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  final int backgroundColor = 0xFFD1BEB1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: Center(
        child: Image.asset(
          'assets/images/ordr_logo.png',
          width: 350,  // Adjust the width according to your needs
          height: 350, // Adjust the height according to your needs
        ),
      ),
    );
  }
}
