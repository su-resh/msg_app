import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
 final String hintText;
 final bool obscureText;
 final TextEditingController controller;
 final FocusNode? focusNode;

   const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
     this.focusNode,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        obscureText: obscureText,
        controller: controller ,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
             color: Colors.white,
          ),
        ),
      
      ),
    );
  }
}