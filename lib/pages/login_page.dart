import 'package:flutter/material.dart';
import 'package:msg_app/components/my_button.dart';
import 'package:msg_app/components/my_textFIeld.dart';

class LoginPage extends StatelessWidget {
// email and pw text controller


  LoginPage({super.key});

  // login method
  void login() {
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 50),

          //Welcome msg
          Text(
            "Welcome Back!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),
          //email textfield
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(height: 10),
          //password textfield
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          const SizedBox(height: 25),
          //login button
          MyButton(
          text: "Login",
          onTap: login,
          ),

           const SizedBox(height: 25),
          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a Member?", 
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary),),
              Text("Register now", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),),
            ],
          )
        ],
      ),
    );
  }
}
