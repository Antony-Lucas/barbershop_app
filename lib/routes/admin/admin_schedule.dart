import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

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
  Map<DateTime, List> _eventList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
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
            availableCalendarFormats: const{
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
           
              headerPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              titleTextStyle: TextStyle(color: Colors.black45, fontSize: 20)
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
          )
        ],
      ),
    );
  }
}
