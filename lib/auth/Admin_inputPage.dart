import 'package:flutter/material.dart';

class AdminInputPage extends StatelessWidget {
  const AdminInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Input Page'),
      ),
      body: AdminInputForm(),
    );
  }
}

class AdminInputForm extends StatefulWidget {
  const AdminInputForm({Key? key}) : super(key: key);

  @override
  _AdminInputFormState createState() => _AdminInputFormState();
}

class _AdminInputFormState extends State<AdminInputForm> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController openingHoursController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController websiteUrlController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  void dispose() {
    latitudeController.dispose();
    longitudeController.dispose();
    titleController.dispose();
    openingHoursController.dispose();
    phoneNumberController.dispose();
    websiteUrlController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextField(
            controller: latitudeController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Latitude'),
          ),
          TextField(
            controller: longitudeController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Longitude'),
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: openingHoursController,
            decoration: InputDecoration(labelText: 'Opening Hours'),
          ),
          TextField(
            controller: phoneNumberController,
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          TextField(
            controller: websiteUrlController,
            decoration: InputDecoration(labelText: 'Website URL'),
          ),
          TextField(
            controller: imageUrlController,
            decoration: InputDecoration(labelText: 'Image URL'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Save the entered details and navigate back to the main map page
              String latitude = latitudeController.text;
              String longitude = longitudeController.text;
              String title = titleController.text;
              String openingHours = openingHoursController.text;
              String phoneNumber = phoneNumberController.text;
              String websiteUrl = websiteUrlController.text;
              String imageUrl = imageUrlController.text;

              // Pass the entered details back to the main map page
              Navigator.pop(context, {
                'latitude': latitude,
                'longitude': longitude,
                'title': title,
                'openingHours': openingHours,
                'phoneNumber': phoneNumber,
                'websiteUrl': websiteUrl,
                'imageUrl': imageUrl,
              });
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
