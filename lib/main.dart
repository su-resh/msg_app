import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:msg_app/services/auth/auth_gate.dart';
// import 'package:msg_app/auth/login_or_register.dart';
import 'package:msg_app/firebase_options.dart';
import 'package:msg_app/themes/light_mode.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp  extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: lightMode,
    );
  }
}