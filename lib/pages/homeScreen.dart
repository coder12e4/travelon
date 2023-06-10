import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../models/nearbyModel.dart';
import 'homeTabs/nearestplaceList.dart';
import 'homeTabs/travloglList.dart';

class homeScreen extends StatefulWidget {
  final nearbyModel objnearby;

  const homeScreen({Key? key,required this.objnearby}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  nearbyModel? objnearby;
  Data? data;
  String? sId;
  String? name;
  String? detail;
  String? address;
  String? country;
  String? state;
  String? district;
  Location? location;
  bool? status;
  String? totalRating;
  int? iV;
  double? distanceInMeters;

  List<String>? image = [];
  List<NearPlaces>? nearPlaces = [];
  List<TravelLogs>? travelLogs = [];

  @override
  void initState() {
    objnearby = widget.objnearby;
    data = objnearby!.data;


    String? sId;
    //name= objnearby!.data;
    String? detail;
    String? address;
    String? country;
    String? state;
    String? district;
    Location? location;
    bool? status;
    String? totalRating;
    int? iV;
    double? distanceInMeters;

   // image =objnearby!.data!;
     nearPlaces = objnearby!.data!.nearPlaces;
     travelLogs = objnearby!.data!.travelLogs;





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
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            txtOftravalon(
                                data: "hi" ,
                                textStyle: Constants().boldstylegreen(16)),
                            txtOftravalon(
                                data: "India",
                                textStyle: Constants().lightstyle1(8)),
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
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
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
                              border: Border.all(
                                  color: HexColor(Constants().pastelgreen100),
                                  width: 1)),
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
                    Tab(
                      text: "Nearest Spots",
                    ),
                    Tab(text: "Travelogs")
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      nearBy(nearPlaces: nearPlaces),
                      travelogList(travelLogs: travelLogs)
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
