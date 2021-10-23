// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:walpify/views/home.dart';
import 'package:walpify/widget/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), GotoHomePage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 234, 235, 2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(120),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/splash_logo.png'),
            )),
          ),
        ),
      ),
    );
  }

  void GotoHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}
