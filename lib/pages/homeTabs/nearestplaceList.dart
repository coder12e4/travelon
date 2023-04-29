import 'package:flutter/material.dart';

import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/btnTravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';

class nearBy extends StatefulWidget {
  const nearBy({Key? key}) : super(key: key);

  @override
  State<nearBy> createState() => _nearByState();
}

class _nearByState extends State<nearBy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: Constants().radiusreturning(),
              ),
              margin: EdgeInsets.all(10),
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .9,
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * .4,
                          width: MediaQuery.of(context).size.width * .4,
                          margin: EdgeInsets.only(right: 12),
                          child: ClipRRect(
                            borderRadius: Constants().radiusreturning(),
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
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        txtOftravalon(
                            data: "Public Park",
                            textStyle: Constants().boldstyleblack(24)),
                        txtOftravalon(
                            data: "description",
                            textStyle: Constants().Regularstyleblack(16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.green,
                            ),
                            txtOftravalon(
                                data: "Location",
                                textStyle: Constants().lightstyle1(16)),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              height: 20,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.elliptical(
                                          MediaQuery.of(context).size.width,
                                          100.0),
                                    top: Radius.elliptical(
                                        MediaQuery.of(context).size.width,
                                        100.0),
                                  ),

                                  color: Colors.green.shade800),
                              child: txtOftravalon(
                                data: "Open",
                                textStyle: Constants().Regularstyleblack(14),
                              ),
                            ),
                          ],
                        )
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
