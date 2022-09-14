import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FormScreen());

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 54, 84, 1),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        
        backgroundColor:Color.fromRGBO(253, 112, 19, 1),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 170.0,
            color: Color.fromRGBO(253, 112, 19, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0,top: 20.0),
                  width: 350.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "INFÓRMANOS SOBRE \nEL PROBLEMA \n",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "Manten la calma! \n La ayuda llegara pronto",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8), // Border radius
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8), // Border radius
                        child: ClipOval(child: Icon(Icons.warning_rounded,size: 52.0,color: Colors.black,)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: 
              Column(
                children:<Widget>[Container(
                height: 500.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(40, 54, 84, 1),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                    height: 200.0,
                    alignment: Alignment.topLeft,
                    width: 700.0,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(238, 238, 238, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            Text(
                            "Captura que esta pasando alrededor de ti",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(40, 54, 84, 1),
                            ),
                          ),
                          Container(height: 50.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                    child: Container(
                                      color: Color.fromRGBO(40, 54, 84, 1),
                                      width: 60,
                                      height: 60,
                                      child: IconButton(
                                        icon: Icon(Icons.camera,color: Colors.white, size: 40,),
                                        tooltip: 'Abrir Cámara',
                                        onPressed: () {},
                                      ),
                                    ),
                                ),
                                Container(width: 100.0),
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                    child: Container(
                                      color: Color.fromRGBO(40, 54, 84, 1),
                                      width: 60,
                                      height: 60,
                                      child: IconButton(
                                        icon: Icon(Icons.video_camera_front,color: Colors.white, size: 40,),
                                        tooltip: 'Grabar Video',
                                        onPressed: () {},
                                      ),
                                    ),
                                ),
                                Container(width: 100.0),
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                    child: Container(
                                      color: Color.fromRGBO(40, 54, 84, 1),
                                      width: 60,
                                      height: 60,
                                      child: IconButton(
                                        icon: Icon(Icons.mic,color: Colors.white, size: 40,),
                                        tooltip: 'Grabar Audio',
                                        onPressed: () {},
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          
                        ]
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
