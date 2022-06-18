import 'package:barbershop_app/widgets/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/api_keys/api_services.dart';
import 'package:barbershop_app/routes/admin/profile_admin.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          icon: const Icon(Icons.account_circle_rounded, color: Colors.black45, size: 35,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black45,
              size: 30,
            ),
            onPressed: () {
              print("chinese_singer");
            }
          ),
        ],
        /*title:
          const Align(
            alignment: Alignment(-1.1, 0),
            child: Text(
              'Lucas',
              style: TextStyle(color: Colors.black45, fontSize: 15)
            ),
          ),*/
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
          
      ),
    );
  }
}
