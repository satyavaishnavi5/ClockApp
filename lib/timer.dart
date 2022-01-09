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
            // color: clock.currentsec.isEven ? Colors.green : Colors.red,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   '${clock.systemhour}:${clock.systemmin}:${clock.systemsec}',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                // ),
                Container(
                  width: MediaQuery.of(context).size.width/3.5,
                  height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)), //here
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).primaryColor,
                            offset: Offset(0, -5),
                            blurRadius: 10.0)
                      ]),
                  child: Center(
                    child: Text(
                      '${clock.currenthour}:${clock.currentmin}:${clock.currentsec}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                    onPressed: () {
                      clock.pausetimer = !clock.pausetimer;
                      clock.playtimer = true;
                      clock.reset = false;
                      setState(() {});
                    },
                    child: Text(
                      clock.pausetimer == true ? 'Play' : 'Pause',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 70,
                          color: Colors.black26),
                    )),
                SizedBox(height:20),
                TextButton(
                    onPressed: () {
                      clock.reset = true;
                      setState(() {});
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:50,
                          color: Colors.black26),
                    ))
              ],
            ),
          )),
    );
  }
}
