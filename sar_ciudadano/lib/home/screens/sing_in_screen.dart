import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sar_ciudadano/Models/person_model.dart';
import 'package:sar_ciudadano/constans.dart';
import 'package:sar_ciudadano/home/screens/profile.dart';
import 'package:sar_ciudadano/home/screens/register_screen.dart';
import 'package:flutter/services.dart';
import 'package:sar_ciudadano/src/global/environment.dart';
import 'package:sar_ciudadano/src/services/person_service.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  String? email;
  String? password;
  Person? p;
  PersonService service = PersonService();
  
  

  Future<void> login() async {
    final response = await http.get(Uri.parse('${Environment.apiURL}/person/login/${email}/${password}'));//Consulta a api para login
    if(response.statusCode == 200 || response.statusCode == 304)
    {
      var datauser = json.decode(response.body);
      p = Person.fromJson(datauser);
      Environment.usersession = p;
    }
    else {
      Environment.usersession = null;
    }
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Bienvenidos a\n Emergencias SAR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: kTextColor,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/img/sar.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      icon: Icon(Icons.email),
                    ),
                    onChanged:(value) {
                      email = value;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      border: InputBorder.none,
                      icon: Icon(Icons.password),
                    ),
                    onChanged:(value) {password = value;},
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonTheme(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(kPrimaryColor),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.all(10)),
                ),
                onPressed: () =>  {
                  login().then((value) => {
                    if(Environment.usersession != null){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>  ProfilePage()))),
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Email o contraseña incorrectos"),
                      ))
                    }
                  }),
                },
                child: const Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                      color: Color(0xB8F7F7F8), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                '¿No tienes cuenta?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: kTextColor,
                ),
              ),
            ),
            ButtonTheme(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(kPrimaryColor),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.all(10)),
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ResgisterScreen())))
                },
                child: const Text(
                  "Regístrate",
                  style: TextStyle(
                      color: Color(0xB8F7F7F8), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                '¿No quieres perder tiempo? Continúa como anónimo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: kTextColor,
                ),
              ),
            ),
            ButtonTheme(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(kPrimaryColor),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.all(10)),
                ),
                onPressed: () =>  {
                },
                child: const Text(
                  "Anónimo",
                  style: TextStyle(
                      color: Color(0xB8F7F7F8), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
