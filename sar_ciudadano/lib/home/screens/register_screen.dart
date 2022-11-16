import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sar_ciudadano/constans.dart';
import 'package:sar_ciudadano/home/screens/sing_in_screen.dart';
import '../../Models/person_model.dart';
import '../../src/services/person_service.dart';

void main() => runApp(const ResgisterScreen());
    
    
class ResgisterScreen extends StatefulWidget {

  
  const ResgisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ResgisterScreen> createState() => _ResgisterScreenState();
}

class _ResgisterScreenState extends State<ResgisterScreen> {
  DateTime? pickDate;
  final String role="0";
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
  @override
  Widget build(BuildContext context) {

    
    

     Future<void> insertPerson() async{
      if(name.text == ""|| lastName.text == ""|| secondLastName.text == "" ||
      ci.text==""||address.text==""||birthDate.text==""|| email.text == ""|| telephone.text == ""|| password.text == ""){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Rellene todos los campos"),
                      ));
      }else{
        try{
          Person PersonNew = new Person(name: name.text,lastName: lastName.text,secondLastName: secondLastName.text,ci: int.parse(ci.text),address: address.text,birthDate:pickDate,email:
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
                      hintText: "Nombre",
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
                      hintText: 'Apellido',
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
                      hintText: 'Apellido Materno',
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
                      hintText: 'Dirección',
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
                      color: Color(0xB8F7F7F8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        readOnly: true,
                        onTap:() async {
                          DateTime? pickedDate;
                          pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
                          if(pickedDate!= null){
                            try{
                              birthDate.text = pickedDate.year.toString() + "-" + pickedDate.month.toString() + "-" + pickedDate.day.toString();
                              pickDate = pickedDate;
                            }catch (e) {
                              print("ERROR");
                            }
                          }
                          setState(() {
                            
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Fecha de Nacimiento',
                          border: InputBorder.none,
                          icon: Icon(Icons.date_range),
                        ),
                        controller: birthDate,
                        
                        
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
                      hintText: 'Telefono',
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
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
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
                onPressed: (){
                  insertPerson();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>  SingInScreen())));
                },
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
