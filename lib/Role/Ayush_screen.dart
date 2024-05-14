// import 'package:Ayush/Map_bot/Guest_current_location.dart';
import 'package:flutter/material.dart';
import 'package:Ayush/Map_bot/current_location_screen.dart';
// import 'package:logintry/auth/login_screen.dart';
import 'package:Ayush/auth/User_login_screen.dart';
import 'package:Ayush/auth/Admin_login_screen.dart';
import 'package:Ayush/Map_bot/Guest_current_location.dart';

class AyushScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ayush_logo.png',
                width: 200,
                height: 140,
              ),
              SizedBox(
                  height: 20), // Add some space between the image and buttons
              // Your buttons here
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserLogin()),
                  );
                  // Handle button press
                },
                child: Text('Start as User'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminLogin()),
                  );
                  // Handle button press
                },
                child: Text('Start as Admin'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GuestModeMaps()),
                  );
                  // Handle button press
                },
                child: Text('Start as Guest'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
