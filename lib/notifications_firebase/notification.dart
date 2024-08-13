import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationFire extends StatefulWidget {
  @override
  State<NotificationFire> createState() => _NotificationFireState();
}

class _NotificationFireState extends State<NotificationFire> {

  @override
  void initState() {
    super.initState();

    _initializeFirebaseMessaging();
  }
  // Stream listener

  Future<void> _initializeFirebaseMessaging() async {
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);

    setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      Navigator.pushNamed(
        context,
        '/chat',
        arguments: ChatArguments(message),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text("hello");
  }
}

// Define ChatArguments class
class ChatArguments {
  final RemoteMessage message;

  ChatArguments(this.message);
}
