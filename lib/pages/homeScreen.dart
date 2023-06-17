import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travlon/pages/homeTabs/profileView.dart';
import 'package:travlon/pages/profilepage.dart';

import 'package:travlon/utils/constants/constantsOfTravlne.dart';

import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../Utils/widgets/appbar.dart';
import '../Utils/widgets/bottombar.dart';
import '../models/nearbyModel.dart';
import 'homeTabs/nearestplaceList.dart';
import 'homeTabs/travloglList.dart';

class homeScreen extends StatefulWidget {
  final List<NearPlaces>? nearPlaces;
  final List<TravelLogs>? travelLogs;

  const homeScreen({Key? key, this.nearPlaces, this.travelLogs})
      : super(key: key);

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
    nearPlaces = widget.nearPlaces;
    travelLogs = widget.travelLogs;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: appBar()),
      drawer: drawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                OutlineSearchBar(
                  borderRadius: BorderRadius.circular(20),
                  borderColor: Colors.white,
                  searchButtonIconColor: Colors.green,
                  elevation: 2,
                  hintText: "Search Destinations...",
                  padding: EdgeInsets.only(left: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.transparent,
                  height: 30,
                  width:double.infinity,
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
                                  width: 1),
                              color: Colors.grey.shade100),
                          child: Text(
                            Constants().btnlist[index].toString(),
                            style: Constants().StyleMediumBlack(12),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    txtOftravalon(
                        data: "Popular",
                        textStyle: Constants().mediumstyleblackmon(16)),
                    txtOftravalon(
                        data: "View All",
                        textStyle: Constants().RegularstyleblackMon(14)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  padding: EdgeInsets.all(10),
                  color: Colors.grey.shade100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(),
                          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                        ],
                      ),
                      Divider(),
                      Image.asset(
                        "assets/images/waterfalls.jpg",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.favorite_border)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chat_bubble_outline_rounded)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.share_rounded)),
                          Spacer(),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.bookmark_border)),
                        ],
                      ),

                      txtOftravalon(
                          data: "Amal sekhar",
                          textStyle: Constants().mediumstyleblackmon(12)),
                      txtOftravalon(
                          data:
                          '''Adyanpara Waterfalls: Adyanpara Waterfalls is a captivating waterfall nestled in the lush green forests of Nilambur. It is an ideal spot for nature enthusiasts, offering a refreshing atmosphere and the opportunity to witness the cascading waters.''',
                          textStyle: Constants().RegularstyleblackMon(12)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    txtOftravalon(
                        data: "Recommended",
                        textStyle: Constants().mediumstyleblackmon(16)),
                    txtOftravalon(
                        data: "View All",
                        textStyle: Constants().RegularstyleblackMon(14)),
                  ],
                ),*/
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context,int){
                      return Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: Constants().radiusreturning()
                      ),
                      child: Container(
                      height: MediaQuery.of(context).size.height*.21,
                      width: 200,
                      padding: EdgeInsets.all(6),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      ClipRRect(
                      borderRadius: Constants().radiusreturning(),
                      child: Image.asset("assets/images/park.jpg",
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,

                      ),
                      ),
                      SizedBox(
                      height: 6,
                      ),
                      txtOftravalon(data: " Public Park", textStyle: Constants().boldstyleblackmon(12)),
                      SizedBox(
                      height: 6,
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Icon(Icons.location_on_outlined,color: Colors.green.shade300,size: 14,),
                      txtOftravalon(data: "Kozhikode", textStyle: Constants().mediumstyleblackmon(12)),
                      Spacer(),
                      txtOftravalon(data: "4.5", textStyle: Constants().mediumstyleblackmon(12)),
                      Icon(Icons.star,color: Colors.yellow,size: 14,),

                      ],
                      )
                      ],
                      ),
                      ),
                      );
                    },

                  ),
                )
              ],
            ),
          ],

        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: HexColor(Constants().pastelgreen300),
        ),
      bottomNavigationBar: bottombarnotch()
    );
  }
}
