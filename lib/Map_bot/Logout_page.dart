import 'package:Ayush/Role/Ayush_screen.dart';
import 'package:flutter/material.dart';
import 'package:Ayush/Map_bot/current_location_screen.dart';

class logoutPage extends StatelessWidget {
  logoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Do you want to Log Out!"), // Title of the dialog
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("User Name: John Doe"), // Display user information
          SizedBox(height: 8), // Add some space
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AyushScreen()),
                        (route) => false,
                  );// Implement logout functionality here
                },
                child: Text("Logout"), // Logout button
              ),

            ],
          ),
        ],
      ),
    );
  }
}
