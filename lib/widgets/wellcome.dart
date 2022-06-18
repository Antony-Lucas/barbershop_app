import 'package:flutter/material.dart';
import 'package:barbershop_app/widgets/login.dart';
import 'package:barbershop_app/routes/admin/admin_home.dart';
import 'package:barbershop_app/api_keys/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({Key? key}) : super(key: key);

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  void initState() {
    super.initState();
    verificarToken().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminHome(),
            ));
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Content(),
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref);
    if (pref.getString('access_token') != null) {
      return true;
    } else {
      return false;
    }
  }
}
