import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sar_ciudadano/constans.dart';
import 'package:sar_ciudadano/home/screens/sing_in_screen.dart';
import 'package:sar_ciudadano/home/screens/register_screen.dart';
import 'package:sar_ciudadano/home/screens/profile.dart';
import 'package:sar_ciudadano/src/reports/report_form.dart';

//void main() => runApp(const MyApp());

//Future main() async {
 // WidgetsFlutterBinding.ensureInitialized();

//  await Firebase.initializeApp();

//  runApp(const MyApp());
//}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDxLKJAnexCSkPZmfuvV2gvHVsq6qH6dEU",
          authDomain: "emergencias-sar.firebaseapp.com",
          databaseURL: "https://emergencias-sar-default-rtdb.firebaseio.com",
          projectId: "emergencias-sar",
          storageBucket: "emergencias-sar.appspot.com",
          messagingSenderId: "47517749067",
          appId: "1:47517749067:web:f47bc2d3588c44a3d6a2ce",
          measurementId: "G-SG9JVRT773"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergencias SAR',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme:
            Theme.of(context).textTheme.apply(bodyColor: kSecondaryColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SingInScreen (),
    );
  }
}

