import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travlon/pages/homoeScreen.dart';
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
    Timer(Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>location()

                )
            )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: txtOftravalon(
            data: "TravelOn",textStyle: Constants().boldstylegreen(24),
          ),
        ),
      ),
    );
  }
}
