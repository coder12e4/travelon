import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/pages/homeScreen.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/widgets/btnTravelon.dart';

class profileView extends StatefulWidget {
  const profileView({Key? key}) : super(key: key);

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset("assets/images/profile.jpg", fit: BoxFit.fill),
            Positioned(
              top: 20,
              left: 20,
              child: btntwoTravelon(
                  function: () {
                    Constants().loadPages(homeScreen(), context);
                  },
                  height: 40,
                  width: 40,
                  childWid: Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: Colors.black,
                  )),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .8,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: Constants().radiusreturningone(),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        btnplaceview(
                            function: () {},
                            childWid: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                txtOftravalon(
                                    data: "Edit Profile",
                                    textStyle: Constants().Stylemediuemgreen(14)),
                                Icon(
                                  Icons.edit,
                                  color:HexColor(Constants().pastelgreen400),
                                  size: 14,
                                ),
                              ],
                            )),
                      ],
                    ),
                    txtOftravalon(
                        data: "Taman Oberoi",
                        textStyle: Constants().boldstyleblack(24)),
                    txtOftravalon(
                        data: "@OberoiTam",
                        textStyle: Constants().Regularstylegrey(14)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                          size: 14,
                        ),
                        txtOftravalon(
                            data: " Joined Jun 2022",
                            textStyle: Constants().Regularstylegrey(14)),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            txtOftravalon(data: "15.3K", textStyle:Constants().boldstyleblack(20)),
                            txtOftravalon(data: "points", textStyle:Constants().mediumstyleblack(18)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            txtOftravalon(data: "500K", textStyle:Constants().boldstyleblack(20)),
                            txtOftravalon(data: "followers", textStyle:Constants().mediumstyleblack(18)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            txtOftravalon(data: "1.2K", textStyle:Constants().boldstyleblack(20)),
                            txtOftravalon(data: "following", textStyle:Constants().mediumstyleblack(18)),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      height: 20,

                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: Constants().radiusreturningone()),
                     elevation: 4,
                      child: Container(
                        height: 150,
                        width: 400,
                        padding: EdgeInsets.all(12),
                        decoration: Constants().decorations(Constants().radiusreturningone(), Colors.green.shade100, Border(top: BorderSide.none)),
                        child: txtOftravalon(data: "Profile View",textStyle:Constants().mediumstyleblack(18) ,),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: Constants().radiusreturningone()),
                      elevation: 4,
                      child: Container(
                        height: 150,
                        width: 400,
                        padding: EdgeInsets.all(12),
                        decoration: Constants().decorations(Constants().radiusreturningone(), Colors.green.shade100, Border(top: BorderSide.none)),
                      child: txtOftravalon(data: "Your Reviews",textStyle:Constants().mediumstyleblack(18) ,),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Positioned(
              top: 110,
              left: 20,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/beard.jpg"),
                backgroundColor: Colors.transparent,
                radius: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
