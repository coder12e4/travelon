


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class toolS with ChangeNotifier {
  Widget cont1() {
    return Container(
      height: 70,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow,
      ),
      child: Text(
        "Get Started",
        style: TextStyle(
          fontFamily: 'bold',
          fontSize: 20,
        ),
      ),
    );
  }

  Widget text1(String value, double size, var weight, var color, var font) {
    return Text(
      value,
      style: TextStyle(
          fontSize: size, fontWeight: weight, color: color, fontFamily: font),
    );
  }

  Widget cont2(
      {required Color color,
      required String label,
      required double width ,
      required double height,
        required var sty
      }) {

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(20),

      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Text(
        label,
        style: sty,
      ),
    );
  }

  Widget cont3(
      {required Color color,
      required String label,
      double width = 100,
      double height = 100}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
  Widget cont4(
      {required Color color,
        required String label,
        double width = 400,
        double height = 100}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
  Widget tfd({required var contr}){
    return TextField(
      textAlign: TextAlign.left,
      controller: contr,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
        
      ),
      
      
    );
  }

}
