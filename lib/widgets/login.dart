import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:barbershop_app/routes/admin_home.dart';
import 'package:barbershop_app/api_keys/api_services.dart';
import 'package:barbershop_app/api_keys/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barbershop_app/api_keys/api_constants.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final myLogin = TextEditingController();
  final myPass = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    myLogin.dispose();
    super.dispose();

    myPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Usuário',
                    ),
                    controller: myLogin,
                    keyboardType: TextInputType.text,
                    validator: (user) {
                      if (user == null || user.isEmpty) {
                        return 'Por favor, informe o seu nome de usuário corretamente.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    controller: myPass,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: (pass) {
                      if (pass == null || pass.isEmpty) {
                        return 'Senha incorreta';
                      } else if (pass.length < 5) {
                        return 'A senha deve possuir pelo menos 5 caracteres';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_formkey.currentState!.validate()) {
                        bool logintrue = await login();
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        if (logintrue) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminHome()));
                        } else {
                          myPass.clear();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    child: const Text('Login'),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }

  final snackBar = const SnackBar(
    content: Text(
      'usuário ou senha incorretos',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );

  Future<bool> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var Url = Uri.parse(ApiConstants.urlBase + ApiConstants.urlLogin);
    var response = await http.post(
      Url,
      body: {
        'username': myLogin.text,
        'password': myPass.text,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      await prefs.setString('access_token', "${jsonDecode(response.body)['access_token']}");
      print(jsonDecode(response.body)['access_token']);
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }
}
