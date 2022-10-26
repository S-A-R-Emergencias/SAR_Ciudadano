import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sar_ciudadano/constans.dart';
import 'package:sar_ciudadano/home/screens/panic_screen.dart';
import 'package:sar_ciudadano/home/screens/sing_in_screen.dart';
import 'package:sar_ciudadano/src/global/environment.dart';
import 'package:http/http.dart' as http;
import 'package:sar_ciudadano/src/services/person_service.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String secondLastName = Environment.usersession!.secondLastName == null? "" :Environment.usersession!.secondLastName.toString();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  PersonService service = PersonService();
  //Limpiar campos
  void CleanInputs(){
    newPasswordController.text = "";
    confirmPasswordController.text = "";
    oldPasswordController.text="";
  }
  //cambio de Contraseña
  void SavePassword(){
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;
    String oldPassword = oldPasswordController.text;
    if((newPassword!= "" && confirmPassword!= "" && oldPassword!="") && (confirmPassword == newPassword && newPassword != oldPassword)){
      service.changePassword(newPassword, Environment.usersession!.id!).then((value) => {
        if(value.statusCode == 200){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Contraseña actualizada correctamente"))),
          CleanInputs()
                                      
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Ha ocurrido un error al actualizar la contraseña")))
        }
      });
    }
  }
  //campo que muestra los datos
  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }
  //PopUp que sale al presionar cambiar contraseña
  void ChangePassword() {
    showDialog(
    context: context,
    builder: (BuildContext context){
      return ClipRRect(
              borderRadius:
              BorderRadius.circular(20),
              child:AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              obscureText: true,
                              controller: oldPasswordController,
                              decoration: InputDecoration(
                                labelText: "Contraseña Anterior",
                                border: InputBorder.none,
                                icon: Icon(Icons.password),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              obscureText: true,
                              controller: newPasswordController,
                              decoration: InputDecoration(
                                labelText: "Contraseña Nueva",
                                border: InputBorder.none,
                                icon: Icon(Icons.password),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              obscureText: true,
                              controller: confirmPasswordController,
                              decoration: InputDecoration(
                                labelText: "Confirmar Contraseña",
                                border: InputBorder.none,
                                icon: Icon(Icons.password_outlined),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          SavePassword();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(40, 54, 84, 1)
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Guardar',  style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                                ), textAlign:TextAlign.center ),
                                ),
                            ],
                            ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          CleanInputs();
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
                )
      );
    }
  );
  }
  //inicio de la página
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
                          builder: ((context) =>  PanicScreen())));
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/sar.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, left: 184),
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>  EditProfile())));
                    },
                  ),
                ),
              ),
              ButtonTheme(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(Color.fromRGBO(40, 54, 84, 1)),
                    
                  ),
                  onPressed: (){
                    ChangePassword();
                  },
                  child: const Text(
                    "Cambiar Contraseña",
                    style: TextStyle(
                        color: Color(0xB8F7F7F8), fontWeight: FontWeight.bold, fontSize:18),
                  ),
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(
                      hintText: 'Nombre: ' + Environment.usersession!.name.toString()+ " " + Environment.usersession!.lastName.toString() + " " + secondLastName,
                      
                    ),
                    textfield(
                      hintText: 'Email:'  + Environment.usersession!.email.toString(),
                      
                    ),
                    textfield(
                      hintText: 'Teléfono:'  + Environment.usersession!.telephone.toString() ,
                    ),
                    textfield(
                      hintText: 'Dirección:'  + Environment.usersession!.address.toString(),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                            "Toda tu información será usada \n con fines de seguridad en el momento en \n el que se requieran",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              )
            ],
          ),
          
          
        ],
      ),
    );
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