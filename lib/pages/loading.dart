import 'package:flutter/material.dart';

import 'package:Time/services/timeZone.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String todo;
  String time;

  void getTime() async {
    TimeZone ktm = TimeZone(location: 'Kathmandu, Nepal', offset: '+05:45');
    await ktm.getTime();

    Navigator.pushNamed(
      context,
      '/home',
      arguments: {
        'location': 'Kathmandu, Nepal',
        'time': ktm.time,
        'isDay': ktm.isDay,
        'flag': 'nepal.png'
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1488C8),
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
