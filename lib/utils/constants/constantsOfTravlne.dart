import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/txtOftravalon.dart';

class Constants {
  String txtAppname = "TRAVELON";
  String txtIntroductionNear = "get Nearby Locations";
  String txtIntroductionChoose = "Choose a Location";
  String txtQuatationText = "Where to next";

  String pastelgreen50 = "#f0fdf0";
  String pastelgreen100 = "#dcfcde";
  String pastelgreen200 = "#bbf7be";
  String pastelgreen300 = '#74ec7c';
  String pastelgreen400 = "#4bdd55";
  String pastelgreen500 = "#23c42e";

  String pastelgreen600 = "#17a221";
  String pastelgreen700 = "#15801d";
  String pastelgreen800 = "#16651d";
  String pastelgreen900 = "#14531a";
  String pastelgreen950 = "#052e0a";

  boldstylegreen(double size) {
    return TextStyle(
        fontFamily: "bold", fontSize: size, color: HexColor(pastelgreen500));
  }
  boldstylegreenmon(double size) {
    return TextStyle(
        fontFamily: "Bold", fontSize: size, color: HexColor(pastelgreen500));
  }

  boldstyleblack(double size) {
    return TextStyle(fontFamily: "bold", fontSize: size, color: Colors.black);
  }
  boldstyleblackmon(double size) {
    return TextStyle(fontFamily: "Bold", fontSize: size, color: Colors.black);
  }

  boldstylewhite(double size) {
    return TextStyle(fontFamily: "bold", fontSize: size, color: Colors.white);
  }
  boldstyleblue(double size) {
    return TextStyle(fontFamily: "bold", fontSize: size, color: Colors.blue);
  }

  Stylemediuemgreen(double size) {
    return TextStyle(
      fontFamily: "Medium",
      color: HexColor(pastelgreen400),
      fontSize: size,
    );
  }
    StyleMediumBlack(double size) {
      return TextStyle(
        fontFamily: "semibold",
        color: Colors.black,
        fontSize: size,
      );
    
  }
  StyleMediumBlue(double size) {
    return TextStyle(
      fontFamily: "semibold",
      color: Colors.blue,
      fontSize: size,
    );

  }

  mediumstyleblack(double size) {
    return TextStyle(
      fontFamily: "semibold",
      color: Colors.black,
      fontSize: size,
    );
  }
  mediumstyleblackmon(double size) {
    return TextStyle(
      fontFamily: "Medium",
      color: Colors.black,
      fontSize: size,
    );
  }
  mediumstylewhitemon(double size) {
    return TextStyle(
      fontFamily: "Medium",
      color: Colors.white,
      fontSize: size,
    );
  }


  mediumstylewhite(double size) {
    return TextStyle(
      fontFamily: "semibold",
      color: Colors.white,
      fontSize: size,
    );
  }

  Regularstyle1(double size) {
    return TextStyle(
        fontFamily: "regular", fontSize: size, color: HexColor(pastelgreen800));
  }

  Regularstyleblack(double size) {
    return TextStyle(
        fontFamily: "regular", fontSize: size, color: Colors.black);
  }
  RegularstyleblackMon(double size) {
    return TextStyle(
        fontFamily: "Regular", fontSize: size, color: Colors.black,);
  }
  RegularstylegreenMon(double size) {
    return TextStyle(
        fontFamily: "Regular", fontSize: size, color:HexColor(pastelgreen300) );
  }

  Regularstylegrey(double size) {
    return TextStyle(
        fontFamily: "Regular", fontSize: size, color: Colors.grey);
  }

  Regularstylewhite(double size) {
    return TextStyle(
        fontFamily: "Regular", fontSize: size, color: Colors.white);
  }

  lightstyle1(double size) {
    return TextStyle(
        fontFamily: "light", fontSize: size, color: HexColor(pastelgreen900));
  }
  lightstylewhite(double size) {
    return TextStyle(
        fontFamily: "light", fontSize: size, color: Colors.white);
  }
  lightstylegrey(double size) {
    return TextStyle(
        fontFamily: "light", fontSize: size, color: Colors.grey);
  }

  radiusreturning() {
    return BorderRadius.circular(20);
  }
  radiusreturningthree() {
    return BorderRadius.circular(14);
  }
  radiusreturningone() {
    return BorderRadius.circular(30);
  }
  radiusreturningtwo(
      BorderRadius borderRadius,
      Color color,
      ) {
    return BoxDecoration(
        borderRadius: borderRadius,
            color: color,
    );
  }

  decorations(
    BorderRadius borderRadius,
    Color color,
    Border border,
  ) {
    return BoxDecoration(
      borderRadius: borderRadius,
      color: color,
      border: border,
    );
  }

  borders() {
    return Border.all(color: HexColor(pastelgreen500), width: 1);
  }

  bordersLight() {
    return Border.all(color: HexColor(pastelgreen100), width: 1);
  }

  bordersDark() {
    return Border.all(color: HexColor(pastelgreen900), width: 1);
  }

  List<String> btnlist = [
    "Lakes",
    "Jungle",
    " Mountain",
    "Beaches",
    "Museums",
    " ArtGallery",
    "Parks"
  ];

  btmbar(
    IconData icon,
    String label,
  ) {
    return BottomNavigationBarItem(

        icon: Icon(
          icon,
          color: Colors.green.shade400,
        ),
        label: label);
  }

  row(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(text),
      ],
    );
  }
 loadPages(Widget t ,BuildContext context){
return   Navigator.push(
    context,
    PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.center,
        duration: Duration(milliseconds: 400),
        isIos: true,
        child: t));
}

decor(){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      border: Border(right: BorderSide.none),
      shape: BoxShape.rectangle
    );
}
  decor1(){
    return BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        color: Colors.white,
        border: Border(right: BorderSide.none),
        shape: BoxShape.rectangle
    );
  }

  List<String>faciList=["Restaurant","Petrol Pump","Police Station","Restrooms","Walkways","Open Gym"];
  List<IconData> iconList = [
    Icons.emoji_food_beverage_outlined,
    Icons.wifi,
    Icons.wash,
    Icons.directions_walk_outlined,
    Icons.sports_gymnastics,
  ];

  spinkit(){
    return SpinKitSpinningLines(
      duration: Duration(seconds: 2),
      color: Colors.white,
      size: 20,
    );
  }














  }

