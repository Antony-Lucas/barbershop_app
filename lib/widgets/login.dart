import 'package:barbershop_app/api_keys/api_services.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/routes/admin/admin_home.dart';

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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(18, 18, 18, 1),
      body: Form(
        key: _formkey,
        child: Center(
          child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 250),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      style: const TextStyle(color: Color.fromARGB(200, 200, 200, 200)),
                      decoration: const InputDecoration(
                        hintText: 'Usuário',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(153, 153, 153, 153),
                        ),
                        fillColor: Color.fromARGB(17, 0, 0, 0),
                        filled: true,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Color.fromARGB(153, 153, 153, 153)),
                        ),
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
                  ),
                  TextFormField(
                    style: const TextStyle(color: Color.fromARGB(200, 200, 200, 200)),
                    decoration: const InputDecoration(
                      hintText: 'senha',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color:Color.fromARGB(153, 153, 153, 153),
                      ),
                      fillColor: Color.fromARGB(17, 0, 0, 0),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Color.fromARGB(153, 153, 153, 153)),
                      ),
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
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          print(isLoading);
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (_formkey.currentState!.validate()) {
                            Future.delayed(const Duration(seconds: 0), () {
                              setState(() {
                                isLoading = true;
                              });
                            });
                            bool logintrue = await ApiLogin()
                                .autoLogin(myLogin.text, myPass.text);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }

                            if (logintrue) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AdminHome()));
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              myPass.clear();
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }
                        },
                        child: isLoading
                            ? const Center(
                                heightFactor: 1,
                                widthFactor: 1,
                                child: SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                      color: Colors.white, strokeWidth: 2.0),
                                ),
                              )
                            : const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          primary:const Color(0xFFD4BA53),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ))
                ]),
          ),
        )),
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
}
