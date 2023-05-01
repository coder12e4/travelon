import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/constants/constantsOfTravlne.dart';

class placeView extends StatefulWidget {
  const placeView({Key? key}) : super(key: key);

  @override
  State<placeView> createState() => _placeViewState();
}

class _placeViewState extends State<placeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/park.jpg",
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
                        data: "Public Park",
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
                            "Discover nature's playground at our public park - where fun, relaxation, and adventure meet. Breathe in fresh air, soak up the sun, and explore our lush green spaces. From picnicking to sports and everything in between, there's something for everyone here.",
                        textStyle: Constants().Regularstyleblack(14)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        txtOftravalon(
                            data: "Facility",
                            textStyle: Constants().StyleMediumBlack(16)),
                        txtOftravalon(
                            data: "See all",
                            textStyle: Constants().Stylemediuemgreen(14))
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: btnthreeTravelon(
                        function: () {},
                        height: 50,
                        width: double.infinity,
                        childWid: txtOftravalon(
                            data: "Let's Go",
                            textStyle: Constants().boldstylewhite(16)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
