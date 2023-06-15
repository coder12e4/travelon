

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:travlon/utils/widgets/txtOftravalon.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';


class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      toolbarHeight: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        )
      ),
      title: Text("Discover",style: TextStyle(fontSize: 16,fontFamily: "Medium",),),
      actions: [
        IconButton(onPressed: (){}, icon:Icon(Icons.notifications_none)),
        SizedBox(
          width: 16,
        )
      ],
      backgroundColor: HexColor(Constants().pastelgreen300),
      elevation: 0,
      centerTitle:true ,
    );
  }
}
