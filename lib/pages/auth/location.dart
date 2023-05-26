import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travlon/pages/homeTabs/nearestplaceList.dart';
import 'package:travlon/repository/loginrepository.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/widgets/btnTravelon.dart';
import '../homeScreen.dart';
import 'loginPage.dart';
class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  String dropdownValue="10m";
  List<String>items=["10m","25m","50m","100m","500m","1KM"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Icon(Icons.location_on_outlined,size: 80,color: Colors.green.shade700,),
            txtOftravalon(data: "Access Your", textStyle: Constants().boldstyleblack(14)),
            txtOftravalon(data: "Location", textStyle: Constants().boldstyleblack(20)),
            Expanded(
              child: SizedBox(

              ),
            ),

            btnthreeTravelon(
              function: () {

         },
              height: 80,
              width: 400,
              childWid: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  txtOftravalon(
                      data: "Choose Radius", textStyle: Constants().boldstylewhite(16)),
                  DropdownButton(
                    dropdownColor: Colors.green.shade700,
                    menuMaxHeight: 100,
                    iconEnabledColor: HexColor(Constants().pastelgreen400,),
                    style: TextStyle(color: HexColor(Constants().pastelgreen400,)),
                    value: dropdownValue,
                      items:items.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem(
                            value: value,
                            child: txtOftravalon(data: value, textStyle:Constants().boldstylewhite(16) ));
                      }) .toList(),

                      onChanged: (String? newValue){
                      setState(() {
                        dropdownValue=newValue!;
                      });
                      })
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            btnthreeTravelon(
              function: () {
                Constants().loadPages(login(), context);
              },
              height: 50,
              width: 400,
              childWid: txtOftravalon(
                  data: "Log In", textStyle: Constants().boldstylewhite(16)),
            ),




          ],
        ),
      ),
    );

  }
}
