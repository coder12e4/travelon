

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:travlon/pages/addOns.dart';
import 'package:travlon/pages/duo3.dart';
import 'package:travlon/pages/duo4.dart';
import 'package:travlon/pages/splashscreen.dart';

import 'package:travlon/pages/auth/location.dart';
import 'package:travlon/pages/auth/loginPage.dart';
import 'package:travlon/pages/auth/registration.dart';
import 'package:travlon/pages/auth/splashScreen.dart';

import 'package:travlon/pages/duo1.dart';
import 'package:travlon/pages/homeTabs/bottom%20sheet.dart';

import 'package:travlon/pages/homeTabs/nearestplaceList.dart';
import 'package:travlon/pages/homeTabs/placeView.dart';
import 'package:travlon/pages/homeTabs/profileView.dart';
import 'package:travlon/pages/homeTabs/travaleogView.dart';

import 'package:travlon/pages/homeScreen.dart';
import 'package:travlon/pages/intro.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Helper(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: iconreturn(next: Icons.location_on_outlined,),
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


      home: /*const Introductionpage()*/login(),

    );
  }
}

