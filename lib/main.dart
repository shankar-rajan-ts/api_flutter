import 'package:api_flutter/api/formapi.dart';
import 'package:api_flutter/firebase_otp/log.dart';
import 'package:api_flutter/form/form.dart';
import 'package:api_flutter/login/login.dart';
import 'package:api_flutter/map/cuttent-loaction.dart';
import 'package:api_flutter/map/map.dart';
import 'package:api_flutter/notifications_firebase/notification.dart';
import 'package:api_flutter/notifications_firebase/sample.dart';
import 'package:api_flutter/otp/otp.dart';
import 'package:api_flutter/otp/otp_design.dart';
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
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDQ3vr2LOhoA7e4FTYSwSCudSOWP702CFI',
      appId: '1:138569649495:android:68ce0e7aaf684736438212',
      messagingSenderId: '138569649495',
      projectId: 'bfx-notify',
      databaseURL: 'https://bfx-notify-default-rtdb.firebaseio.com',
      storageBucket: 'bfx-notify.appspot.com',
    ),
  );
  // await FirebaseMessaging.instance.requestPermission();

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
        // '/': (BuildContext context) => const Login(),
        '/': (BuildContext context) => const LoginPage(),

        // '/t': (BuildContext context) => const MyHomePage(),
        "/mapSample": (BuildContext context) => const MapSample(),
        // "/notificationFire": (BuildContext context) => NotificationFire(),
        "/currentLocation": (BuildContext context) => const CurrentLocation(),
        "/sample": (BuildContext context) => const Sample(),
        "/funcation": (BuildContext context) => const Funcation(),
        "/otp": (BuildContext context) => const Otp(),
        "/otp_Design": (BuildContext context) => const Otp_Design(),
        // "/loginPage": (BuildContext context) => const LoginPage(),


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
