import 'package:barbershop_app/main.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          icon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.black45,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
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
              onPressed: () {}),
        ],
        title: const Align(
          alignment: Alignment(-1.1, 0),
          child: Text('Cap Vip',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const BodyDash(),
    );
  }
}

class BodyDash extends StatefulWidget {
  const BodyDash({Key? key}) : super(key: key);

  @override
  State<BodyDash> createState() => _BodyDashState();
}

class _BodyDashState extends State<BodyDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: const Text(
                "Atividade",
                style: TextStyle(color: Colors.black45),
              )
            )
          ],
        ),
        const Resume(),
        ]
      ),
    );
  }
}

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          width: 170,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF1778F2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Text("Hoje",
                    style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: const Text(
                        r"R$ 0",
                        style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    child: const Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                      )
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          width: 170,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(color: Colors.black26, spreadRadius: 1),
            ],
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Text("Esta semana",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: const Text(
                        r"R$ 0",
                        style: TextStyle(
                            color: Colors.black45, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      child: const Text(
                    "0",
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
