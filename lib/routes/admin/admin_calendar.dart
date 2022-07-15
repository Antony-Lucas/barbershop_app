import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:barbershop_app/widgets/default_textfield.dart';
import 'package:barbershop_app/widgets/colorPallete.dart';

class Showcalendar extends StatefulWidget {
  const Showcalendar({Key? key}) : super(key: key);

  @override
  State<Showcalendar> createState() => _ShowcalendarState();
}

class _ShowcalendarState extends State<Showcalendar> {
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
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  final nameController = TextEditingController();
  final tellController = TextEditingController();

  late Map<DateTime, List<ClientEvents>> mySelectedEvents;

  @override
  void initState() {
    _selectedDay = _focusedDay = _focusedDay;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    tellController.dispose();
    super.dispose();
  }

  List<ClientEvents> _listOfDay(DateTime datetime) {
    return mySelectedEvents[datetime] ?? [];
  }

  _showAddEvents() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Novo agendamento"),
              content: Column(children: [
                buildTextField(
                    controller: nameController, hint: "Nome do cliente"),
                buildTextField(controller: tellController, hint: "Contato"),
                const SizedBox(height: 20.0),
              ]),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                TextButton(
                    onPressed: () {
                      if (nameController.text.isEmpty &&
                          tellController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Por favor, preencha os campos obrigatórios"),
                          duration: Duration(seconds: 3),
                        ));
                        return;
                      } else {
                        setState(() {
                          if (mySelectedEvents[_selectedDay] != null) {
                            mySelectedEvents[_selectedDay]?.add(ClientEvents(
                              clientName: nameController.text,
                              clientTell: tellController.text,
                            ));
                          } else {
                            mySelectedEvents[_selectedDay!] = [
                              ClientEvents(
                                clientName: nameController.text,
                                clientTell: tellController.text,
                              )
                            ];
                          }
                        });

                        nameController.clear();
                        tellController.clear();

                        Navigator.pop(context);
                        return;
                      }
                    },
                    child: const Text("Novo agendamento"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt');
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                onPressed: () => _showAddEvents(),
                child: const Text("Novo agendamento"),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TableCalendar(
                    locale: 'pt_BR',
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(2000, 01, 01),
                    lastDay: DateTime.utc(2050, 01, 01),
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
                      headerPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                    ),
                    headerVisible: false,
                    calendarStyle: const CalendarStyle(
                      defaultTextStyle: TextStyle(color: Colors.black38),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFFD4BA53),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(color: Colors.black),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFFDEC978),
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: TextStyle(color: Colors.black),
                    ),
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
                    eventLoader: _listOfDay,
                  ),
                  ..._listOfDay(_selectedDay!).map((clientEvents) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text("Nome: ${clientEvents.clientName}"),
                        ),
                        subtitle: Text("Contato: ${clientEvents.clientTell}"),
                      ))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ClientEvents {
  final String clientName;
  final String clientTell;

  ClientEvents({required this.clientName, required this.clientTell});

  @override
  String toString() => clientTell;
}
