import 'package:flutter/material.dart';
import 'package:msg_app/components/my_button.dart';
import 'package:msg_app/components/my_textFIeld.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage ({super.key});
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
 
  //register method
  void register() {
  
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            "Let's Create an accont for you!",
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
          const SizedBox(height: 10),
          //confirm password textfield
          MyTextField(
            hintText: "Confirm password",
            obscureText: true,
            controller: _confirmPwController,
          ),

          const SizedBox(height: 25),
          //login button
          MyButton(
          text: "Register",
          onTap: register,
          ),

           const SizedBox(height: 25),
          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already a Member?", 
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary),),
              Text("Login now", style: TextStyle(
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