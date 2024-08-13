import 'package:firebase_messaging/firebase_messaging.dart';

class Firebase {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Future<void> initNotifications = FirebaseMessaging.instance as Future<void>;

  Future<void> initNotifications() async {
    await FirebaseMessaging.instance.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print('Token: $FCMToken');
// FirebaseMessaging.onBackgroundMessage(_firebaseMessaging.onBackgroundMessage);
  }
  
}