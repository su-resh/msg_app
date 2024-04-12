
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:msg_app/components/my_textFIeld.dart';
import 'package:msg_app/services/auth/auth_service.dart';
import 'package:msg_app/services/chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String recieverEmail;
  final String recieverID;
  ChatPage({super.key,
  required this.recieverEmail,
 required this.recieverID
  });

// text Controller
final TextEditingController _messageController = TextEditingController();

// chat and auth services
final ChatService _chatService = ChatService();
final AuthService _authService = AuthService();

// send message
void sendMessage() async{
  // if there is something ubsude the textfield
  if (_messageController.text.isNotEmpty){
    // send message
    await _chatService.sendMessage(recieverEmail, _messageController.text);
    // clear the textfield
    _messageController.clear();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(child: _buildMessagesList(
            
          )
          
          ),

          //user input
          _buildMessageInput(),
        ],

      ),
   
    );
  }
  // build message List
  Widget _buildMessagesList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(recieverID, senderID),
     builder: (context, snapshot){
      // errors
      if(snapshot.hasError){
        return const Text("Error");
      }

      //loading
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: const CircularProgressIndicator());
      }

      // return list view
      return ListView(
        reverse: true,
        children: snapshot.data!.docs.map<Widget>((doc) => _buildMessageItem(doc)).toList(),
      );
     }
     );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // check if the message is sent by the current user
    return Text(data ["message"]);
  }

  // build message input
  Widget _buildMessageInput(){
    return Row(children: [
      Expanded(child: MyTextField(
        controller: _messageController,
        hintText: "Type a message",
        obscureText: false,

      )
      ),

      // send button
      IconButton( onPressed: sendMessage, icon: Icon(Icons.arrow_upward),)
    ],
    );
    
  }
}