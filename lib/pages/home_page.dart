
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:msg_app/components/my_drawer.dart';
import 'package:msg_app/components/user_tile.dart';
import 'package:msg_app/pages/chat_page.dart';
import 'package:msg_app/services/auth/auth_service.dart';
import 'package:msg_app/services/chat/chat_services.dart';

class HomePage  extends StatelessWidget {
   HomePage ({super.key});

  //chat and auth services
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ChatService _chatService = ChatService();

  // get current user
  User? getCurrentUser(){
    return _auth.currentUser;
  }


  void logout (){
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
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
{
  if(userData["email"] != getCurrentUser()!.email){
   return UserTile(text: userData["email"],
    onTap: (){
      // tapped on a user -> go to chat
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
      ChatPage(
        recieverEmail: userData["email"],
        recieverID: userData["uid"],
      ), 
      ),
      );
    }
    );
  }
  else {
    return Container();
  }

  }
  

  }
}