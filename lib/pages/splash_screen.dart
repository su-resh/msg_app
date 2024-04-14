
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msg_app/services/auth/auth_gate.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
// Reduce this value, I am keeping 10 for testing purpose
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const AuthGate()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.blue.shade900,
      Colors.blue.shade800,
      Colors.blue.shade700,
      Colors.blue.shade600,
      Colors.blue.shade500,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
),


        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/messages.png", height: 300, width: 400
            ),
          const Text(
              "M E S S A G E",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
