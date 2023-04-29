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
