import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

String locationMessage = 'Current loaction';
late String lat;
late String long;

Future<Position> _getCurrentLocation() async {
  print(locationMessage);
  bool serviceEnable = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnable) {
    return Future.error("Location Service ");
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }
  Position position = await Geolocator.getCurrentPosition();
  print(position.latitude);
  print(position.longitude);
  return position;
}

class _CurrentLocationState extends State<CurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.of(context).popAndPushNamed("/login");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Current Location"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _getCurrentLocation().then((value) {
                // lat = '${value.latitude}';
                // long = '${value.longitude}';
                print(value.longitude);
                print(value.latitude);
              });
            },
            child: Text("Current Location")),
      ),
    ));
  }
}
