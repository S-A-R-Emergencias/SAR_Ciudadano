import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sar_ciudadano/home/screens/profile.dart';
import 'package:sar_ciudadano/home/screens/register_screen.dart';
import 'package:sar_ciudadano/src/global/environment.dart';
import 'package:sar_ciudadano/src/reports/report_form.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(const PanicScreen());

class PanicScreen extends StatefulWidget {
  const PanicScreen({Key? key}) : super(key: key);

  @override
  State<PanicScreen> createState() => _PanicScreenState();
}

class _PanicScreenState extends State<PanicScreen> {
  @override
  Widget build(BuildContext context) {
    final _initialCameraPosition = CameraPosition(
    target: LatLng(0,0),);
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 54, 84, 1),
      body: 
        Stack(
          children: [
              Row(
                children: [
                  InkWell(
                    child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('assets/img/sar.jpg'),
                      fit: BoxFit.fill
                    ),
                    ),
                  ),
                  onTap: (){
                    if(Environment.usersession == null)
                    {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>  ResgisterScreen())));
                    }
                    else{
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>  ProfilePage())));
                    }
                    
                  },
                  ),
                  Text(
                    Environment.usersession == null? "Anónimo" : Environment.usersession!.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24.0,
                      color: Color.fromRGBO(238, 238, 238, 1),
                    ),
                  ),
                ],
              ),
              Center(child:
                InkWell(
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: Color.fromRGBO(253, 112, 19, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                          "EMERGENCIA !!",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Color.fromRGBO(238, 238, 238, 1),
                          ),
                        ), // Border radius
                  ),
                ),
                onTap: () {}
              ),
              ),
              
            
            SlidingUpPanel(
            minHeight: 50,
            maxHeight: 300,
            color: Color.fromRGBO(238, 238, 238, 1),
            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
            panel: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(238, 238, 238, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Text(
                          "REPORTES" ,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Color.fromRGBO(40, 54, 84, 1),
                          ),
                        ),
                        Container(height:20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              InkWell(
                                child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10),
                                  child: Container(
                                    color: Color.fromRGBO(40, 54, 84, 1),
                                    width: 80,
                                    height: 80,
                                    child: 
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                        Icon(Icons.fire_extinguisher,color: Colors.white, size: 40,),
                                        Text(
                                        "Incendio",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]) 
                                  ),
                              ),
                              onTap: () {
                                if(Environment.usersession == null){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Regístrate para desbloquear esta función")));
                                }
                                else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>  FormScreen())));
                                }
                                
                              }
                              ),

                              
                              Container(width: 100.0),
                              InkWell(
                                child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10),
                                  child: Container(
                                    color: Color.fromRGBO(40, 54, 84, 1),
                                    width: 80,
                                    height: 80,
                                    child: 
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                        Icon(Icons.waves,color: Colors.white, size: 40,),
                                        Text(
                                        "Inundación",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]) 
                                  ),
                              ),
                              onTap: () {
                                if(Environment.usersession == null){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Regístrate para desbloquear esta función")));
                                }
                                else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>  FormScreen())));
                                }
                              }
                              ),
                              Container(width: 100.0),
                              InkWell(
                                child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10),
                                  child: Container(
                                    color: Color.fromRGBO(40, 54, 84, 1),
                                    width: 80,
                                    height: 80,
                                    child: 
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                        Icon(Icons.car_crash_sharp,color: Colors.white, size: 40,),
                                        Text(
                                        "Accidente",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]) 
                                  ),
                              ),
                              onTap: () {
                                if(Environment.usersession == null){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Regístrate para desbloquear esta función")));
                                }
                                else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>  FormScreen())));
                                }
                              }
                              ),
                            ],
                          ),
                          Container(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              InkWell(
                                child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10),
                                  child: Container(
                                    color: Color.fromRGBO(40, 54, 84, 1),
                                    width: 80,
                                    height: 80,
                                    child: 
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                        Icon(Icons.warning,color: Colors.white, size: 40,),
                                        Text(
                                        "Rescate",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]) 
                                  ),
                              ),
                              onTap: () {
                                if(Environment.usersession == null){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Regístrate para desbloquear esta función")));
                                }
                                else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>  FormScreen())));
                                }
                              }
                              ),

                              
                              Container(width: 100.0),
                              InkWell(
                                child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10),
                                  child: Container(
                                    color: Color.fromRGBO(40, 54, 84, 1),
                                    width: 80,
                                    height: 80,
                                    child: 
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                        Icon(Icons.area_chart,color: Colors.white, size: 40,),
                                        Text(
                                        "Derrumbe",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]) 
                                  ),
                              ),
                              onTap: () {
                                if(Environment.usersession == null){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Regístrate para desbloquear esta función")));
                                }
                                else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>  FormScreen())));
                                }
                              }
                              ),
                              Container(width: 100.0),
                              InkWell(
                                child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10),
                                  child: Container(
                                    color: Color.fromRGBO(40, 54, 84, 1),
                                    width: 80,
                                    height: 80,
                                    child: 
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                        Icon(Icons.question_mark,color: Colors.white, size: 40,),
                                        Text(
                                        "Otro",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]) 
                                  ),
                              ),
                              onTap: () {
                                if(Environment.usersession == null){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Regístrate para desbloquear esta función")));
                                }
                                else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>  FormScreen())));
                                }
                              }
                              ),
                            ],
                          ),
                       ]
                      ),
                    ),
            ],
          ),
            ),
          )
          ]
        ),
      );
  }
}