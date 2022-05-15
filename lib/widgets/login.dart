import 'package:flutter/material.dart';
import 'package:barbershop_app/routes/admin_home.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              autofocus: false,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 17,
              ),
              decoration: InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(color: Colors.black45, fontSize: 17)),
            ),

            const TextField(
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 17,
              ),
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black45, fontSize: 17)),
            ),

            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 95, 153, 107),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminHome()),
                );
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
