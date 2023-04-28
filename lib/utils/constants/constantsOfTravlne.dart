import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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

  boldstyle1(double size) {
    return TextStyle(
        fontFamily: "bold", fontSize: size, color: HexColor(pastelgreen500));
  }

  mediumstyle1(double size) {
    return TextStyle(
      fontFamily: "semibold",
      color: HexColor(pastelgreen400),
      fontSize: size,
    );
  }

  Regularstyle1(double size) {
    return TextStyle(
        fontFamily: "regular", fontSize: size, color: HexColor(pastelgreen800));
  }

  lightstyle1(double size) {
    return TextStyle(
        fontFamily: "light", fontSize: size, color: HexColor(pastelgreen900));
  }

  radiusreturning(){
    return BorderRadius.circular(10);
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

  borders(){
    return Border.all(color: HexColor(pastelgreen500),width: 1);
  }
  bordersLight(){
    return Border.all(color: HexColor(pastelgreen100),width: 1);
  }
  bordersDark(){
    return Border.all(color: HexColor(pastelgreen900),width: 1);
  }



}
