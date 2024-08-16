import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final Telephony telephony = Telephony.instance;
  String textReceived = " ";

  void startListening() {
    print("OPt");
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          // Handle message
          setState(() {
            textReceived = message.body.toString();
          });
        },
        // onBackgroundMessage: backgroundMessageHandler
        listenInBackground: false);
  }

  @override
  void initState() {
    super.initState();
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resd Sms"),
      ),
      body: Center(child: Text("Sms : $textReceived")),
    );
  }
}
