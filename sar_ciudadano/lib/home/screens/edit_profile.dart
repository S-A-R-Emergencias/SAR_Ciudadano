import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sar_ciudadano/Models/person_model.dart';
import 'package:sar_ciudadano/constans.dart';
import 'package:sar_ciudadano/home/screens/profile.dart';
import 'package:sar_ciudadano/src/global/environment.dart';
import 'package:sar_ciudadano/src/services/person_service.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Person per = Environment.usersession!;
  final TextEditingController NameController = TextEditingController();
  final TextEditingController LastnameController = TextEditingController();
  final TextEditingController SecondLastnameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();
  final picker = ImagePicker();
  PersonService service = PersonService();
  XFile? pickedFile;
  String newImage ="";


  void initializeText(){
    NameController.text = Environment.usersession!.name!;
    LastnameController.text = Environment.usersession!.lastName!;
    SecondLastnameController.text = Environment.usersession!.secondLastName!;
    EmailController.text = Environment.usersession!.email!;
    PhoneController.text = Environment.usersession!.telephone!.toString();
    AddressController.text = Environment.usersession!.address!;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeText();
  }

  Widget ProfileImage(){
    if(Environment.usersession!.image==null){
      return Image.network('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
    }
    else{
      return Image.memory(base64Decode(Environment.usersession!.image.toString()));
    }
  }

  //Agarre de imagen
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
        Environment.usersession!.image = base64Encode(bytes);
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>  ProfilePage())));
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Perfil",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 230,
                height: 230,
                child: ProfileImage()
              ),
            ],
          ),
          ListView(
            children: [
              Container(height: 420,),
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
                      controller: NameController,
                      decoration: InputDecoration(
                        labelText: "Nombre",
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                      ),
                      onChanged:(value) {
                      },
                    ),
                  ),
                ),
              ),
              Container(height: 20,),
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
                      controller: LastnameController,
                      decoration: InputDecoration(
                        labelText: "Apellido Paterno",
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                      ),
                      onChanged:(value) {
                      },
                    ),
                  ),
                ),
              ),
              Container(height: 20,),
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
                      controller: SecondLastnameController,
                      decoration: InputDecoration(
                        labelText: "Apellido Materno",
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                      ),
                      onChanged:(value) {
                      },
                    ),
                  ),
                ),
              ),
              Container(height: 20,),
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
                      controller: EmailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: InputBorder.none,
                        icon: Icon(Icons.email),
                      ),
                      onChanged:(value) {
                      },
                    ),
                  ),
                ),
              ),
              Container(height: 20,),
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
                      controller: PhoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Teléfono",
                        border: InputBorder.none,
                        icon: Icon(Icons.phone),
                      ),
                      onChanged:(value) {
                      },
                    ),
                  ),
                ),
              ),
              Container(height: 20,),
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
                      controller: AddressController,
                      decoration: InputDecoration(
                        labelText: "Dirección",
                        border: InputBorder.none,
                        icon: Icon(Icons.home),
                      ),
                      onChanged:(value) {
                      },
                    ),
                  ),
                ),
              ),
              Container(height: 20,),
              Container(
                width: 10,
                child: ButtonTheme(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Color.fromRGBO(40, 54, 84, 1)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                          const EdgeInsets.all(10)),
                    ),
                    onPressed: () async{
                      SaveInfo().then((value) => {
                          if(value.statusCode == 200 || value.statusCode == 304){
                            Environment.usersession = per,
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Se ha guardado tu información correctamente"),
                            )),
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>  ProfilePage()))),
                          
                        }
                      });
                    },
                    child: const Text(
                      "Guardar",
                      style: TextStyle(
                          color: Color(0xB8F7F7F8), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(height: 20,),
            ]
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  opciones (context);
                },
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Future<http.Response> SaveInfo(){
    var response;
    PersonService p = PersonService();
    try{
      per.name = NameController.text==""? per.name: NameController.text;
      per.lastName = LastnameController.text==""? per.lastName: LastnameController.text;
      per.secondLastName = SecondLastnameController.text==""? per.secondLastName: SecondLastnameController.text;
      per.email = EmailController.text==""? per.email: EmailController.text;
      per.telephone = PhoneController.text==""? per.telephone: int.parse(PhoneController.text);
      per.address = AddressController.text==""? per.address:AddressController.text;
      response =  p.putPerson(per);
    } catch(ex){

    }
    return response;
    
    
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}