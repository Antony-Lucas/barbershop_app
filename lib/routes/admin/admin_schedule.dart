import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:barbershop_app/widgets/colorPallete.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 36, 42, 1),
        elevation: 0,
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Text("Agenda"),
          )
        ],
      ),
      body: const Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final nameController = TextEditingController();
  final tellController = TextEditingController();

  late Map<DateTime, List<MyEvents>> mySelectedEvents;

  @override
  void initState() {
    _selectedDay = _focusedDay;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    tellController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDay(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  _showAddEvents() async{
    await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
          title: const Text("Novo agendamento"),
          content: Column(
            children: [
              buildTextFile(controller: nameController, hint: "Nome do cliente"),
              buildTextFile(controller: tellController, hint: "Contato"),
              const SizedBox(height: 20.0),
            ]
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: (){
                if(nameController.text.isEmpty && 
                  tellController.text.isEmpty)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Por favor, preencha os campos obrigatórios"),
                      duration: Duration(seconds: 3),
                    )
                  );return;
                }else{
                  setState(() {
                    if(mySelectedEvents[_selectedDay] != null){
                      mySelectedEvents[_selectedDay]?.add(MyEvents(
                          eventName: nameController.text,
                          eventTell: tellController.text,
                        )
                      );
                    }else{
                      mySelectedEvents[_selectedDay!] = [
                        MyEvents(
                          eventName: nameController.text, 
                          eventTell: tellController.text,
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
              child: const Text("Novo agendamento")
            )
          ],
        )
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddEvents(),
          label: const Text('Adicionar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar(
                locale: 'pt_BR',
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(1950, 01, 01),
                lastDay: DateTime.utc(2050, 01, 01),
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    headerPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    titleTextStyle:
                      TextStyle(color: Colors.black45, fontSize: 20)
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: AppColors.ultraRed)
                    ),
                    calendarStyle: const CalendarStyle(
                    markerDecoration: BoxDecoration(
                    color: AppColors.ultraRed,
                    shape: BoxShape.circle,
                    )
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
              ..._listOfDay(_selectedDay!).map((myEvents) => ListTile(
                    leading: const Icon(
                      Icons.done,
                      color: AppColors.eggPlant,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('Nome: ${myEvents.eventName}'),
                    ),
                    subtitle: Text('Telefone: ${myEvents.eventTell}'),
                  )
                ),
            ],
          ),
        ));
  }
}

Widget buildTextFile(
    {String? hint, required TextEditingController controller}) {
  return TextField(
    controller: controller,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
      labelText: hint ?? '',
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

class MyEvents {
  final String eventName;
  final String eventTell;

  MyEvents({required this.eventName, required this.eventTell});

  @override
  String toString() => eventTell;
}
