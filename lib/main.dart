import 'dart:async';
import 'package:logintry/auth/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC6Zh0D0DQid-abYmMlwxpCjZpvBz38dJg",
        appId: "1:950937116212:android:09b1acf8182794078ab461",
        messagingSenderId: "950937116212",
        projectId:"logintry-769ee", )
  )
      :await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}