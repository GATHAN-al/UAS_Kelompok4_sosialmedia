import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_chat/auth/auth_gate.dart';
import 'package:flutter_application_chat/firebase_options.dart';

import 'package:flutter_application_chat/themes/light_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // Change from StatefulWidget to StatelessWidget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const AuthGate(),
      theme: lighMode,
    );
  }
}
 