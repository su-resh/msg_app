import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class ChatBubble  extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble ({super.key,
    required this.message,
    required this.isCurrentUser,
    });

  @override
  Widget build(BuildContext context) {
    // light vs dark mode
    bool isDarkMode = 
    Provider.of<ThemeProvider>(context, listen: false).isDarkMmode;

    return Container(
      decoration: BoxDecoration(
        color:isCurrentUser 
        ? (isDarkMode ? Colors.green.shade600: Colors.green.shade500):
         (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
       child: Text(message,
       style: TextStyle(
        color: isCurrentUser ? Colors.white : (isDarkMode? Colors.white : Colors.black),
       ),
       ),
    );
  }
}