import 'dart:collection';
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
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List> _eventList = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _eventList = {
      DateTime.now().subtract(const Duration(days: 2)): ['Isac daocu', 'Event B1'],
      DateTime.now(): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
      DateTime.now().add(const Duration(days: 1)):[
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2',
      ],
      DateTime.now().add(const Duration(days: 3)) : (['Event A4', 'Event A5', 'Event B4',]).toList(),
      DateTime.now().add(const Duration(days: 7)):[
        'Event A6',
        'Event B5',
        'Event C3',
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventList);

    List getEventForDay(DateTime day){
      return _events[day] ?? [];
    }

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
                titleTextStyle: TextStyle(color: Colors.black45, fontSize: 20)),

            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },

            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              getEventForDay(selectedDay);
            },

            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },

            eventLoader: getEventForDay,
          ),
          ListView(
            shrinkWrap: true,
            children: getEventForDay(_selectedDay!).map(
            (e) => ListTile(
              title: Text(e.toString()),
            )).toList(),
          )
        ],
      ),
    );
  }
}
