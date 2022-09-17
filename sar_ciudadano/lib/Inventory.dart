import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sar_ciudadano/models/inventory_model.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key, required, this.title = ""}) : super(key: key);

  final String title;

  @override
  State<Inventory> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Inventory> {
  final UserData userData = new UserData();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTIFICACIONES"),
        backgroundColor: Color.fromRGBO(252, 168, 89, 0.918),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF2C000000),
                            blurRadius: 4,
                            spreadRadius: 0.1,
                            offset: Offset(0, 2))
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/img/user.jpg'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Silvia Lopez',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '30 anos',
                                ),
                                Text(
                                  '71785955',
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Emergencia',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Auxilio mi casa se esta quemando',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      rorButtons()
                    ],
                  ),
                );
              })),
    );
  }

  Row rorButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
                Color.fromARGB(255, 255, 131, 74)),
          ),
          onPressed: () {},
          child: Text(
            'Aceptar',
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(
                    Color.fromARGB(255, 151, 151, 151))),
            onPressed: () {},
            child: Text(
              'Cancelar',
            ))
      ],
    );
  }
}
