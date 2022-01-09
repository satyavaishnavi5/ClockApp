import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  AudioPlayer audioPlayer = AudioPlayer();
  static const tone = 'assets/audio/sec.mpeg';
  bool Alarmset = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
        Alarmset = true;
        // Timer.periodic(Duration(seconds: 1), (timer) {
        //   return AlarmSound();
        // });
      });
  }
  AlarmSound() async {
    if(Alarmset == true) {
      if (selectedTime == TimeOfDay.now())
        int result = await audioPlayer.play(tone, isLocal: true);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Alarm'),
          if(selectedTime != TimeOfDay.now())
          Text('Your Alarm is Set by ${selectedTime.hour }:${selectedTime.minute}'),
        ],
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectTime(context);
    },
    backgroundColor: Colors.green,
    child: const Icon(Icons.alarm_add),
    ),
    );
  }
}
