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
      body: Obx(() => Container(
            color: clock.currentsec.isEven ? Colors.blueGrey : Colors.black54,
            width: MediaQuery.of(context).size.width,
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
          )),
    );
  }
}
