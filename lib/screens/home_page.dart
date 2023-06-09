import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:howaiu/screens/chat.dart';
import 'package:table_calendar/table_calendar.dart';

import 'diary.dart';

class TableCalendarExample extends StatefulWidget {
  @override
  _TableCalendarExampleState createState() => _TableCalendarExampleState();
}

class _TableCalendarExampleState extends State<TableCalendarExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xffdadada);

    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                  Text(
                    'howaiu',
                    style: TextStyle(fontSize: 35),
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 8,
                      intensity: 0.7,
                      lightSource: LightSource.topLeft,
                      color: Colors.grey[300],
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(Icons.person_2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 350,
                height: 400,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    depth: 5,
                    shape: NeumorphicShape.convex,
                    lightSource: LightSource.topLeft,
                    intensity: 0.7,
                    color: baseColor,
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 01, 01),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiaryPage(),
                        ),
                      );
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicButton(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 8,
                      intensity: 0.7,
                      lightSource: LightSource.topLeft,
                      color: Colors.grey[300],
                    ),
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      child: Icon(Icons.person_2),
                    ),
                  ),
                  NeumorphicButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatAiu()),
                      );
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 8,
                      intensity: 0.7,
                      lightSource: LightSource.topLeft,
                      color: Colors.grey[300],
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text('AiU'),
                    ),
                  ),
                  NeumorphicButton(
                    style: NeumorphicStyle(
                      color: baseColor,
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 5,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: Icon(Icons.settings),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
