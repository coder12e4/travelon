import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travlon/pages/homeTabs/nearestplaceList.dart';
import 'package:travlon/repository/loginrepository.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/widgets/btnTravelon.dart';
import '../homoeScreen.dart';
import 'loginPage.dart';
class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
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
       /*         Constants().loadPages(homeScreen(objlogin:), context);
       */       },
              height: 50,
              width: 400,
              childWid: txtOftravalon(
                  data: "Choose Location", textStyle: Constants().boldstylewhite(16)),
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
