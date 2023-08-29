import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';

class edttravlon extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;

  const edttravlon({
    Key? key,
    required this.textEditingController,
    required this.hinttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(


      child: TextField(
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          alignLabelWithHint: true,
          hintStyle: Constants().RegularstyleblackMon(14),
          enabledBorder: OutlineInputBorder(
            borderRadius: Constants().radiusreturningthree(),
            borderSide: BorderSide(
              width: .5,
              color: HexColor(Constants().pastelgreen400),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: Constants().radiusreturningthree(),
            borderSide: BorderSide(
              color: HexColor(Constants().pastelgreen600),
            ),
          ),
        ),

      ),
    );
  }
}

class datetxt extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final Function function;

  const datetxt({
    Key? key,
    required this.textEditingController,
    required this.hinttext,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        function();
      },
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hinttext,
        hintStyle: Constants().RegularstyleblackMon(14),
        enabledBorder: OutlineInputBorder(
          borderRadius: Constants().radiusreturningthree(),
          borderSide: BorderSide(
            width: .5,
            color:HexColor(Constants().pastelgreen400),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: Constants().radiusreturningthree(),
          borderSide: BorderSide(
            color: HexColor(Constants().pastelgreen700),
          ),
        ),
      ),
    );
  }
}
