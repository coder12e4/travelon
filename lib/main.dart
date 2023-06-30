import 'package:flutter/material.dart';
import 'package:travlon/pages/Introlog.dart';

import 'package:travlon/pages/auth/location.dart';
import 'package:travlon/pages/auth/loginPage.dart';
import 'package:travlon/pages/auth/registration.dart';
import 'package:travlon/pages/auth/splashScreen.dart';
import 'package:travlon/pages/forgotpassword.dart';
import 'package:travlon/pages/homeTabs/AddTravelog.dart';
import 'package:travlon/pages/homeTabs/addPlaces.dart';
import 'package:travlon/pages/homeTabs/nearbyPlaces.dart';
import 'package:travlon/pages/homeTabs/tabView.dart';

import 'package:travlon/pages/introductionpage.dart';
import 'package:travlon/pages/homeTabs/bottom%20sheet.dart';

import 'package:travlon/pages/homeTabs/nearestplaceList.dart';
import 'package:travlon/pages/homeTabs/placeView.dart';
import 'package:travlon/pages/homeTabs/profileView.dart';
import 'package:travlon/pages/homeTabs/travaleogView.dart';
import 'package:travlon/pages/otpVerification.dart';
import 'package:travlon/pages/profilepage.dart';
import '../models/nearbyModel.dart';
import 'package:travlon/pages/homeScreen.dart';
import 'package:travlon/pages/intro.dart';
import 'package:travlon/repository/nearbyrepo.dart';


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

        home:/* /const Introductionpage()*/IntroScreen()

    );
  }

}