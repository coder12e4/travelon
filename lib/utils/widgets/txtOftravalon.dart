import 'package:flutter/material.dart';

class txtOftravalon extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  const txtOftravalon({Key? key, required this.data, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: textStyle,
      textAlign: TextAlign.justify,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,

    );
  }
}
class txtOftravalontwo extends StatelessWidget {
  final String data;
  final TextStyle textStyle;
  const txtOftravalontwo({Key? key, required this.data, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: textStyle,
      textAlign: TextAlign.center,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,

    );
  }
}
class txtExt extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color? fontColor;
  final TextAlign alignment;
  final String font;
  const txtExt(
      {Key? key,
        this.text,
        this.fontSize,
        this.fontWeight = FontWeight.normal,
        this.fontColor = Colors.black,
        this.alignment = TextAlign.center,
        this.font = "Poppins ExtraBold"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontFamily: font,
          fontSize: fontSize),
      textAlign: alignment,
    );
  }
}