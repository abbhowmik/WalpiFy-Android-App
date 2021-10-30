// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:walpify/views/home.dart';
import 'package:walpify/widget/widget.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1500,
        splash: 'assets/image/splash_logo.png',
        nextScreen: Home(),
        backgroundColor: Color.fromRGBO(235, 234, 235, 2),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
