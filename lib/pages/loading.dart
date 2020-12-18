import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String todo;

  void getData() async {
    try {
      Response response =
          await get('https://jsonplaceholder.typicode.com/taodos/1');
      Map data = jsonDecode(response.body);
      print(data);
      print(data['title']);
      String result = data['title'] + ' hello';
      todo = result;
      print(todo);
    } catch (e) {
      print('caught error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Loading'),
      ),
    );
  }
}
