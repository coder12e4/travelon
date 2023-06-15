import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/pages/homeTabs/profileView.dart';

import 'package:travlon/utils/constants/constantsOfTravlne.dart';

import '../../pages/homeTabs/placeView.dart';

class bottombar extends StatelessWidget {
  const bottombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: Icon(
              Icons.home_outlined,
              color: HexColor(Constants().pastelgreen300),
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: Icon(
              Icons.my_location,
              color: HexColor(Constants().pastelgreen300),
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: Icon(
              Icons.widgets_outlined,
              color: HexColor(Constants().pastelgreen300),
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: HexColor(Constants().pastelgreen300),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class bottombarnotch extends StatelessWidget {
  const bottombarnotch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      elevation: 0,
      child:  Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: Icon(
                Icons.home_outlined,
                color: HexColor(Constants().pastelgreen300),
                size: 20,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Constants().loadPages(placeView(), context);
              },
              icon: Icon(
                Icons.my_location,
                color: HexColor(Constants().pastelgreen300),
                size: 20,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: Icon(
                Icons.widgets_outlined,
                color: HexColor(Constants().pastelgreen300),
                size: 20,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: Icon(
                Icons.person_outline,
                color: HexColor(Constants().pastelgreen300),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
