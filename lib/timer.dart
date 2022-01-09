import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clockController.dart';

class Timer extends StatefulWidget {
  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final clock = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Container(
        color: clock.currentsec.isEven ? Colors.green : Colors.red,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Text(
            //   '${clock.systemhour}:${clock.systemmin}:${clock.systemsec}',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            // ),
            Text(
              '${clock.currenthour}:${clock.currentmin}:${clock.currentsec}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            TextButton(
                onPressed: () {
                  clock.pausetimer = !clock.pausetimer;
                  setState(() {});
                },
                child: Text(
                  clock.pausetimer == true ? 'Play' : 'Pause',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 70,color: Colors.black26),
                ))
          ],
        ),
      )),
    );
  }
}

