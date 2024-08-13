import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {

  @override
    void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
    _initializeFirebaseMessaging();
    // _getCurrentLocation();
    // latValue = 11.3753926;
    // longValue = 77.8938889;
  }
  Future<void> _initializeFirebaseMessaging() async {
  final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true);
  print("notificationSettings: $notificationSettings");
  
  
  // You can also add additional logic here to handle the notification settings
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("hello")
      ],),
    );
  }
}