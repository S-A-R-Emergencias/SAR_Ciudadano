import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sar_ciudadano/constans.dart';
import 'package:sar_ciudadano/home/screens/sing_in_screen.dart';
import '../../Models/person_model.dart';
import '../../src/services/person_service.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Rellene todos los campos"),
                      ));
      }else{
        try{
          Person PersonNew = new Person(name: name.text,lastName: lastName.text,secondLastName: secondLastName.text,ci: int.parse(ci.text),address: address.text,birthDate:DateTime.now(),email:
          email.text,telephone:int.parse(telephone.text),password: password.text,role: role);
          PersonService service = PersonService();
          var respuesta = await service.postPerson(PersonNew);
          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>  SingInScreen())));
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
                    controller: name,
                    decoration: InputDecoration(
                      hintText: "name",
                      border: InputBorder.none,
                      icon: Icon(Icons.account_circle),
                    ),
                  ),
                ),
              ),
            ),
            //Registro de telefon dos columnas
            SizedBox(
              height: 15,
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
                    controller:lastName,
                    decoration: InputDecoration(
                      hintText: 'lastName',
                      border: InputBorder.none,
                      icon: Icon(Icons.account_balance),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: secondLastName,
                    decoration: InputDecoration(
                      hintText: 'secondLastName',
                      border: InputBorder.none,
                      icon: Icon(Icons.account_balance),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: ci,
                    decoration: InputDecoration(
                      hintText: 'CI',
                      border: InputBorder.none,
                      icon: Icon(Icons.numbers),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: address,
                    decoration: InputDecoration(
                      hintText: 'address',
                      border: InputBorder.none,
                      icon: Icon(Icons.directions),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: birthDate,
                    decoration: InputDecoration(
                      hintText: 'birthDate',
                      border: InputBorder.none,
                      icon: Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: telephone,
                    decoration: InputDecoration(
                      hintText: 'telephone',
                      border: InputBorder.none,
                      icon: Icon(Icons.numbers),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      icon: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xB8F7F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
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

}
