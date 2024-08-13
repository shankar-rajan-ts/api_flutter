import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  void _initializeFCM() {
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
      // Store the token on your server for sending targeted messages
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    print("token");
    // _initializeFirebaseMessaging();
    _initializeFCM();
    // _getCurrentLocation();
    // latValue = 11.3753926;
    // longValue = 77.8938889;
  }

  // Future<void> _initializeFirebaseMessaging() async {
  //   final notificationSettings =
  //       await FirebaseMessaging.instance.requestPermission(provisional: true);
  //   print("notificationSettings: $notificationSettings");

  //   // You can also add additional logic here to handle the notification settings
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(title: Text("data"),),
        
        body: Center(
          child: Column(
            children: [Text("hello")],
          ),
        ),
      ),
    );
  }
}
