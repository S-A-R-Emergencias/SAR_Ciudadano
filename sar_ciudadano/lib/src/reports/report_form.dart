import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sar_ciudadano/home/screens/panic_screen.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../global/environment.dart';

void main() => runApp( FormScreen(type:"No especificado"));

class FormScreen extends StatefulWidget {
  FormScreen({Key? key, required this.type}) : super(key: key);
  String type;
  

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  late MapZoomPanBehavior _zoomPanBehavior;
  late MapTileLayerController _controller;
  late MapLatLng _markerPosition;
  //TextEditingController descriptionController = TextEditingController();
  final descriptionController = TextEditingController();
  XFile? pickedFile;
  String newImage ="";
  final picker = ImagePicker();

  double latitude = 0;
  double longitude = 0;

  //marcadores del mapa 
  void updateMarkerChange(Offset position) {
  _markerPosition = _controller.pixelToLatLng(position);
  latitude = _markerPosition.latitude;
  longitude = _markerPosition.longitude;
  if (_controller.markersCount > 0) {
    _controller.clearMarkers();
  }
  _controller.insertMarker(0);
}

  @override
  void initState() {
    // TODO: implement initState
    _zoomPanBehavior = _CustomZoomPanBehavior()
        ..onTap = updateMarkerChange;
    _controller = MapTileLayerController();
    super.initState();
    
    
  }

  Future selImagen(op) async{
  if(op == 1){
    await picker.pickImage(source: ImageSource.camera).then((value) => pickedFile = value);

  }else{
    await picker.pickImage(source: ImageSource.gallery).then((value) => pickedFile = value);
  }
  if(pickedFile != null ){
      try{
        final bytes = await pickedFile!.readAsBytes();
        newImage = base64Encode(bytes);
        setState(() {});
        
      } catch (e) {
        print(e);
      }
    }else{
      SnackBar(
        content: const Text('No ha seleccionado una imagen'),
      );
    }
  }

  opciones (context){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  selImagen(1);

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.orange))
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Tomar una foto ',  style: TextStyle(
                          fontSize: 16
                        ),),
                        ),
                        Icon(Icons.camera_alt, color: Colors.orange)
                    ],
                    ),

                ),
              ),
               InkWell(
                onTap: (){
                  selImagen(2);
                  Navigator.of(context).pop();

                },
                child: Container(
                  padding: EdgeInsets.all(20),
               
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Selecciona una foto',  style: TextStyle(
                          fontSize: 16

                        ),),
                        ),
                        Icon(Icons.image, color: Colors.orange)
                    ],
                    ),

                ),
              ),
               InkWell(
                onTap: (){
                  Navigator.of(context).pop();

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Cancelar',  style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ), textAlign:TextAlign.center ),
                        ),
                    ],
                    ),
                ),
              )
            ],
            ),
         ),

      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 54, 84, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>  PanicScreen())));
          },
        ),
        
        backgroundColor:Color.fromRGBO(253, 112, 19, 1),
      ),
      body: Column(
        children: [
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
              ListView(
                children:<Widget>[Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(40, 54, 84, 1),
                ),          
                child: Column(
                  children: <Widget>[
                    Container(height:20),
                    Container(height:20),
                    InkWell(
                      child:
                        ClipRRect(
                        borderRadius:
                        BorderRadius.circular(10),
                          child: Container(
                            width: 600,
                            height: 400,
                            child:SfMaps(
                              layers: [
                                  MapTileLayer(
                                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      initialFocalLatLng: MapLatLng(-17.3914, -66.1683),
                                      initialZoomLevel: 14,
                                      zoomPanBehavior: _zoomPanBehavior,
                                      controller: _controller,
                                      markerBuilder: (BuildContext context, int index) {
                                        return MapMarker(
                                            latitude: _markerPosition.latitude,
                                            longitude: _markerPosition.longitude,
                                            child: Icon(
                                              Icons.location_on,
                                              color: Colors.red,
                                              size: 30,
                                            ));
                                      },
                                  ),
                              ],
                            )
                          ),
                      ),
                    ),
                    
                    Container(height: 50,),
                    SizedBox(
                      width:400,
                      child:TextFormField(
                            maxLines: 6,
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              hintText: '¿Cuál es el problema?',
                              labelText: 'Descripción',
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            onSaved: (String? value) {
                            },
                            validator: (String? value) {
                              return (value == null) ? 'No dejes vacio este espacio' : null;
                            },
                          ), 
                    ),
                    Container(height: 50,),
                  ],
                ),
              ),
              ],
            ),
          ),
          Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                    width: 800.0,
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
                          "Captura que esta pasando alrededor de ti",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(40, 54, 84, 1),
                          ),
                        ),
                        Container(height:20),
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
                                      onPressed: () {opciones(context);},
                                    ),
                                  ),
                              ),
                              Container(width: 70.0),
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
                              Container(width: 70.0),
                              FloatingActionButton(
                                onPressed: () {
                                  //final noti = Not(
                                  //  description: descriptionController.text,
                                  //);
                                  final noti = Not();

                                  createNotification(noti,widget.type);
                                  descriptionController.text = "";
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => PanicScreen())));

                                },
                                backgroundColor: Color.fromRGBO(253, 112, 19, 1),
                                child: const Icon(Icons.send),
                              ),
                            ],
                          ),
                       ],
                      ),
                    ),
                    
                  ],
                ),
        ],
      )
    );
    
  }

Future createNotification(Not noti,String type) async {
    final docNoti = FirebaseFirestore.instance.collection('notificacion').doc();
    noti.body = descriptionController.text;
    noti.image =Environment.usersession!.image == null? "":Environment.usersession!.image;
    noti.name = Environment.usersession!.name! + " " + Environment.usersession!.lastName!;
    noti.notificationImage = newImage;
    noti.email = Environment.usersession!.email!;
    noti.latitude = latitude;
    noti.longitude = longitude;
    noti.type = type;

    final json = noti.toJson();
    await docNoti.set(json);
  }

}

class _CustomZoomPanBehavior extends MapZoomPanBehavior {
  _CustomZoomPanBehavior();
  late MapTapCallback onTap;

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerUpEvent) {
      onTap(event.localPosition);
    }
    super.handleEvent(event);
  }
}

typedef MapTapCallback = void Function(Offset position);
