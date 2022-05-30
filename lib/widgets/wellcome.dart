import 'package:flutter/material.dart';
import 'package:barbershop_app/widgets/login.dart';
import 'package:barbershop_app/routes/admin_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({ Key? key }) : super(key: key);

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  void initState(){
    super.initState();
    verificarToken().then((value) {
      if(value){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const AdminHome(),
          )
        );
      }else{
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const Content(),
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }

  Future<bool> verificarToken() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getString('access_token') != null){
      return true;
    } else{
      return false;
    }
  }
}