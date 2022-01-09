import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clock_main.dart';
import 'navigationbar.dart';

void main(){runApp(clockApp());}

class clockApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigationbar(),
    );
  }
}

