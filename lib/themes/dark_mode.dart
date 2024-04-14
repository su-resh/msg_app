import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
   colorScheme: ColorScheme.dark(
    background: Color.fromRGBO(5, 10, 48, 1),
    primary: const Color.fromARGB(255, 37, 117, 208), // Adjust the shade to your preference
    secondary: Colors.blue.shade700, // Adjust the shade to your preference
    tertiary: Color.fromRGBO(40, 40, 40, 1),
    inversePrimary: Colors.blue.shade300,
   )
);