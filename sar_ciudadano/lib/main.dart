import 'package:flutter/material.dart';
import 'package:sar_ciudadano/constans.dart';
import 'package:sar_ciudadano/home/screens/sing_in_screen.dart';
import 'package:sar_ciudadano/home/screens/register_screen.dart';
import 'package:sar_ciudadano/home/screens/profile.dart';
import 'package:sar_ciudadano/src/reports/report_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

