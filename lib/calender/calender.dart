/*
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<dynamic>> _events = {
    DateTime(2022, 7, 6): ['Event 1'],
    DateTime(2022, 7, 8): ['Event 2'],
    DateTime(2022, 7, 12): ['Event 3'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month - 1,
                        _focusedDay.day,
                      );
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                Text(
                  DateFormat.yMMMM().format(_focusedDay),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2010),
                  lastDay: DateTime(2030),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, date, events) {
                      if (_events.containsKey(date)) {
                        return const Positioned(
                          bottom: 0,
                          child: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 6,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            // Add your custom content here
            // Example: ListView.builder, GridView, etc.
          ),
        ],
      ),
    );
  }
}

*/
//imporved calander

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<dynamic>> _events = {
    DateTime(2022, 7, 6): ['Event 1'],
    DateTime(2022, 7, 8): ['Event 2'],
    DateTime(2022, 7, 12): ['Event 3'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context); // Added a back button action
                  },
                  child: const Icon(
                    CupertinoIcons.back, // Replaced with back icon
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                Text(
                  'Calendar', // Replaced with a text "Calendar"
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2010),
                  lastDay: DateTime(2030),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, date, events) {
                      if (_events.containsKey(date)) {
                        return const Positioned(
                          bottom: 0,
                          child: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 6,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            // Add your custom content here
            // Example: ListView.builder, GridView, etc.
          ),
        ],
      ),
    );
  }
}
