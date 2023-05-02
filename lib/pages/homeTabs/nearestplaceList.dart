import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../repository/loginrepository.dart';
import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/btnTravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';

class nearBy extends StatefulWidget {
  final  List<Nearplaces>? nearplaces;
  const nearBy({Key? key, this.nearplaces}) : super(key: key);

  @override
  State<nearBy> createState() => _nearByState();
}

class _nearByState extends State<nearBy> {
  List<Nearplaces>? nearplaces=[];
  @override
  void initState() {
    nearplaces=widget.nearplaces;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(

          itemCount: nearplaces!.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: Constants().radiusreturning(),
              ),
              margin: EdgeInsets.all(10),
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .4,

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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          txtOftravalon(
                              data: nearplaces![index].placeName!,
                              textStyle: Constants().boldstyleblack(14)),
                          txtOftravalon(
                              data: nearplaces![index].review!,
                              textStyle: Constants().Regularstyleblack(12)),

                          Container(
                            height: 30,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                txtOftravalon(
                                    data: "Location",
                                    textStyle: Constants().lightstyle1(10)

                                ),




                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                  color: HexColor(Constants().pastelgreen400),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(20)
                                    )

                                  ),
                                  alignment: Alignment.center,

                                  child: txtOftravalon(
                                    data: "Open",
                                    textStyle: Constants().Regularstyleblack(14),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
