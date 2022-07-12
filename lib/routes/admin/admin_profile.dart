import 'package:barbershop_app/widgets/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/api_keys/api_services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black45),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Profile_page", textAlign: TextAlign.center,),
          IconButton(
            onPressed: () async{
              bool log = await ApiLogout().logout();

              if(log){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const Wellcome()) 
                );
              }
            }, 
            icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
