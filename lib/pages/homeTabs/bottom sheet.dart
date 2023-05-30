import 'package:flutter/material.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

class btmSheet extends StatefulWidget {
  const btmSheet({Key? key}) : super(key: key);

  @override
  State<btmSheet> createState() => _btmSheetState();
}

class _btmSheetState extends State<btmSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Chip(label: Text("Direction"),avatar: Icon(Icons.directions),)


          ],
        ),
      ),
    );
  }
}
void btSheet(BuildContext context){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
  context: context,
  builder: (context) {
    return Container(
      height: 500,

      padding: EdgeInsets.all(8),

      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, int) {
                    return Container(
                      height: 400,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            color: Colors.white,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, int) {
                                  return Row(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: Constants()
                                                .radiusreturningone()),
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius: Constants()
                                                  .radiusreturningone(),
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              txtOftravalon(
                                  data: "FreshDay Stores",
                                  textStyle:
                                  Constants().mediumstyleblack(16)),
                              btntwoTravelon(
                                  function: () {},
                                  childWid: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              txtOftravalon(
                                  data: "4.5",
                                  textStyle:
                                  Constants().Regularstylegrey(14)),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              )
                            ],
                          ),
                          txtOftravalon(
                              data: "Grocery Store . 220 m",
                              textStyle: Constants().Regularstylegrey(14)),
                          txtOftravalon(
                              data: "Closed . Opens 8 am",
                              textStyle: Constants().Regularstylegrey(14)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              btntwoTravelon(
                                  function: () {},
                                  childWid: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.directions,
                                        color: Colors.blue,
                                      ),
                                      txtOftravalon(
                                          data: "Directions",
                                          textStyle: Constants()
                                              .StyleMediumBlue(14))
                                    ],
                                  )),
                              btntwoTravelon(
                                  function: () {},
                                  childWid: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.ios_share,
                                        color: Colors.blue,
                                      ),
                                      txtOftravalon(
                                          data: "Share",
                                          textStyle: Constants()
                                              .StyleMediumBlue(14))
                                    ],
                                  )),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 4,

                          )

                        ],
                      ),
                    );
                  },


                ),
              )

            ],
          ),
        ],
      ),
    );
  } );
}

class animTest extends StatefulWidget {
  const animTest({Key? key}) : super(key: key);

  @override
  State<animTest> createState() => _animTestState();
}

class _animTestState extends State<animTest> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
