// ignore_for_file: camel_case_types

import 'package:chat/firebase_options.dart';
import 'package:chat/screens/chatScreen.dart';
import 'package:chat/screens/loginScreen.dart';
import 'package:chat/screens/registerScreen.dart';
import 'package:chat/screens/startScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
     );
    runApp(const chatApp());
 }


class chatApp extends StatelessWidget {
  const chatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: 
      {  'StartScreen':(context)=>const Startscreen(),
        'LoginScreen':(context)=>const Loginscreen(),
        'RegisterScreen':(context)=>const Registerscreen(),
        'ChatScreen':(context)=>const Chatscreen()
      },
      initialRoute: 'StartScreen',
    );
  }
}