import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer ({super.key});

  void logout() {
    // get auth service
    final _auth  = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
   
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          children: [ DrawerHeader (
        child:     
          Center(child: Icon(Icons.message,
          color: Theme.of(context).colorScheme.primary, 
          size: 64,
          ),
          ),
        ),
          
        // home list tile
        Padding(
          padding: const EdgeInsets.only(left:25.0),
          child: ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
          
        //settings list tile
       Padding(
          padding: const EdgeInsets.only(left:25.0),
          child: ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: (){
              // pop the drawer
              Navigator.pop(context);

              // navigate to settings page
              Navigator.push(
                context,
              MaterialPageRoute(
                builder:(context) => const SettingsPage(),
              ));
            },
          ),
        ),],

        ),
       
        // logout
 Padding(
          padding: const EdgeInsets.only(left:25.0, bottom: 25.0),
          child: ListTile(
            title: const Text("L O G O U T"),
            leading: const Icon(Icons.logout),
            onTap: logout,
          ),
        ),

      ],
      ),
    );
  }
}