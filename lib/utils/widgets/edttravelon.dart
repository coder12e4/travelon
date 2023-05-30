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
    return TextField(
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        filled: true,
        fillColor:  Colors.green.shade200,
        hintText: hinttext,
        hintStyle: Constants(). Regularstyleblack(14),
        enabledBorder: OutlineInputBorder(
          borderRadius: Constants().radiusreturningthree(),
          borderSide: BorderSide(
            width: 1,
            color: Colors.green.shade700,
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
class datetxt extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final Function function;

  const datetxt({
    Key? key,
    required this.textEditingController,
    required this.hinttext, required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: (){
        function();
      },
      controller: textEditingController,

      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.green.shade200,
        hintText: hinttext,
        hintStyle: Constants(). RegularstyleblackMon(14),

        enabledBorder: OutlineInputBorder(
          borderRadius: Constants().radiusreturningthree(),
          borderSide: BorderSide(
            width: 1,
            color: Colors.green.shade700,
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
