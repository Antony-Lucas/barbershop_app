import 'package:flutter/material.dart';
import 'package:barbershop_app/widgets/wellcome.dart';
import 'dart:math';

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
      home: const Wellcome(),
      darkTheme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}