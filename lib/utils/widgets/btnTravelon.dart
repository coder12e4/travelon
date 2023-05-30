import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

class btnTravelon extends StatelessWidget {
  final Function function;
  final BoxDecoration boxDecoration;
  final  double? height;
  final double? width;
  final Widget childWid;

  const btnTravelon(
      {Key? key,
      required this.function,
      required this.boxDecoration,
      this.height,
      this.width, required this.childWid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: height,
        width: width,

        alignment: Alignment.center,
        decoration: boxDecoration,
        child: childWid,
      ),
    );
  }
}
class btnoneTravelon extends StatelessWidget {
  final Function function;

  final  double? height;
  final double? width;
  final Widget childWid;

  const btnoneTravelon(
      {Key? key,
        required this.function,

        this.height,
        this.width, required this.childWid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(24,),color:HexColor(Constants().pastelgreen200)

        ),
        child: childWid,
      ),
    );
  }
}
class btntwoTravelon extends StatelessWidget {
  final Function function;

  final  double? height;
  final double? width;
  final Widget childWid;

  const btntwoTravelon(
      {Key? key,
        required this.function,

        this.height,
        this.width, required this.childWid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding:EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30,),color: Colors.white
        ),
        child: childWid,
      ),
    );
  }
}
class btnthreeTravelon extends StatelessWidget {
  final Function function;

  final  double? height;
  final double? width;
  final Widget childWid;

  const btnthreeTravelon(
      {Key? key,
        required this.function,

        this.height,
        this.width, required this.childWid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding:EdgeInsets.all(10),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20,),color:Colors.green.shade700
        ),
        child: childWid,
      ),
    );
  }








}
class btnplaceview extends StatelessWidget {
  final Function function;

  final  double? height;
  final double? width;
  final Widget childWid;

  const btnplaceview(
      {Key? key,
        required this.function,

        this.height,
        this.width, required this.childWid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding:EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30,),color: Colors.grey.shade300
        ),
        child: childWid,
      ),
    );
  }
}
