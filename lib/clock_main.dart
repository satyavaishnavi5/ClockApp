import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'clockController.dart';

class ClockMain extends StatefulWidget {
  @override
  State<ClockMain> createState() => _ClockMainState();
}

class _ClockMainState extends State<ClockMain> {
  final clock = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
        child: Container(
              // color: clock.currentsec.isEven ? Colors.blueGrey : Colors.black54,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)), //here
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).primaryColor,
                    offset: Offset(0, -5),
                    blurRadius: 10.0)
              ]),
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                    '${clock.systemhour}:${clock.systemmin}:${clock.systemsec}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
      )),
    );
  }
}
