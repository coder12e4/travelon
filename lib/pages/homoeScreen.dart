import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/repository/loginrepository.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import 'homeTabs/nearestplaceList.dart';
import 'homeTabs/travloglList.dart';

class homeScreen extends StatefulWidget {
  final loginModel objlogin;



  const homeScreen({Key? key, required this.objlogin}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
        loginModel? objlogin;
        Data? data;
        List<Nearplaces>? nearplaces;
        List<Tavologs>? tavologs;


@override
  void initState() {
  objlogin=widget.objlogin;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

         
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  child: Row(children: [
                    SizedBox(width: 20,),
                    Container(
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
                    Expanded(child: SizedBox()),
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
                        )),
                    SizedBox(width: 20,),

                  ],),
                ),
                Container(
                  color: Colors.white,
                  height: 30,
                  width: 500,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:Constants().btnlist.length,
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
                      ListView.builder(
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
                                              data: "Public Park",
                                              textStyle: Constants().boldstyleblack(14)),
                                          txtOftravalon(
                                              data: nearplaces![index].review.toString(),
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
    ));
  }
}
