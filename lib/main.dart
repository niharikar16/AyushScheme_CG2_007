import 'dart:async';
import 'package:Ayush/Role/Ayush_screen.dart';
// import 'package:logintry/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:Ayush/Map_bot/current_location_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyC6Zh0D0DQid-abYmMlwxpCjZpvBz38dJg",
          appId: "1:950937116212:android:09b1acf8182794078ab461",
          messagingSenderId: "950937116212",
          projectId: "logintry-769ee",
        ))
      : await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AyushScreen(), // Navigate to your user authentication page
    );
  }
}
