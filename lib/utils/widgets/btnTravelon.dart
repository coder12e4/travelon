import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

class btnTravelon extends StatelessWidget {
  final Function function;
  final BoxDecoration boxDecoration;
  final height;
  final width;
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
