import 'dart:js';
import 'package:flutter/material.dart';
import 'package:msg_app/components/my_drawer.dart';
import 'package:msg_app/components/user_tile.dart';
import 'package:msg_app/services/chat/chat_services.dart';
import '../../pages/chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}); // Typo fixed: HomaPage -> HomePage

  // chat & auth services
  final ChatServices _chatServices = ChatServices();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(context), // Pass context here
    );
  }

  // build a list of users except current logged-in user
  Widget _buildUserList(BuildContext context) { // Pass context as a parameter
    return StreamBuilder<List<Map<String, dynamic>>>( // Specify the type of stream
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Show a loading indicator
        }
        // Return a ListView of user widgets
        return ListView(
          children: (snapshot.data ?? []).map<Widget>((userData) {
            // Build a widget for each user data
            return _buildUserListItem(context, userData); // Pass context here
          }).toList(), // Convert Iterable to List
        );
      },
    );
  }

  // Function to build user widget
  Widget _buildUserListItem(BuildContext context, Map<String, dynamic> userData) { // Pass context as a parameter
    // Implement how you want to display each user
   return UserTile(
    text: userData["email"],
    onTap: (){
      Navigator.push(context ,
       MaterialPageRoute(
        builder:(context) => ChatPage(
          recieverEmail: userData["email"] ,
        )
      ,)
      );
    },
   );
  }
}
