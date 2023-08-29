import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/pages/homeScreen.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';

import '../../utils/widgets/txtOftravalon.dart';
import 'location.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => location())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: RichText(
                text: TextSpan(
                    text: "travel",
                    style:TextStyle (
                        fontSize: 24,
                        fontFamily: "bold",
                        color: HexColor(Constants().pastelgreen400)),
                children: [
                  TextSpan(
                    text: "On",
                    style: TextStyle (
                        fontSize: 24,
                        fontFamily: "bold",
                        color: Colors.black),
                  )
                ]
                ))),
      ),
    );
  }
}
