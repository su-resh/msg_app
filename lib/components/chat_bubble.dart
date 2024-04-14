import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatBubble  extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble ({super.key,
    required this.message,
    required this.isCurrentUser,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:isCurrentUser ?Colors.green : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(10),
      ),
      padding:const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
       child: Text(message,
       style: const TextStyle(
        color: Colors.white,
       ),),
    );
  }
}