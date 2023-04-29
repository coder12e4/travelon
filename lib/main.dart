import 'package:flutter/material.dart';
import 'package:travlon/pages/duo1.dart';

import 'package:travlon/pages/homoeScreen.dart';
import 'package:travlon/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  homeScreen(),

    );
  }
}

