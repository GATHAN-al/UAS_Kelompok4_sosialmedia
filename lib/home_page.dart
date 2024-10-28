import 'package:flutter/material.dart';
import 'package:flutter_application_chat/auth/auth_service.dart';
import 'package:flutter_application_chat/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {

    final auth = AuthService();
    auth.signOut();
  }
  // Build ui
  @override
  Widget build(BuildContext context) {

    //Scaffold
    return Scaffold(


      //App bar
      appBar: AppBar(
        title:const Text("Home"),
              centerTitle: true, // Menempatkan judul di tengah

      actions: [
        // loggout button
        IconButton(onPressed: logout, icon: const Icon(Icons.logout))
      ],
      ),
      drawer: MyDrawer(),
    );
  }
}