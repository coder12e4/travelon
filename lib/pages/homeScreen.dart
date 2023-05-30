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

        String? name;
        String? place;
        String? email;
        String? password;
        String? sId;
        List<Nearplaces>? nearplaces=[];
        List<Tavologs>? tavologs=[];
        String? createdAt;
        int? iV;



@override
  void initState() {
  objlogin=widget.objlogin;
  name=objlogin!.data!.name;
  place=objlogin!.data!.place;

  nearplaces=objlogin!.data!.nearplaces;
  tavologs=objlogin!.data!.tavologs;
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
                          txtOftravalon(data:"hi"+ name!, textStyle: Constants().boldstylegreen(16)),
                          txtOftravalon(data: place!, textStyle: Constants().lightstyle1(8)),
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
                      nearBy(nearplaces: nearplaces,),
                      travelogList(tavologs: tavologs,)

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
