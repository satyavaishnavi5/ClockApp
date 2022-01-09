import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  var systemsec = DateTime.now().second.obs;
  var systemmin = DateTime.now().minute.obs;
  var systemhour = DateTime.now().hour.obs;
  var currentsec = 0.obs;
  var currentmin = 0.obs;
  var currenthour = 0.obs;
  static const tone = 'assets/audio/sec.mpeg';
bool pausetimer = false;
  timerIncrement() async{
    // int result = await audioPlayer.play(tone, isLocal: true);
    systemsec.value = DateTime.now().second;
    systemmin.value = DateTime.now().minute;
    systemhour.value = DateTime.now().hour;
   if(pausetimer == false)
    if (currentsec == 60 && currentmin == 59) {
      // this will execute when min will reach 60.
      currenthour.value += 1;
      currentsec.value = 0;
      currentmin.value = 0;
    } else {
      if (currentsec == 60) {
        currentsec.value = 0;
        currentmin.value += 1;
      } else {
        // int result = await audioPlayer.play(tone, isLocal: true);
        currentsec.value += 1;
      }
    }
  }
  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      return timerIncrement();
    });
    super.onInit();
  }
}
