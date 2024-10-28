import 'package:flutter/material.dart';
import 'package:flutter_application_chat/my_drawer.tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Theme.of(context).colorScheme.surface,
      child:  SafeArea(
        child: Column(
          children: [
            //logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
              ),

              // home tile
              MyDrawerTile(title: "H O M E", icon: Icons.home, onTap: () {},)

              // profile tile

              // seacrch tile

              // settings tile

              //logout tile
          ],
        ),
      ),
    );
  }
}