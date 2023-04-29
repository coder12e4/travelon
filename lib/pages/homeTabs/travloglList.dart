import 'package:flutter/material.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';
class travelogList extends StatefulWidget {
  const travelogList({Key? key}) : super(key: key);

  @override
  State<travelogList> createState() => _travelogListState();
}

class _travelogListState extends State<travelogList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: Constants().radiusreturning(),
              ),
              margin: EdgeInsets.all(10),
              child: btntwoTravelon(
                function: () {},
                height: 400,
                width: 400,
                childWid: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height:
                          MediaQuery.of(context).size.width * .5,
                          width:
                          MediaQuery.of(context).size.width * .9,
                          child: ClipRRect(
                            borderRadius:
                            Constants().radiusreturning(),
                            child: Image.asset(
                              "assets/images/park.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 18,
                            top: 18,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 24,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        txtOftravalon(
                            data: "headingOne",
                            textStyle:
                            Constants().boldstyleblack(24)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: txtOftravalon(
                            data: "Discover nature's playground at our public park - where fun, relaxation, and adventure meet. Breathe in fresh air, soak up the sun, and explore our lush green spaces. From picnicking to sports and everything in between, there's something for everyone here.",
                            textStyle:
                            Constants(). Regularstyleblack(14),),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
