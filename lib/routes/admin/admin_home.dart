import 'package:flutter/material.dart';
import 'package:barbershop_app/routes/admin/admin_schedule.dart';
import 'package:barbershop_app/routes/admin/profile_admin.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            color: Color.fromARGB(222, 222, 222, 222),
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
                color: Color.fromARGB(222, 222, 222, 222),
                size: 30,
              ),
              onPressed: () {}),
        ],
        title: const Align(
          alignment: Alignment(-1.1, 0),
          child: Text('Cap Vip',
              style: TextStyle(
                color: Color.fromARGB(222, 222, 222, 222),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        backgroundColor: const Color(0xFF121212),
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
      backgroundColor: const Color(0xFF121212),
      body: Column(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: const Text(
                  "Atividade",
                  style: TextStyle(color: Color.fromARGB(153, 153, 153, 153)),
                ))
          ],
        ),
        const Resume(),
        const CircularMenu(),
        const AddAction(),
        const Calendar(),
        //const WeekDays(),
      ]),
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
            color: const Color.fromRGBO(35, 36, 42, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Text("Hoje",
                      style: TextStyle(
                          color: Color(0xDEDEDEDE),
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: const Text(
                        r"R$ 150",
                        style: TextStyle(
                            color: Color(0xDEDEDEDE),
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      child: const Text(
                    "5",
                    style: TextStyle(
                        color: Color(0xFFD4BA53),
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ))
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
            color: const Color.fromRGBO(35, 36, 42, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Text("Esta semana",
                      style: TextStyle(
                          color: Color(0xDEDEDEDE),
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: const Text(
                        r"R$ 1250,00",
                        style: TextStyle(
                            color: Color.fromARGB(222, 222, 222, 222),
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      child: const Text(
                    "32",
                    style: TextStyle(
                        color: Color(0xFFD4BA53),
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

class CircularMenu extends StatefulWidget {
  const CircularMenu({Key? key}) : super(key: key);

  @override
  State<CircularMenu> createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: IconButton(
                  icon: const Icon(Icons.calendar_month,
                      color: Color.fromARGB(222, 222, 222, 222)),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Schedule()));
                  },
                ),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(35, 36, 42, 1),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Agenda",
                    style: TextStyle(color: Color.fromARGB(222, 222, 222, 222)),
                  ))
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12),
                width: 60,
                height: 60,
                child: IconButton(
                  icon: const Icon(Icons.payments_outlined,
                      color: Color.fromARGB(222, 222, 222, 222)),
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(35, 36, 42, 1),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    "Receita",
                    style: TextStyle(color: Color.fromARGB(222, 222, 222, 222)),
                  ))
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12),
                width: 60,
                height: 60,
                child: IconButton(
                  icon: const Icon(Icons.groups_outlined,
                      color: Color.fromARGB(222, 222, 222, 222)),
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(35, 36, 42, 1),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    "Equipe",
                    style: TextStyle(color: Color.fromARGB(222, 222, 222, 222)),
                  ))
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12),
                width: 60,
                height: 60,
                child: IconButton(
                  icon: const Icon(Icons.cut,
                      color: Color.fromARGB(222, 222, 222, 222)),
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(35, 36, 42, 1),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    "Serviços",
                    style: TextStyle(color: Color.fromARGB(222, 222, 222, 222)),
                  ))
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12),
                width: 60,
                height: 60,
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Color.fromARGB(222, 222, 222, 222),
                  ),
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(35, 36, 42, 1),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    "Produtos",
                    style: TextStyle(color: Color.fromARGB(222, 222, 222, 222)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class AddAction extends StatefulWidget {
  const AddAction({Key? key}) : super(key: key);

  @override
  State<AddAction> createState() => _AddActionState();
}

class _AddActionState extends State<AddAction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              primary: const Color(0xFFD4BA53),
              padding:
                  const EdgeInsets.symmetric(horizontal: 105, vertical: 15),
            ),
            onPressed: () {
              print("kkkkkkkkkk");
            },
            child: Row(
              children: const <Widget>[
                Icon(
                  Icons.add,
                ),
                Text("Novo Agendamento")
              ],
            ))
      ],
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Agendamentos",
            style: TextStyle(color: Colors.black45),
          ),
          Row(
            children: const <Widget>[],
          )
        ],
      ),
    );
  }
}

/*class WeekDays extends StatefulWidget {
  const WeekDays({Key? key}) : super(key: key);

  @override
  State<WeekDays> createState() => _WeekDaysState();
}

class _WeekDaysState extends State<WeekDays> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TableCalendar(
          focusedDay: DateTime.now(), 
          firstDay: DateTime.utc(2010, 01, 10), 
          lastDay: DateTime.utc(2030, 01, 01),
        )
      ],
    );
  }
}*/
