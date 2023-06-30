

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
class nearbyappBar extends StatelessWidget {
  const nearbyappBar({Key? key}) : super(key: key);

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
      leading:  IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back,color: Colors.black,)),
      title: Text("Nearby Places",style: TextStyle(fontSize: 20,fontFamily: "Medium",color: Colors.black),),

      backgroundColor: Colors.white,
      elevation: 0,

    );
  }
}
class addplaceappBar extends StatelessWidget {
  
  const addplaceappBar({Key? key, }) : super(key: key);

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
      leading:  IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back,color: Colors.black,)),
      title:txtOftravalon(data: "Add new places", textStyle:Constants().mediumstyleblackmon(20)),

      backgroundColor: Colors.white,
      elevation: 0,





    );
  }
}
class travelogappBar extends StatelessWidget {

  const travelogappBar({Key? key, }) : super(key: key);

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
      leading:  IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back,color: Colors.black,)),
      title:txtOftravalon(data: "Add new Travelog", textStyle:Constants().mediumstyleblackmon(20)),

      backgroundColor: Colors.white,
      elevation: 0,





    );
  }
}
