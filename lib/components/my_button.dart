import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const MyButton({
    super.key,
  required this.text,
  required this.onTap
  });

  @override
Widget build(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 200, // Adjust the width as needed
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding:const  EdgeInsets.symmetric(vertical: 25, horizontal: 20), 
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            
          ),
        ),
      ),
    ),
  );
}

}