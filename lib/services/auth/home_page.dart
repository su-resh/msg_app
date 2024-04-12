
import 'package:flutter/material.dart';
import 'package:msg_app/components/my_drawer.dart';
import 'package:msg_app/components/user_tile.dart';
import 'package:msg_app/pages/chat_page.dart';
import 'package:msg_app/services/auth/auth_service.dart';
import 'package:msg_app/services/chat/chat_services.dart';

class HomePage  extends StatelessWidget {
   HomePage ({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
  


  void logout (){
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of users except for current
  Widget _buildUserList(){
    return StreamBuilder(
 stream: _chatService.getUsersStream(),
       builder: (context, snapshot){
        // errror
        if(snapshot.hasError){
          return const Text("Error");
        }

        //loading...
        if  (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: const CircularProgressIndicator());
        }

        // returnlist view
       return ListView(
  children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
    );
       }
      );
  }
  // build inividual user list item
  Widget _buildUserListItem(Map <String, dynamic> userData, BuildContext context){
// display all users except current user

   return UserTile(text: userData["email"],
    onTap: (){
      // tapped on a user -> go to chat
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
      ChatPage(
        recieverEmail: userData["email"],
      ), 
      ),
      );
    }
    );
  }
  

}