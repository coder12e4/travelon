import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import 'homeTabs/travloglList.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title:Container(
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  txtOftravalon(data:"Street name", textStyle: Constants().boldstylegreen(16)),
                  txtOftravalon(data: "District state name", textStyle: Constants().lightstyle1(8)),
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notification_add_outlined,
                    color: Colors.grey.shade500,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.account_tree_outlined,
                    color: Colors.grey.shade500,
                  ))
            ],
          ),
         
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: 30,
                  width: 500,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Constants().btnlist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 8),
                          alignment: Alignment.center,
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: Constants().radiusreturning(),
                            border: Border.all(color: HexColor(Constants().pastelgreen100),width: 1)
                          ),
                          child: Text(
                            Constants().btnlist[index].toString(),
                            style: Constants().StyleMediumBlack(12),
                          ),
                        );
                      }),
                ),
                TabBar(
                  indicatorColor: HexColor(Constants().pastelgreen300),
                  labelColor: HexColor(Constants().pastelgreen600),
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 1,
                  labelStyle: Constants().boldstylegreen(14),
                  tabs: [
                    Tab( text: "Nearest Spots",),
                    Tab( text: "Travelogs")
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      travelogList(),
                      travelogList()

                    ],
                  ),
                ),




              ],
            ),
          ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            Constants().btmbar(Icons.home_filled, "Home"),
            Constants().btmbar(Icons.my_location, "Location"),
            Constants().btmbar(Icons.reviews_outlined, "Review"),
            Constants().btmbar(Icons.person_2_outlined, "Profile")
          ],
        ),
      ),
    );
  }
}
