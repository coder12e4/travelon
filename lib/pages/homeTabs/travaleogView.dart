import 'package:flutter/material.dart';

import '../../models/nearbyModel.dart';
import '../../repository/loginrepository.dart';
import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/btnTravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';

class travelogView extends StatefulWidget {
  final  List<TravelLogs>? travelLogs;
  const travelogView({Key? key, this.travelLogs, }) : super(key: key);

  @override
  State<travelogView> createState() => _travelogViewState();
}

class _travelogViewState extends State<travelogView> {
  List<TravelLogs>? travelLogs=[];
  @override
  void initState() {
    travelLogs =widget.travelLogs;
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/waterfalls.jpg",
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 40,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  btntwoTravelon(
                      function: () {},
                      height: 50,
                      width: 50,
                      childWid: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  btntwoTravelon(
                      function: () {},
                      height: 50,
                      width: 50,
                      childWid: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: Constants().radiusreturningone(),
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    txtOftravalon(
                    data:"Toto Waterfalls",
                    textStyle: Constants().StyleMediumBlack(20)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.green,
                    ),
                    txtOftravalon(
                        data: "Street No.2",
                        textStyle: Constants().Regularstyleblack(14)),
                    SizedBox(
                      width: 230,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    txtOftravalon(
                        data: "4.5",
                        textStyle: Constants().Regularstyleblack(14)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                txtOftravalon(
                    data:
                    "Discover nature's adventures at toto waterfalls - where fun, relaxation, and adventure meet. Breathe in fresh air, soak up the sun, and explore our lush green spaces. From picnicking to sports and everything in between, there's something for everyone here.",
                    textStyle: Constants().Regularstyleblack(14)),
                SizedBox(
                  height: 20,
                ),
                      txtOftravalon(data: "More Images", textStyle: Constants().StyleMediumBlack(16)),

                      Card(
                        shape: RoundedRectangleBorder(borderRadius: Constants().radiusreturningone()),
                        child: Container(
                          height: 150,
                          width: 400,
                          decoration: Constants().decorations(Constants().radiusreturningone(), Colors.green.shade100, Border(top: BorderSide.none)),
                        ),
                      ),
                      txtOftravalon(data: "More Reviews", textStyle: Constants().StyleMediumBlack(16)),

                      Card(
                        shape: RoundedRectangleBorder(borderRadius: Constants().radiusreturningone()),
                        child: Container(
                          height: 150,
                          width: 400,
                          decoration: Constants().decorations(Constants().radiusreturningone(), Colors.green.shade100, Border(top: BorderSide.none)),
                        ),
                      ),

                ]
                )
              ),
            ),
          ],
        ),
      ),
    );


  }
}
