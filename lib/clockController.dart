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
  //Intial states of text buttons
bool pausetimer = false;
bool playtimer = false;
bool reset = false;
timerIncrement() async{
    // int result = await audioPlayer.play(tone, isLocal: true);
    systemsec.value = DateTime.now().second;
    systemmin.value = DateTime.now().minute;
    systemhour.value = DateTime.now().hour;
    if(reset == true){
      playtimer = false;
      currentsec.value = 0;
      currentmin.value = 0;
      currenthour.value = 0;

    }

    // Functionality of Play and Pause button.(When clicked on Pause, timer stops)
   if(pausetimer == false)
     // when min reaches 59, hour is updated as 1 for next second.
    if (currentsec == 60 && currentmin == 59) {
      // this will execute when min will reach 60.
      currenthour.value += 1;
      currentsec.value = 0;
      currentmin.value = 0;
    }
   // this ' else' is for min and sec
     else {
      //when sec reach 60, min is updated as 1.
      if (currentsec == 60) {
        currentsec.value = 0;
        currentmin.value += 1;
      }
      // this ' else' is for sec only.
      else {
              // int result = await audioPlayer.play(tone, isLocal: true);
              // currentsec.value += 1;
        // Initial timer to be 0
        if(playtimer == true)
          {
            currentsec.value += 1;
          }
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
