import 'package:flutter/material.dart';

import 'package:Time/pages/home.dart';
import 'package:Time/pages/loading.dart';
import 'package:Time/pages/chooseLocation.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => HomePage(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
