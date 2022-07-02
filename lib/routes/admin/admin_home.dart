import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barbershop_app/routes/admin/admin_schedule.dart';
import 'package:barbershop_app/routes/admin/profile_admin.dart';
import 'package:barbershop_app/routes/admin/new_schedule.dart';

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
            Icons.person,
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
                padding: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                child: const Text(
                  "Atividade",
                  style: TextStyle(
                      color: Color.fromARGB(222, 222, 222, 222),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
        const Resume(),
        const CircularMenu(),
        const AddAction(),
        const Calendar(),
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
                        r"R$ 150,00",
                        style: TextStyle(
                            color: Color(0xDEDEDEDE),
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      child: const Text(
                    "5",
                    style: TextStyle(
                        color: Color(0xDEDEDEDE),
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
                        color: Color(0xDEDEDEDE),
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
                        MaterialPageRoute(
                            builder: (context) => const Schedule()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewEvent()));
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
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: Column(
                children: const <Widget>[
                  WeekDays(),
                ],
              )),
        ],
      ),
    );
  }
}

class WeekDays extends StatefulWidget {
  const WeekDays({Key? key}) : super(key: key);

  @override
  State<WeekDays> createState() => _WeekDaysState();
}

class _WeekDaysState extends State<WeekDays> {
  Map<DateTime, List> _eventList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            locale: 'pt_BR',
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 01, 01),
            lastDay: DateTime.utc(2030, 01, 01),
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableCalendarFormats: const {
              CalendarFormat.week: 'Week',
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
            ),
            headerVisible: false,
            calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Color(0xFFD4BA53),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(color: Colors.black),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFFDEC978),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.black)),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          )
        ],
      ),
    );
  }
}
