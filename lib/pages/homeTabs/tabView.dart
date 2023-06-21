
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/pages/homeScreen.dart';

import 'package:travlon/pages/homeTabs/AddTravelog.dart';
import 'package:travlon/pages/homeTabs/addPlaces.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';


class tabView extends StatefulWidget {
  const tabView({Key? key}) : super(key: key);

  @override
  State<tabView> createState() => _tabViewState();
}

class _tabViewState extends State<tabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor:HexColor(
              Constants().pastelgreen300),
          leading:  IconButton(onPressed: (){
            Constants().loadPages(homeScreen(), context);
          }, icon:Icon(Icons.arrow_back,color: Colors.white,)),

          bottom: TabBar(
            labelStyle: TextStyle(fontFamily: "Medium",fontSize: 16),
              tabs: [
         Tab(text: "Add new places",),
            Tab(text: "Add new travelogs",)
          ]),


        ),


        body: TabBarView(
          children: [
            addplaces(),
            addTravelog()
          ],
        ),
        
      ),
    );
  }
}
