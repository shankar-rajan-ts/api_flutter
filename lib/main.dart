import 'package:api_flutter/login/login.dart';
import 'package:api_flutter/map/cuttent-loaction.dart';
import 'package:api_flutter/map/map.dart';
import 'package:api_flutter/notifications_firebase/notification.dart';
import 'package:api_flutter/notifications_firebase/sample.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await FirebaseMessaging.instance.requestPermission();
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: uiDarkTheme,
      // theme: uiTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Login(),
        // '/t': (BuildContext context) => const MyHomePage(),
        // "/mapSample": (BuildContext context) => const MapSample(),
        "/notificationFire": (BuildContext context) => NotificationFire(),
        // "/currentLocation": (BuildContext context) => const CurrentLocation(),
        "/sample": (BuildContext context) => const Sample(),


      },
    );
  }
}
// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       // darkTheme: uiDarkTheme,
// //       // theme: uiTheme,
// //       themeMode: ThemeMode.light,
// //       debugShowCheckedModeBanner: false,
// //       routes: <String, WidgetBuilder>{
// //         '/': (BuildContext context) => const Login(),
// //         // '/t': (BuildContext context) => const MyHomePage(),
// //         // "/login": (BuildContext context) => const Login(),
// //       },
// //     );
// //   }
// // }
