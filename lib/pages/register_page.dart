import 'package:flutter/material.dart';
import 'package:msg_app/services/auth/auth_service.dart';
import 'package:msg_app/components/my_button.dart';
import 'package:msg_app/components/my_textField.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  void register(BuildContext context) {
    if (_pwController.text == _confirmPwController.text) {
      try {
        final _auth = AuthService();
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password doesn't match."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Image.asset("assets/signup.png", height: 150, width: 250),
              const SizedBox(height: 5),
              Text(
                "Let's Create an account for you!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: _pwController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm password",
                obscureText: true,
                controller: _confirmPwController,
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a Member?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
