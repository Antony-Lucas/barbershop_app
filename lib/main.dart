import 'package:flutter/material.dart';
import 'package:barbershop_app/widgets/login.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login page',
      debugShowCheckedModeBanner: false,
      home: const Content(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
