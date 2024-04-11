import 'package:flutter/material.dart';
import 'package:msg_app/auth/login_or_register.dart';

import 'package:msg_app/themes/light_mode.dart';


void main() {
  runApp(const MyApp());
}
class MyApp  extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}