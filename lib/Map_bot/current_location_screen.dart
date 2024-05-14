import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Ayush/Map_bot/SupportPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Ayush/Map_bot/Logout_page.dart';
import 'package:Ayush/Map_bot/customInfoWindow.dart';


class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;
  // CameraPosition? initialCameraPosition;
  static const CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(26.9124, 75.7873), zoom: 14);

  Set<Marker> markers = {};

  List<Marker> _markers = [];

  void initState() {
    super.initState();
    _markers = [
      Marker(
          markerId: MarkerId("1"),
          position: LatLng(26.896347922436238, 75.72157110377036),

          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: CustomInfoWindow(
                      title: "SM Ayush Hospital & Holistic Center",
                      imageURL: "https://lh5.googleusercontent.com/p/AF1QipO-tYXjPQ1XDi4_HnsxP4hF594FHMAfF5N0Ebv0=w408-h544-k-no",
                      openingHours: "9 AM - 8 PM",
                      phoneNumber: "Not provided",
                      adress: "C-1 Janki vihar, Ajmer Rd, Dhawas, Jaipur, Rajasthan 302021",
                    ),
                  );
                });
          }),
      Marker(
          markerId: MarkerId("2"),
          position: LatLng(26.88786596258176, 75.75281761183508),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: CustomInfoWindow(
                      title: "Ayush Hospital",
                      imageURL: "https://lh5.googleusercontent.com/p/AF1QipMpvQmnJaJcJOPuooVH_cukjeLe48cKcyVvN5Qr=w408-h905-k-no",
                      openingHours: "8AM - 2PM ",
                      phoneNumber: "01414033146",
                      adress: "34, Shiv Shakti Nagar, Nirman Nagar, Brijlalpura, Jaipur, Rajasthan 302019",
                    ),
                  );
                });
          }),
      Marker(
          markerId: MarkerId("3"),
          position: LatLng(26.846060942955614, 75.77067039307416),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: CustomInfoWindow(
                      title: "Ayush Child Clinic",
                      imageURL: "https://images1-fabric.practo.com/ayush-child-clinic-jaipur-1446781413-563c21e59c25c.jpg",
                      openingHours: "9AM - 12PM ",
                      phoneNumber: "9829118485",
                      adress: "Thadi Market, Mansarovar Sector 7, Mansarovar, Jaipur, Rajasthan 302020",
                    ),
                  );
                });
          }),
      Marker(
          markerId: MarkerId("4"),
          position: LatLng(26.903964052359974, 75.74883115018667),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: CustomInfoWindow(
                      title: "Ayush Ayurvedic",
                      imageURL: "https://content.jdmagicbox.com/comp/jaipur/w3/0141px141.x141.130806231517.s9w3/catalogue/ayush-ayurveda-clinic-adarsh-nagar-jaipur-ayurvedic-doctors-1fsee01-250.jpg",
                      openingHours: "10AM - 5PM ",
                      phoneNumber: "No phone no.",
                      adress: "445, A, Vidhyut Nagar, Jaipur, Rajasthan 302021",
                    ),
                  );
                });
          }),
      Marker(
          markerId: MarkerId("5"),
          position: LatLng(26.86109301136174, 75.79586636596103),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: CustomInfoWindow(
                      title: "Jaipur Ayurveda Hospital",
                      imageURL: "https://lh5.googleusercontent.com/p/AF1QipMNit8k2bSswDILX1_KidR27aBIqY8mYLLlZblr=w408-h306-k-no",
                      openingHours: "9:30AM - 2PM ",
                      phoneNumber: "09414446677",
                      adress: "A-49, Jai Ambe Nagar, Tonk Road, Near Gopalpura Flyover, Tonk Rd, Jaipur, Rajasthan 302015",
                    ),
                  );
                });
          }),
      Marker(
          markerId: MarkerId("6"),
          position: LatLng(26.89950251427979, 75.75435179164505),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: CustomInfoWindow(
                      title: "Suryansh Arogyashala University Ayurveda Hospital and Research Centre",
                      imageURL: "https://www.jvwu.ac.in/Uploads/PhotoGallery/319c19bd-096f-46ea-9ffe-22ae6dc796b6/_medium.jpg",
                      openingHours: "9:30AM - 2PM ",
                      phoneNumber: "01428515815",
                      adress: "Vedant Gyan Valley, Mahala-Jobner Link Road, NH-8, Jaipur - Ajmer Express Way, Jharna, Rajasthan 303122",
                    ),
                  );
                });
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AYUSH Accessibility"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext context) {
              return logoutPage(); // Show user information dialog
            },);
          }, icon: Icon(Icons.exit_to_app),)
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers.union(Set<Marker>.from(_markers)),
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        onTap: (latLng) {
          // Hide info window when map is tapped
          setState(() {
            markers = {};
          });
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () async {
              Position position = await _determinePosition();

              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14,
                  ),
                ),
              );

              markers.clear();

              markers.add(Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude),
              ));

              setState(() {});
            },
            label: const Text("Current Location"),
            icon: const Icon(Icons.location_history),
          ),
          const SizedBox(height: 16), // Add some space between buttons
          FloatingActionButton.extended(
            onPressed: () {
              // Navigate to the support chat bot page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            label: const Text("Support Chat Bot"),
            icon: const Icon(Icons.support_agent),
          ),
        ],
      ),
    );
  }

  void launchWebsite(Uri url) async {
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }


  // void _showAdminInputDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AdminInputDialog(
  //         context: context,
  //         onMarkerAdded: (marker) {
  //           setState(() {
  //             markers.add(marker);
  //           });
  //         },
  //       );
  //     },
  //   );
  // }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}

/*
class AdminInputDialog extends StatelessWidget {
  final BuildContext context;

  final Function(Marker) onMarkerAdded;

  AdminInputDialog({super.key, required this.context,required this.onMarkerAdded});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Marker'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _latitudeController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Latitude'),
            ),
            TextField(
              controller: _longitudeController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Longitude'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _openingHoursController,
              decoration: InputDecoration(labelText: 'Opening Hours'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            // TextField(
            //   controller: _websiteUrlController,
            //   decoration: InputDecoration(labelText: 'Website URL'),
            // ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            _addMarker();
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _openingHoursController =
  TextEditingController();
  final TextEditingController _phoneNumberController =
  TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // final TextEditingController _websiteUrlController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  void _addMarker() {
    final double latitude = double.tryParse(_latitudeController.text) ?? 0.0;
    final double longitude =
        double.tryParse(_longitudeController.text) ?? 0.0;
    final String title = _titleController.text;
    final String openingHours = _openingHoursController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String adress = _addressController.text;
    // final String websiteUrl = _websiteUrlController.text;
    final String imageUrl = _imageUrlController.text;

    final marker = Marker(
      markerId: MarkerId(title),
      position: LatLng(latitude, longitude),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: CustomInfoWindow(
                title: title,
                imageURL: imageUrl,
                openingHours: openingHours,
                phoneNumber: phoneNumber,
                adress: adress,
              ),
            );
          },
        );
      },
    );

    onMarkerAdded(marker);
  }
}
 */
