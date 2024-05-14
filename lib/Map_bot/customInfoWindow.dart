import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String openingHours;
  final String phoneNumber;
  final String adress;
  final String imageURL;
  // final String websiteUrl;

  const CustomInfoWindow({
    required this.title,
    required this.openingHours,
    required this.phoneNumber,
    required this.adress,
    required this.imageURL
    // required this.websiteUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: imageURL.isNotEmpty
                ? Image.network(
              imageURL,
              width: 200, // Adjust size as needed
              height: 150, // Adjust size as needed
              fit: BoxFit.cover,
            )
                : Container(),
          ), // Show empty container if no image URL is provided
          SizedBox(height: 8),
          Text(
            'Opening Hours: $openingHours',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            'Phone Number: $phoneNumber',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // Open website URL
            },
            child: Text(
              'Adress: $adress',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
