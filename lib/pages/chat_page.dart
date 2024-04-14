// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:msg_app/components/my_textFIeld.dart';
import 'package:msg_app/services/auth/auth_service.dart';
import 'package:msg_app/services/chat/chat_services.dart';

import '../components/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  final String recieverEmail;
  final String recieverID;
  
  ChatPage({
    Key? key,
    required this.recieverEmail,
    required this.recieverID,
  }) : super(key: key);

  // text Controller
  final TextEditingController _messageController = TextEditingController();

  // chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
 void sendMessage() async {
  // if there is something inside the textfield
  if (_messageController.text.isNotEmpty) {
    // send message
    _chatService.sendMessage(recieverID, _messageController.text);
    // clear the textfield
    _messageController.clear();
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,   appBar: AppBar(
        title: Text(recieverEmail),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: _buildMessagesList(),
          ),
          // user input
          _buildMessageInput(),
        ],
      ),
    );
  }

  // build message List
  Widget _buildMessagesList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(recieverID, senderID),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // errors
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        }
        // return list view
        return ListView(
          reverse: true,
          children: snapshot.data!.docs.map<Widget>((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // is current user
    bool isCurrentUser = data["senderID"] == _authService.getCurrentUser()!.uid;

    // align message to the right if it is sent by the current user
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    // check if the message is sent by the current user
    return Align(
      alignment: alignment,
      child: 
        Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [     ChatBubble(message:data["message"], 
          isCurrentUser: isCurrentUser,
          ),
          ]
        ),
      );
  }

  // build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
            ),
          ),
      
          // send button
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.send),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
