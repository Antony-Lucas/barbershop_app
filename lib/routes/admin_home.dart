import 'package:barbershop_app/widgets/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/api_keys/user_model.dart';
import 'package:barbershop_app/api_keys/api_services.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
  late List<Welcome>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_outlined, color: Colors.black45,),
        leadingWidth: 60,
        title: const Text('Olá Lucas', 
          style: TextStyle(color: Colors.black45, fontSize: 12)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'home page',
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () async{
                bool log = await ApiLogout().logout(); 

                if(log){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Wellcome()));
                }
              },
              child: const Text('Sair'),
            )
          ]),
    );
  }
}
