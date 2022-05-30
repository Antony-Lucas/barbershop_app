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
  void initState(){
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
        title: const Text('Rota teste'),
      ),
      body: _userModel == null || _userModel!.isEmpty
      ? const Center(
          child: CircularProgressIndicator(),
      ): ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (BuildContext context, int index) {  
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].id.toString()),
                    Text(_userModel![index].username.toString()),
                  ],
                ),

                const SizedBox(
                  height: 20.0,
                ),
              ],
            )
          );
        }
      )
    );
  }
}
