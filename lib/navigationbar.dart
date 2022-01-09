import 'package:clock_app/alarm.dart';
import 'package:clock_app/stopwatch.dart';
import 'package:clock_app/timer.dart';
import 'package:flutter/material.dart';

import 'clock_main.dart';

class Navigationbar extends StatefulWidget {

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    ClockMain(),
    Timer(),
    Alarm(),
    Stop_watch(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock App', style: TextStyle(fontFamily: 'Roboto', fontStyle: FontStyle.italic),),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Stop Watch',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
