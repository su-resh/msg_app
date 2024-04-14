import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: const Color.fromRGBO(230, 240, 255, 1), // Light blue background
    primary: Colors.blue.shade500, // Adjust the shade to your preference
    secondary: Colors.blue.shade400, // Adjust the shade to your preference
    tertiary: Color.fromARGB(255, 161, 209, 245), // Light gray tertiary color
    inversePrimary: Colors.blue.shade900, // Adjust the shade to your preference
  ),
);