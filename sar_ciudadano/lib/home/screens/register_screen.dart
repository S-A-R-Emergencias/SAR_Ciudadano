import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:sar_ciudadano/constans.dart';

import '../../Models/person_model.dart';
import '../../src/services/person_service.dart';


import 'package:http/http.dart' as http;

void main() => runApp(const ResgisterScreen());
    
    
class ResgisterScreen extends StatelessWidget {

  
  const ResgisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String role="a";
    TextEditingController name = new TextEditingController();
    TextEditingController lastName = new TextEditingController();
    TextEditingController secondLastName = new TextEditingController();
    TextEditingController ci = new TextEditingController();
    TextEditingController address = new TextEditingController();
    TextEditingController birthDate = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController telephone = new TextEditingController();
    TextEditingController password = new TextEditingController();
    TextEditingController password2 = new TextEditingController();

     Future<void> insertPerson() async{
      if(name.text == ""|| lastName.text == ""|| secondLastName.text == "" ||
      ci.text==""||address.text==""||birthDate.text==""|| email.text == ""|| telephone.text == ""|| password.text == ""){
        print("please fill all fields");
      }else{
        try{
          
          Person PersonNew = new Person(name: name.text,lastName: lastName.text,secondLastName: secondLastName.text,ci: int.parse(ci.text),address: address.text,birthDate:DateTime.now(),email:
          email.text,telephone:int.parse(telephone.text),password: password.text,role: role);
          PersonService service = PersonService();
          var respuesta = await service.postPerson(PersonNew);
         
        
        }catch(e){
          print(e);
        }
        
      }
        
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: const Text(
          'REGISTRO',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _MyInput("Nombre",name),
            SizedBox(
               height: 15,
            ),
            _MyInput("Apellido Paterno",lastName),
            SizedBox(
               height: 15,
            ),
            _MyInput("Apellido Materno",secondLastName),
            SizedBox(
               height: 15,
            ),
            _MyInput("CI",ci),
            SizedBox(
               height: 15,
            ),
            _MyInput("Direccion",address),
            SizedBox(
               height: 15,
            ),
            _MyInput("Fecha de Nacimiento",birthDate),
            SizedBox(
               height: 15,
            ),
            _MyInput("Numero de Telefo", telephone),
            SizedBox(
               height: 15,
            ),
            _MyInput("Correo",email),
             SizedBox(
               height: 15,
            ),
            _MyInput("Contraseña",password),
             SizedBox(
               height: 15,
            ),

            // Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0xB8F7F7F8),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       child: TextField(
                    
            //         decoration: InputDecoration(
            //           hintText: "Names",
            //           border: InputBorder.none,
            //           icon: Icon(Icons.account_circle),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // //Registro de telefon dos columnas
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0xB8F7F7F8),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       child: TextField(
                    
            //         decoration: InputDecoration(
            //           hintText: 'Phone',
            //           border: InputBorder.none,
            //           icon: Icon(Icons.phone),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0xB8F7F7F8),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       child: TextField(
            //         decoration: InputDecoration(
            //           hintText: 'Email',
            //           border: InputBorder.none,
            //           icon: Icon(Icons.email),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0xB8F7F7F8),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       child: TextField(
            //         decoration: InputDecoration(
            //           hintText: 'Password',
            //           border: InputBorder.none,
            //           icon: Icon(Icons.lock),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0xB8F7F7F8),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       child: TextField(
            //         decoration: InputDecoration(
            //           hintText: 'Confirm Password',
            //           border: InputBorder.none,
            //           icon: Icon(Icons.lock),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0xB8F7F7F8),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       child: TextField(
            //         decoration: InputDecoration(
            //           hintText: 'Address',
            //           border: InputBorder.none,
            //           icon: Icon(Icons.location_on),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            //Boton de crear cuenta
            ButtonTheme(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(kPrimaryColor),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.all(10)),
                ),
                onPressed: insertPerson,
                child: const Text(
                  "CREAR CUENTA",
                  style: TextStyle(
                      color: Color(0xB8F7F7F8), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _MyInput(String texto,TextEditingController controller_) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Center(
          child: Container(
          width: 400,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: controller_,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: texto,
              labelText: texto
            ),
          ),
        ),
        );
      },
    );
  }
  Widget inputIZI(String texto,TextEditingController controller_){
    return StreamBuilder(
      builder: (BuildContext context ,AsyncSnapshot snapshot){
        return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    // controller: controller_,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      // hintText: texto,
                      border: InputBorder.none,
                      icon: Icon(Icons.location_on),
                    ),
                  ),
                ),
              ),
            );
      },
    );
  }
  
}
